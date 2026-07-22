#!/bin/sh
set -eu

failed=0

hooks_path=$(git config --get core.hooksPath || true)
if [ "$hooks_path" != ".githooks" ]; then
  echo "not enabled: core.hooksPath is '${hooks_path:-unset}'"
  failed=1
fi

if [ ! -x ".githooks/commit-msg" ]; then
  echo "not executable: .githooks/commit-msg"
  failed=1
fi

if [ ! -x "scripts/agent-commit" ]; then
  echo "not executable: scripts/agent-commit"
  failed=1
fi

if [ "$failed" -ne 0 ]; then
  echo
  echo "Run this from the repo root:"
  echo "  scripts/setup-agent-attribution.sh"
  exit 1
fi

echo "agent attribution hook is enabled for this repo"
