---
mode: agent
description: Read-only PASS/FAIL verification of the complete Laboratory Work 1 project and agent structure.
---

# check

Perform a read-only final verification of the complete Laboratory Work 1,
Variant 1 project and AI-agent structure. Do not create, edit, delete, stage,
or otherwise modify any file. Do not run commands that configure, build, or
write test logs into the repository. If a required check cannot be performed
without modifying files, report it as FAIL with the reason.

## Preconditions

- Run from the repository root.
- Read the agent manifest, skill files, prompt files, project configuration,
  workflow, and scripts needed for these checks.
- Use only read-only inspections and verification commands.

## Actions and required checks

Report a separate `PASS` or `FAIL` for every item below. Include concise
evidence for each result without exposing secret values.

1. **Agent manifest:** `.github/agents/build-engineer.agent.md` exists and
   includes the required role, responsibility, file rules, prohibitions,
   three available skills, workflow, and completion criteria.
2. **Skills:** exactly these three skill files exist, with no additional
   skill directories/files:
   - `.github/skills/project-scaffold/SKILL.md`
   - `.github/skills/build-and-test/SKILL.md`
   - `.github/skills/github-actions/SKILL.md`
3. **Commands:** exactly the six required prompt files exist:
   `git-init.prompt.md`, `create-project.prompt.md`,
   `create-build.prompt.md`, `create-actions.prompt.md`, `check.prompt.md`,
   and `init.prompt.md`, under `.github/prompts/`.
4. **Project structure:** `src/`, `tests/`, the C++ source, and GoogleTest
   test source exist.
5. **CMake:** root `CMakeLists.txt` exists and configures the expected
   executable and test registration.
6. **Executable:** verify the expected Hello World executable already exists
   in the build output and is a runnable executable. Do not build it.
7. **BasicAddition:** confirm the test is named `BasicAddition` in test
   source/registration and verify a passing result using an existing,
   read-only test result or by locating the registered test executable and
   invoking it with the GoogleTest filter `--gtest_filter=BasicMath.BasicAddition`.
   Run it from outside the repository if a working directory is needed. Do
   not reconfigure, rebuild, or run CTest if it would write to the repository.
8. **`.gitignore`:** confirm it excludes generated build output.
9. **GitHub Actions platforms:** confirm the workflow covers Windows, Linux,
   and macOS.
10. **Script-based CI:** confirm each platform's workflow steps invoke
    platform build scripts and that those scripts perform configure, build,
    executable generation, and tests. Workflow steps must not contain inline
    configure/build/test commands.
11. **Committed secrets/artifacts:** inspect tracked files and the Git index
    for obvious secret material and generated build artifacts. Report paths
    and finding categories only; never print secret values. Do not stage,
    remove, or modify anything.

## Verification commands

Use read-only commands as appropriate, such as:

- `git rev-parse --show-toplevel`
- `git ls-files`
- `git status --short`
- `git diff --check`
- `ctest --test-dir build --show-only`

Do not run a command if it can modify files. The CTest listing alone does not
prove a test passes; verify an actual passing result under check 7 without
writing into the repository.

## Expected result

Return a checklist with an explicit `PASS` or `FAIL` for all eleven checks,
followed by an overall `PASS` only if every required check passes. The report
must state concrete evidence and any check that could not be verified.

## Error handling

- Stop verification at the first required check failure, clearly report that
  failure and any checks not run as `FAIL — not checked (stopped after
  failure)`, then give an overall `FAIL`.
- If any read-only command fails, report its exit status and diagnostic
  without attempting a mutating workaround.
- If evidence is missing or ambiguous, mark the check `FAIL`; do not infer
  success or present a partial result as complete.
- Never modify files, reveal secret values, or claim unperformed checks passed.

## Rerun safety

This command is read-only. Repeating it must leave the worktree, index, and
repository history unchanged.
