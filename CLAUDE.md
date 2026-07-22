# CLAUDE.md

English learning repo under the personal coordinator folder.

Read `../CLAUDE.md` for shared personal-project rules.

## Commit Attribution

When Claude Code creates a commit from this repo, do not run `git commit` directly. Use:

```bash
AGENT_TOOL="Claude Code" AGENT_MODEL="<exact model name or unknown>" scripts/agent-commit "message"
```

Do not add Claude `Co-Authored-By` trailers. AI tool attribution belongs in `Agent-Tool` and `Agent-Model` trailers.
