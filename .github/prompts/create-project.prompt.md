---
mode: agent
description: Create the minimal C++ Hello World project by invoking the project-scaffold skill.
---

# create-project

Use the `build-engineer` agent and invoke the `project-scaffold` skill. Create
the minimal cross-platform C++ Hello World project for Laboratory Work 1,
Variant 1. Follow the skill instead of duplicating its implementation details.

## Preconditions

- Work from the repository root after `git-init` has completed successfully.
- Inspect the repository and existing project files before editing.
- Confirm the task is to scaffold the project and preserve unrelated work.

## Actions

1. Invoke `project-scaffold`.
2. Create only missing or incomplete scaffold files required by that skill.
3. Preserve existing README content if present and only add basic project
   usage content when needed.
4. Do not configure, build, or run tests as a substitute for `create-build`.

## Expected files

- `src/` with a minimal C++ Hello World program.
- `tests/` with GoogleTest test source including `BasicAddition`.
- Root `CMakeLists.txt` defining the executable and GoogleTest/CTest setup.
- `.gitignore` excluding generated build output.
- Basic README project and usage instructions only if existing documentation
  is not suitable.

## Verification

- Confirm the expected directories and files exist.
- Inspect the source for Hello World output.
- Inspect CMake and test source for executable/test registration and the
  `BasicAddition` test.
- Run `git diff --check`.
- Report that compilation and test execution are pending `create-build`;
  do not claim build or test success here.

## Error handling

- If a required file exists, inspect it and preserve relevant content rather
  than replacing it blindly.
- If dependencies or requirements are unclear or conflict with the repository,
  report the issue and stop before destructive changes.
- On a failed verification, report the exact check and diagnostics; do not
  report the scaffold as complete.

## Rerun safety

Compare existing files with the skill requirements and make only necessary
additions or focused updates. Do not duplicate directories, tests, README
sections, or CMake targets on a rerun.
