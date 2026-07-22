#!/bin/sh
set -eu

chmod +x scripts/agent-commit .githooks/commit-msg
git config core.hooksPath .githooks
echo "enabled agent attribution hook for this repo"
