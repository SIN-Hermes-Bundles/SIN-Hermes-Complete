#!/usr/bin/env bash
set -euo pipefail

HERMES_DIR="$HOME/.hermes/hermes-agent"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PATCH_DIR="$SCRIPT_DIR/patches/v15"

echo "   Copying patch files to $HERMES_DIR..."

cp "$PATCH_DIR/tools/tool_search.py"   "$HERMES_DIR/tools/tool_search.py"
cp "$PATCH_DIR/tools/registry.py"      "$HERMES_DIR/tools/registry.py"
cp "$PATCH_DIR/model_tools.py"         "$HERMES_DIR/model_tools.py"
cp "$PATCH_DIR/agent/prompt_builder.py"     "$HERMES_DIR/agent/prompt_builder.py"
cp "$PATCH_DIR/agent/system_prompt.py"      "$HERMES_DIR/agent/system_prompt.py"
cp "$PATCH_DIR/agent/agent_init.py"         "$HERMES_DIR/agent/agent_init.py"
cp "$PATCH_DIR/agent/conversation_loop.py"  "$HERMES_DIR/agent/conversation_loop.py"

# Clean __pycache__
find "$HERMES_DIR" -name "__pycache__" -type d -exec rm -rf {} + 2>/dev/null || true

# Inject tool_search config into ~/.hermes/config.yaml if not present
CONFIG="$HOME/.hermes/config.yaml"
if [ -f "$CONFIG" ]; then
  if ! grep -q "tool_search:" "$CONFIG" 2>/dev/null; then
    echo "" >> "$CONFIG"
    cat "$PATCH_DIR/config.yaml" >> "$CONFIG"
    echo "   ✅ tool_search config added to $CONFIG"
  else
    echo "   ⏭️  tool_search config already in $CONFIG (skipped)"
  fi
else
  cp "$PATCH_DIR/config.yaml" "$CONFIG"
  echo "   ✅ Config file created at $CONFIG"
fi

echo "   ✅ V15 patches installed"
