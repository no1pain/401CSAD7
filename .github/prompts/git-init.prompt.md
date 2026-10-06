---
mode: agent
description: Verify the repository state and prepare or update .gitignore for Laboratory Work 1, Variant 1.
---

# git-init

Use the `build-engineer` agent. Verify the repository state and prepare or
update `.gitignore` for the cross-platform C++ Hello World project.

## Preconditions

- Work from the repository root.
- Inspect the current Git status and existing `.gitignore` before making
  changes.
- Preserve existing work, files, ignore rules, and Git history.

## Actions

1. Confirm the repository root and inspect `git status --short --branch`.
2. Read `.gitignore` if it exists.
3. Ensure `.gitignore` excludes generated build output (including the
   project's build directory) and common IDE files, without excluding source,
   tests, or documentation.
4. If the task directory is not already a Git repository, confirm it is not
   inside another repository before running `git init` in the task directory.
   Never reinitialize an existing repository, reset, clean, force-update, or
   rewrite history; do not stage or commit changes.

## Expected result

The repository state is reported accurately, and `.gitignore` is present with
appropriate build-output exclusions while retaining any existing relevant
rules. Report every file changed and do not claim unrelated work is clean.

## Verification commands

Run and report:

- `git rev-parse --show-toplevel`
- `git status --short --branch`
- `git check-ignore -v build/` (when a build directory pattern is present)
- `git diff --check`

If initialization is unsafe because the task directory is inside another
repository or its root is uncertain, stop and report the issue. After a safe
initialization, run the applicable Git checks.

## Error handling

- If Git reports an error, preserve its diagnostic output and report the
  failed check.
- If existing ignore rules conflict with the requirement, preserve unrelated
  rules and make only a focused correction.
- If preserving existing work cannot be assured, stop before editing and
  report the conflict.
- Do not delete files, stage changes, commit, or rewrite Git history.

## Rerun safety

Inspect before editing. Add only missing ignore rules, avoid duplicate
patterns, and leave already-correct files unchanged. Running the prompt again
must not discard or duplicate existing content.
