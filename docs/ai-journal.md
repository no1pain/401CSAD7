# AI Interaction Journal

**Laboratory Work 1 — Variant 1**  
**Project:** Cross-platform C++ Hello World  
**Student:** Oleksandr Kazan

This journal records the actual AI-assisted development stages and their
outcomes. The student reviewed the AI-generated files and verified the
reported results.

## Stage 1 — Project and agent definition

- **Goal:** Document the project and define its AI agent.
- **AI request:** Create a README with student/group/variant details and agent
  launch instructions, an architecture description, and the
  `build-engineer` agent manifest.
- **Result:** Created `README.md`, `docs/architecture.md`, and
  `.github/agents/build-engineer.agent.md`.
- **Verification/decision:** The student reviewed the files. The project
  remained documentation and agent configuration only at this stage.

## Stage 1 review — Align skills and commands

- **Goal:** Match the methodology's required skill and command names.
- **AI request:** Correct the architecture and agent manifest without
  introducing implementation files.
- **Result:** Specified exactly three skills—`project-scaffold`,
  `build-and-test`, and `github-actions`—and exactly six commands:
  `git-init`, `create-project`, `create-build`, `create-actions`, `check`,
  and `init`.
- **Verification/decision:** README was left unchanged during this review.
  Skills and commands were documented as planned rather than implemented.

## Student details

- **Goal:** Replace the README's student placeholder.
- **AI request:** Set the student name to Oleksandr Kazan and change nothing
  else.
- **Result:** Updated the student name in `README.md`.
- **Verification/decision:** The student name was checked in the README.

## Skills and command prompts

- **Goal:** Add the methodology's skill definitions and command prompts.
- **AI request:** Create exactly the three required skill files, then exactly
  six prompt files, without creating the C++ project or workflows in those
  requests.
- **Result:** Created skills for `project-scaffold`, `build-and-test`, and
  `github-actions`, followed by prompts for `git-init`, `create-project`,
  `create-build`, `create-actions`, `check`, and `init`.
- **Verification/decision:** The student reviewed the file lists and checked
  whitespace. The prompts specify the execution order, error handling, and
  rerun-safe behavior.

## First `init` run — Missing CMake

- **Goal:** Execute all setup stages in order.
- **AI request:** Run `git-init`, `create-project`, `create-build`,
  `create-actions`, and `check`; stop on a required failure.
- **Result:** `git-init` and `create-project` passed. `create-build` failed
  with `cmake: command not found` (exit code 127). The later stages were not
  run.
- **Diagnosis and fix:** The failure was diagnosed as CMake missing from the
  local machine's PATH. CMake was installed; no project files were removed or
  reset.
- **Verification/decision:** The failure was reported rather than treating
  configuration, build, or tests as successful.

## Second `init` run — Project build and checks

- **Goal:** Resume the workflow using the existing scaffold after installing
  CMake.
- **AI request:** Rerun all stages in order, preserving correct existing
  files.
- **Result:** CMake 4.4.4 was available. `git-init`, `create-project`,
  `create-build`, `create-actions`, and `check` all passed. The local Hello
  World executable ran, and the `BasicAddition` test passed.
- **Verification/decision:** The executable output and CTest result were
  checked. Existing scaffold and README content were preserved.

## Usage documentation

- **Goal:** Document how to use the agent and verify the project.
- **AI request:** Add concise usage instructions covering the commands,
  `init` order, local CMake/CTest steps, CI scripts, workflow location, and
  supported platforms.
- **Result:** Created `docs/usage.md`.
- **Verification/decision:** Confirmed its workflow, script, and prompt
  references exist.

## GitHub Actions diagnosis and correction

- **Goal:** Diagnose why GitHub Actions failed before creating jobs.
- **AI request:** Inspect `.github/workflows/ci.yml`, `ci.sh`, and `ci.bat`,
  identify the pre-job failure, and make only a necessary workflow change.
- **Observed error:** A workflow run ended after 0 seconds with no jobs.
  GitHub reported that the workflow graph could not be shown.
- **Diagnosis:** The workflow used `${{ matrix.shell }}` as the `shell`
  value. That dynamic shell expression caused workflow validation to fail
  before jobs were created.
- **Fix:** Changed the workflow to use literal `cmd` for Windows and literal
  `bash` for Linux/macOS, with conditional steps based on `runner.os`. The
  workflow continues to invoke only `ci.bat` or `ci.sh`; the scripts perform
  CMake configuration, build, executable generation, and tests.
- **Verification/result:** Local YAML parsing and script checks passed.
  Subsequently, GitHub Actions passed on Windows, Ubuntu/Linux, and macOS;
  the pull request showed 6/6 successful checks.
