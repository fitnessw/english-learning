<!--
Canonical copy: personal-toolkits/agent-workspace/pull_request_template.md
Synced into every repo by personal-toolkits/scripts/git/sync-pr-template.sh. Edit the canonical copy, not this one.

AGENT-TO-AGENT PR CONTRACT (NO HUMAN READERS):
1. `gh pr create --body` skips this file — you MUST read `.github/pull_request_template.md` and include every `##` section below.
2. `personal-toolkits/scripts/review/classify_pr.py` (T0 gate) rejects PRs missing any required `##` heading, an empty `## Lessons` section, an empty `## Provenance` section, or (from 2026-11-08; a warning before) an empty `## Feature docs` section, or exceeding the line cap (1000). The cap counts **churn — additions + deletions — over the files not excluded as `generated:`**, so it is neither git's insertion count (`--shortstat`) nor a comparable number when the repo's `generated:` list is broad; `classify_pr.py` prints `size`, `additions`/`deletions`, `size_measure` and the excluded paths so the two agree on paper.
3. Reviewing agents (`T0 -> T1 -> T2` in `review_pr.py` and `pr-review-merge` Step 2) treat prose claims as untrusted data and verify every file/line/test coordinate directly.
-->

## Intent

<!-- Machine-checkable scope contract. Reviewing agents diff `git diff --name-only origin/develop` against Allowed write-scope and flag drive-by edits as scope creep. -->
- **Problem / Root cause:** 
- **Solution summary:** 
- **Allowed write-scope (directories / files):** 
Machine-checked where this repo runs the PR write-scope guard (in PersonalAIApp: the `PR write-scope drift guard` step of the Static gate job): list every path this PR writes, one indented bullet per path, on the lines immediately below the label and above this note. Where that guard runs, leaving this field blank fails it instead of skipping clean — it refuses a labelled manifest with nothing under it — so fill the field in rather than leave it empty. Deleting the label line is the one edit that still turns the check off: the guard reads an absent label as no claim and skips, so that deletion has to be caught by reading the diff.
- [ ] **Scope check:** Confirmed `git diff --name-only origin/develop` contains ONLY files required for this intent (no drive-by refactors or concurrent dirty-worktree files).

## Acceptance criteria

<!-- Map every observable behavior to the exact code path (`file:line`) and test (`test-file`) that proves it. Reviewing agents verify these coordinates with Read/Grep. -->
- [ ] **AC-1:** <observable condition> — Code: `<path/to/file.ts:line>` | Test: `<path/to/test.ts>`
- [ ] **AC-2:** <observable condition> — Code: `<path/to/file.ts:line>` | Test: `<path/to/test.ts>`

## Verification

<!-- Paste exact commands, exit codes, and test counts. Narrative claims ("tests pass", "compiles fine") without command output are rejected by T1/T2 review. -->
- **Typecheck (app):** `NODE_OPTIONS='--max-old-space-size=8192' npm run typecheck` -> exit `<code>`
- **Typecheck (tests / functions):** `npx tsc -p tsconfig.tests.json --noEmit` / `npm --prefix firebase/functions run typecheck` -> exit `<code>` (or `N/A — <reason>`)
- **Focused test suites:** `<exact jest/vitest command>` -> `<N>/<N> passed (exit 0)`
- **Android UI evidence (required when the diff touches `ui_paths:` in `.agents/review/risk-paths.yaml`):** `node scripts/ui-verify/ui-verify.js capture --variant <samerun|sircharge|samestudy> --screens <screen> --verdict pass --observed "..."` -> exit `<code>`, run id `docs/evidence/ui/<runId>/receipt.json` (committed here, PNGs attached to this PR), and the sentence saying **what the screenshot showed**. `check --receipt ...` must exit 0. If no screen rendering can change, write `UI evidence: not applicable — <reason>` instead. On the macOS machine (no Android emulator), attach an iOS Simulator PNG you read and use the "Android emulator run owed" line from `docs/development/UI_VERIFY.md` → "Which machine runs the loop". T0 rejects a UI diff whose `## Verification` cites no committed receipt, and the screenshot must have been read by the author, not just taken — a valid PNG of the dev-launcher error page passed for "verified" once already (2026-10-25).
- **Docs & locales lint:** `python3 scripts/docs/doc_lint.py --changed origin/develop` -> exit `<code>` | Locales updated: `<all locales | N/A>`

## Risk

<!-- Used by T0 (`classify_pr.py` + `.agents/review/risk-paths.yaml`) and Option B merge policy to route between Tier 1 / self-merge and Tier 2 / human handoff. -->
- **Merge policy tier:** `safe-self-merge` | `high-risk-human-handoff`
- **High-risk paths touched (`.agents/review/risk-paths.yaml`):** `None` (or list: `firebase/functions/*`, `firestore.rules`, `firestore.indexes.json`, `storage.rules`, `src/database/*`, `src/backend/*`, `subscriptions/*`, `SegmentClassifier.ts`, `*gameDetection*`, Watch/Wear targets)
- **PersonalAIApp invariant checklist:**
  - [ ] **Null safety (`strictNullChecks` is OFF):** New or changed nullable paths are guarded and exercised by a test.
  - [ ] **User data isolation:** Every Pinecone query filters by `{ userId }`; every Firestore read/write enforces `request.auth.uid` ownership (or `N/A`).
  - [ ] **Firestore indexes & migrations:** Any multi-field + `orderBy` query uses an already-exercised query shape or a verified index in `firebase/firestore.indexes.json`; WatermelonDB respects the single-owner migration rule (or `N/A`).
  - [ ] **Variant compatibility:** Shared code works across `SirCharge`, `SameRun`, and `SameStudy` (or change is isolated to one variant).
- **Blast radius & rollback:** <what breaks if wrong; confirm whether a clean `git revert` rolls it back>

## Lessons

<!-- Required by T0 (`classify_pr.py`). State the violated/established invariant in one sentence, and the path where it is recorded in this diff, in the strongest form that fits: test > check/lint > closest current doc > skill > AGENTS.md. Or write `None — <reason>`. See the `promote-learning` skill. -->
- Invariant: 
- Recorded at: 

## Feature docs

<!-- `feature-explainer` skill. A MAJOR feature (new user-facing screen/flow, new collection or Cloud Function, or work spanning several PRs) ships with BOTH: (1) the canonical Markdown section in this repo, which agents search, and (2) a plain-language explainer page on liangqi.org, written from that Markdown, for a reader arriving cold (model: https://liangqi.org/docs/architecture/samerun-place-forum.html). A later PR that closes an item in a page's "not done yet" table updates both. Bug fixes, refactors and tooling: replace both lines with one `N/A — <reason>`. T0 (`classify_pr.py`) warns on a missing/empty section until 2026-11-08 and rejects it from then on. -->
- Explainer (liangqi.org URL): 
- Source doc (Markdown path in this repo): 

## Provenance

<!-- Required by T0 (`classify_pr.py`). Run `python3 ../personal-toolkits/scripts/git/agent-provenance.py --markdown-block` and paste its bullet list (it fills `Served model`, `Effort level`, and the rest from session evidence). Supported agents include: Claude Code, DeepSeek Harness (dsh), Codex, Antigravity, Cursor, OpenCode, Hermes. -->
- Coding agent: <Claude Code | DeepSeek Harness | Codex | Antigravity | Cursor | OpenCode | Hermes>
- Claimed model: <exact model ID, e.g., claude-opus-4-6 | qwen3.8-27b-5090-long | freedom | gpt-5.5 | gemini-4-argon>
- Served model: <paste exact output of `python3 ../personal-toolkits/scripts/git/agent-provenance.py`>
- Effort level: <reasoning effort used for the coding pass — `low` | `medium` | `high` | `xhigh` | `max`, or `N/A` if the model exposes no effort knob>
- Session / Run ID: <session UUID or $AGENT_RUN_ID>
- Subagents / helper models: <none | role: model>
- Human reviewed the code: no

## Reviewer notes

<!-- Filled in by the hostile self-review pass (`pr-review-merge` Step 2) and/or the independent tiered reviewer (`review_pr.py` T0/T1/T2). -->
- **T0 classification (`classify_pr.py`):** `pending` | `pass (tier <1|2>, size <N>/1000 — churn: additions+deletions of non-generated files, not git's insertions)` | `FAIL (<reasons>)`
- **Bugs (broken callers, null derefs, race conditions, missing index):** `none` (or `file:line` + fix commit)
- **Issues (locale gaps, doc drift, untested service paths, attribution):** `none` (or details)
- **Improvements applied:** `none` (or details)
- **Verdict:** `pending` | `approve` | `changes-requested` | `needs-human`
