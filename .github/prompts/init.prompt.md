---
mode: agent
description: Orchestrate the complete Laboratory Work 1 setup in order and stop on required failures.
---

# init

Use the `build-engineer` agent to orchestrate the complete cross-platform
C++ Hello World setup. Execute the required prompt commands in this order:

1. `git-init`
2. `create-project`
3. `create-build`
4. `create-actions`
5. `check`

Invoke each command by its exact name from `.github/prompts/`. Do not duplicate
the skills' implementation; the stage commands invoke `project-scaffold`,
`build-and-test`, and `github-actions` as appropriate.

## Prerequisites

- Run from the repository root with the required laboratory requirements
  available.
- Inspect current repository status and preserve all existing user changes.
- Do not proceed if the repository or required tools are unavailable; report
  the blocker.

## Actions and data passed between stages

1. Run `git-init`. Pass forward its repository-root confirmation, worktree
   status, `.gitignore` result, changed-file list, exit status, and diagnostics.
2. Only on success, run `create-project`. Pass forward its created/updated
   file list, scaffold checks, exit status, and diagnostics.
3. Only on success, run `create-build`. Pass forward CMake configuration and
   build outcomes, executable path, CTest/`BasicAddition` result, exit status,
   and diagnostics.
4. Only on success, run `create-actions`. Pass forward workflow and script
   paths, platform coverage, validation results, exit status, and diagnostics.
5. Only on success, run the read-only `check`. Pass it the final repository
   state and all preceding evidence. Do not modify files during `check`.

For every stage, retain the command name, actual outcome, files changed, and
relevant diagnostics. Pass only observed results to the next command; never
turn a missing or failed result into success. Do not pass secrets or
credentials between stages.

## Expected result

Produce a final summary of all five stages, identifying each as completed or
failed, the files changed, verification results, and any remaining blocker.
The overall setup succeeds only if all required stages succeed and `check`
reports PASS for every required check.

## Error handling

- Stop immediately when any required command fails or returns an ambiguous
  result. Do not invoke later stages.
- Report the failed command, exit status when available, diagnostic output,
  and stages not run.
- Preserve changes made by successful earlier stages; do not delete files or
  roll back unrelated work as an error-handling shortcut.
- Never force-rewrite Git history, publish secrets, or change branch
  protection.
- Resume only after the failure is addressed; rerun the failed stage and all
  dependent later stages.

## Rerun safety

Each stage must follow its own idempotent/rerun-safe instructions. Before
rerunning, inspect repository state and pass existing files and results as
inputs. Do not duplicate content or undo correct prior work. Never rerun a
later stage based on stale evidence after an upstream change.
