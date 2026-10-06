---
name: project-scaffold
description: Create the minimal cross-platform C++ Hello World project structure for Laboratory Work 1, Variant 1.
---

# project-scaffold

## When to use

Use this skill when the project needs its initial C++ Hello World structure
created or when the required scaffold is incomplete. Do not use it to configure
and run the build or tests; use `build-and-test` for that.

## Inputs

- The repository root.
- The laboratory requirements, including Variant 1 and the supported
  platforms.
- Any existing project files and user constraints.

Inspect the repository first and preserve unrelated files and changes.

## Outputs

Create or update only the files required for the minimal scaffold:

- `src/` containing a minimal C++ program that prints `Hello, World!`.
- `tests/` containing the project test source needed by the build
  configuration, including the required `BasicAddition` unit test.
- `CMakeLists.txt` configuring the C++ executable and GoogleTest/CTest tests.
- `.gitignore` excluding generated build output and common IDE files without
  excluding source, tests, or project documentation.
- A basic `README.md` with the project purpose and configure, build, and test
  instructions if the repository does not already have suitable instructions.

Keep the structure and dependencies minimal. Do not replace existing files
without inspecting and preserving their relevant content.

## Actions

1. Inspect the repository and identify existing source, tests, build files,
   and documentation.
2. Create the missing directories and minimal project files listed above.
3. Configure CMake to build the Hello World executable and register the
   GoogleTest suite with CTest.
4. Ensure the test suite contains a unit test named `BasicAddition`.
5. Keep build output out of version control using `.gitignore`.

## Verification and checks

- Confirm `src/`, `tests/`, `CMakeLists.txt`, and `.gitignore` exist.
- Confirm the C++ source is minimal, valid-looking, and prints
  `Hello, World!`.
- Confirm CMake defines the executable and enables/registers the test suite.
- Confirm the test suite declares `BasicAddition`.
- Do not report compilation or test success unless those checks have actually
  been run; use `build-and-test` to configure, build, and execute tests.

## Typical errors and handling

- **Files already exist:** inspect and extend only what is missing; do not
  overwrite unrelated content.
- **GoogleTest cannot be located or fetched:** report the dependency and
  configuration error with its diagnostic output; do not substitute a
  success-shaped test result.
- **CMake configuration fails:** report the failing configure step and output,
  leave relevant diagnostics intact, and do not claim the scaffold is
  verified.
- **Required requirements conflict with existing project structure:** stop
  before destructive edits and report the conflict for resolution.

## Example

**Input:** “Scaffold Variant 1's C++ Hello World project in this empty
repository.”

**Expected result:** Create `src/` with a Hello World program, `tests/` with a
GoogleTest suite containing `BasicAddition`, a root `CMakeLists.txt` that
defines the executable and CTest integration, a suitable `.gitignore`, and
basic README usage instructions if needed. Report the created files and state
that build and test success still need to be confirmed by `build-and-test`.
