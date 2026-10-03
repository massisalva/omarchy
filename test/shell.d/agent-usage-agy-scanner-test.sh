#!/bin/bash

source "$(dirname "$0")/base-test.sh"

require_command jq
require_command python3

TEST_HOME=$(mktemp -d)
trap 'rm -rf "$TEST_HOME"' EXIT

# 1. Unconfigured state without CLI or data
result=$(HOME="$TEST_HOME" AGY_CONFIG_DIR="$TEST_HOME/.gemini/missing" PATH="/dev/null" \
  "$ROOT/bin/omarchy-agent-usage-agy")

[[ $(jq -r '.id + ":" + (.ready | tostring)' <<<"$result") == "agy:false" ]] ||
  fail "Antigravity collector handles unconfigured state gracefully" "$result"
pass "Antigravity collector handles unconfigured state gracefully"

# 2. Native Antigravity CLI structure
agy_dir="$TEST_HOME/.gemini/antigravity-cli"
mkdir -p "$agy_dir/brain/session-1/.system_generated/logs"

today_ms=$(python3 -c 'import time; print(int(time.time() * 1000))')
cat >"$agy_dir/history.jsonl" <<EOF
{"display":"hello","timestamp":$today_ms,"workspace":"$TEST_HOME/work","conversationId":"session-1"}
EOF

cat >"$agy_dir/brain/session-1/.system_generated/logs/transcript.jsonl" <<'EOF'
{"step_index":0,"source":"USER_EXPLICIT","type":"USER_INPUT","status":"DONE","created_at":"2026-10-02T12:00:00Z","content":"<USER_SETTINGS_CHANGE>\nThe user changed setting `Model Selection` to Gemini 3.8 Flash (High).\n</USER_SETTINGS_CHANGE>"}
{"step_index":1,"source":"MODEL","type":"PLANNER_RESPONSE","status":"DONE","created_at":"2026-10-02T12:00:01Z","input_tokens":100,"cache_read_tokens":50,"output_tokens":25,"content":"Hello!"}
{"step_index":2,"source":"MODEL","type":"PLANNER_RESPONSE","status":"DONE","created_at":"2026-10-02T12:00:05Z","input_tokens":120,"cache_read_tokens":60,"output_tokens":30,"content":"More output"}
EOF

result=$(HOME="$TEST_HOME" AGY_CONFIG_DIR="$agy_dir" XDG_CACHE_HOME="$TEST_HOME/.cache" \
  "$ROOT/bin/omarchy-agent-usage-agy" --force)

[[ $(jq -r '.id + ":" + (.ready | tostring)' <<<"$result") == "agy:true" ]] ||
  fail "Antigravity collector reports ready when native data exists" "$result"
pass "Antigravity collector reports ready when native data exists"

[[ $(jq -r '.todayPrompts' <<<"$result") == "1" ]] ||
  fail "Antigravity collector counts today's prompts from history" "$result"
pass "Antigravity collector counts today's prompts from history"

total_tokens=$(jq -r '.todayTotalTokens' <<<"$result")
# 100+50+25 + 120+60+30 = 385
[[ $total_tokens == "385" ]] ||
  fail "Antigravity collector calculates total tokens including cache reads" "$result"
pass "Antigravity collector calculates total tokens including cache reads"

[[ $(jq -r '.modelUsage["gemini-3.8-flash"].inputTokens' <<<"$result") == "220" ]] ||
  fail "Antigravity collector aggregates input tokens per model" "$result"
pass "Antigravity collector aggregates input tokens per model"

[[ $(jq -r '.modelUsage["gemini-3.8-flash"].outputTokens' <<<"$result") == "55" ]] ||
  fail "Antigravity collector aggregates output tokens per model" "$result"
pass "Antigravity collector aggregates output tokens per model"

[[ $(jq -r '.modelUsage["gemini-3.8-flash"].cacheReadInputTokens' <<<"$result") == "110" ]] ||
  fail "Antigravity collector aggregates cache read tokens per model" "$result"
pass "Antigravity collector aggregates cache read tokens per model"

# 3. Cache file creation
cache_file="$TEST_HOME/.cache/omarchy/agents/agy-usage.json"
[[ -f $cache_file ]] || fail "Antigravity collector creates cache file"
pass "Antigravity collector creates cache file"

# 4. Cache hit on rerun
cached_result=$(HOME="$TEST_HOME" AGY_CONFIG_DIR="$agy_dir" XDG_CACHE_HOME="$TEST_HOME/.cache" \
  "$ROOT/bin/omarchy-agent-usage-agy")

[[ $(jq -r '.todayTotalTokens' <<<"$cached_result") == "385" ]] ||
  fail "Antigravity collector reuses cache on consecutive runs" "$cached_result"
pass "Antigravity collector reuses cache on consecutive runs"
