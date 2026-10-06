# Agent and project architecture

## Purpose

The `build-engineer` agent will help implement and verify the cross-platform
C++ Hello World project for Laboratory Work 1, Variant 1. It will use the
laboratory requirements as its source of truth, make focused changes, and
report the results of each verification step.

## Problems the agent solves

- Implements the small C++ application and its CMake build configuration.
- Adds and runs GoogleTest tests through CTest.
- Helps keep the project buildable on supported platforms.
- Diagnoses build and test failures and reports actionable errors.
- Updates project documentation when project behavior or usage changes.

## Skills

The agent will use exactly these skills:

- `project-scaffold`
- `build-and-test`
- `github-actions`

## Commands

The following commands are planned for later stages and are not implemented
or available yet:

1. `git-init` — initialize the repository for the project and prepare its
   initial Git state.
2. `create-project` — scaffold the cross-platform C++ Hello World project.
3. `create-build` — add the CMake build configuration and GoogleTest/CTest
   setup.
4. `create-actions` — add GitHub Actions workflows to build and test the
   project.
5. `check` — verify the generated project and its build, tests, and workflow
   configuration.
6. `init` (orchestrator) — run the commands in order, passing each stage's
   results to the next and stopping when a required stage fails.

## Data passed between stages

The orchestrator provides each stage with the laboratory requirements and
relevant files or results from preceding stages. It passes forward:

- generated or changed project files;
- the command outcome, including its exit status and verification results;
- relevant diagnostic output when a step fails.

The next command uses these results to determine whether it can proceed. A
failed or missing result must not be represented as a successful stage.

## Orchestrator error handling

The `init` orchestrator runs `git-init`, `create-project`, `create-build`,
`create-actions`, and `check` in order, checking each command's exit status
and result before starting the next dependent command. On failure, it records
the failed step and diagnostic output, stops subsequent dependent stages,
and reports the error instead of claiming success. After a failure is
corrected, the failed step and dependent steps must be rerun and their
outcomes reported.
