# AGENTS.md

This is a personal repository. Do not apply these commit rules to company repositories unless their own instructions request it.

## Commit Attribution

When an AI coding agent creates a commit in this repo, do not run `git commit` directly. Use:

```bash
AGENT_TOOL="<Codex | Claude Code | Cursor | Antigravity | OpenCode | Human>" \
AGENT_MODEL="<exact model name or unknown>" \
scripts/agent-commit "commit message"
```

If available, also set:

```bash
AGENT_RUN_ID="<task/thread/session id>" HUMAN_OWNER="<human requester>"
```

Required trailers are `Agent-Tool`, `Agent-Model`, and `Human-Owner`. `scripts/agent-commit` fills `Human-Owner` from `git config user.name/user.email` when it is not provided.

Do not use `Co-authored-by` for AI tool attribution. Keep Git author/committer as the responsible human account.

On a new machine, enable the repo-local hook with:

```bash
scripts/setup-agent-attribution.sh
scripts/check-agent-attribution.sh
```
