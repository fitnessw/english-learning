# Skills owned by `english-learning`

A workflow or runbook specific to this repository belongs here, as:

```
.agents/skills/<skill-name>/SKILL.md
```

Keep the collection **flat** — one directory per skill, no category subfolders — and use
the same name for the directory and the front-matter `name`. Supporting files (scripts,
templates) go inside that skill's own directory.

```markdown
---
name: my-new-skill
description: What it does. Use when the user says "trigger phrase", or asks to X.
---

The description is the only text an agent sees before deciding to load the skill, so name
the words a user would actually type.

Then generate the discovery links — never hand-write one, and never copy a skill into an
agent home:

```bash
cd ../personal-toolkits
python3 scripts/agents/skills.py install              # agent homes (this repo's skills)
python3 scripts/agents/skills.py doctor-workspace --apply   # coordinator root links
```

A session opened inside this repo finds these with no setup. One opened at the coordinator
root does not see them until `doctor-workspace` links them, because a session resolves only
the nearest `.git`.

Full convention, ownership table and the six agent discovery contracts:
`personal-toolkits/scripts/agents/README.md`.
