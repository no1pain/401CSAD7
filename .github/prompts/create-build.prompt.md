---
mode: agent
description: Configure, build, and test the C++ project by invoking the build-and-test skill.
---

# create-build

Use the `build-engineer` agent and invoke the `build-and-test` skill to
configure, build, and test the C++ project. Follow the skill; do not duplicate
its implementation instructions.

## Preconditions

- Work from the repository root after `create-project` has completed
  successfully.
- Confirm that `CMakeLists.txt`, the C++ source, and GoogleTest test source
  exist.
- Inspect the build configuration and current worktree before running
  commands or making any corrections.

## Actions

1. Invoke `build-and-test`.
2. Configure the project with CMake, build it, locate the generated Hello
   World executable, and run the registered GoogleTest/CTest suite.
3. Confirm that the test named `BasicAddition` is present and passes.
4. If the skill requires a correction, limit edits to the relevant build or
   test files and report them.

## Expected result

Successful completion includes a successful CMake configure, successful build,
the path to the generated executable, and a passing CTest run that includes
`BasicAddition`. Report commands, exit statuses, and relevant test output.

## Verification

Use the skill's platform-appropriate configure, build, executable-location,
and CTest checks. At minimum verify all of these:

- CMake configuration succeeded.
- The current build succeeded.
- The Hello World executable exists in the build output.
- CTest executed successfully.
- `BasicAddition` passed.
- `git diff --check` passes for any changes made.

## Error handling

- If a prerequisite is missing, report it and stop; do not claim success.
- On configure, build, executable, or test failure, preserve the command's
  exit status and relevant diagnostics.
- Do not treat a stale executable or previous test result as proof of the
  current run.
- Do not continue to `create-actions` after a required check fails.

## Rerun safety

Use the existing build directory without deleting it or clearing unrelated
files. Reconfigure and rebuild as needed. Make only focused corrections and
rerun every affected check; never report stale results as current.
