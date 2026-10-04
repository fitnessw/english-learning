<!--
Canonical copy: personal-toolkits/agent-workspace/pull_request_template.md
Synced into every repo by personal-toolkits/scripts/git/sync-pr-template.sh. Edit the canonical copy, not this one.
Agents: `gh pr create --body` skips this file, so build your body from it yourself. Every `##` section is required.
-->

## Intent

<!-- What this change is for, in one or two sentences. The reviewer checks the diff against this. -->

## Acceptance criteria

<!-- Observable conditions that mean the change is done. One per line. -->
- [ ]

## Verification

<!-- Exact commands you ran and their result. "Not run" is allowed if you say why. -->

## Risk

<!-- Touched high-risk areas (user data, Firestore rules/indexes, migrations, billing, shared packages,
classifiers, watch code), blast radius, and how to roll back. "None" is a valid answer. -->

## Lessons

<!-- Required for every fix. State the violated invariant in one sentence, and the path where it is now
recorded, in the strongest form that fits: test > check/lint > closest current doc > skill > AGENTS.md.
Or write "None — <reason>". See the promote-learning skill. -->
- Invariant:
- Recorded at:

## Provenance

<!-- Served model MUST be the output of personal-toolkits/scripts/git/agent-provenance.py.
It reads the session transcript, so it shows the model that actually answered rather than the one the
agent believes it is. Paste its output line as-is. Do not hand-edit it. -->
- Agent tool:
- Served model:
- Human reviewed the code: no

## Reviewer notes

<!-- Filled in by the PR reviewer (tiered review), not the author. -->
