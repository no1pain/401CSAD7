---
mode: agent
description: Create cross-platform GitHub Actions CI by invoking the github-actions skill.
---

# create-actions

Use the `build-engineer` agent and invoke the `github-actions` skill to create
cross-platform CI. Follow the skill rather than duplicating its
implementation.

## Preconditions

- Work from the repository root after `create-build` has completed
  successfully.
- Confirm the CMake project builds and tests successfully.
- Inspect existing workflows, platform build scripts, and repository changes
  before editing.

## Actions

1. Invoke `github-actions`.
2. Create or update a GitHub Actions workflow that covers Windows, Linux, and
   macOS.
3. Have workflow steps invoke the appropriate platform build script, such as
   `ci.bat` on Windows and `ci.sh` on Linux and macOS.
4. Put CMake configuration, project build, executable generation, and
   GoogleTest/CTest execution in those scripts, not inline in workflow steps.
5. Ensure a failed script operation returns a nonzero exit status to fail the
   corresponding CI job.

## Expected workflow and scripts

- A workflow under `.github/workflows/` covering Windows, Linux, and macOS.
- Platform-appropriate build scripts (for example `ci.bat` and `ci.sh`) that
  each configure, build, generate the executable, and run tests.
- Workflow build/test steps that invoke scripts and do not directly run
  CMake, compiler, or CTest operations.

## Verification

- Inspect the workflow matrix and confirm all three required operating
  systems are covered.
- Confirm each platform invokes an appropriate script.
- Confirm the scripts perform configure, build, executable generation, and
  test operations, and propagate failures.
- Validate workflow and script syntax when tools are available.
- Run `git diff --check` and report all checks and their results.
- Do not claim the hosted CI passed unless it has actually completed
  successfully on Windows, Linux, and macOS.

## Error handling

- If a platform script or prerequisite is missing, create it only when it is
  within the skill's scope; otherwise report the blocker and stop.
- If a job fails, report its platform, failing step, exit status, and relevant
  diagnostics. Do not hide or bypass the failure or silently omit a platform.
- If validation tools or a hosted runner are unavailable, state which
  verification could not be performed.

## Rerun safety

Inspect and extend existing workflows and scripts rather than replacing them
blindly. Keep unrelated jobs and changes. Avoid duplicate workflow jobs or
steps, and rerun checks for each changed platform script.
