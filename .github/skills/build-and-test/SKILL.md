---
name: build-and-test
description: Configure, build, and test the C++ project using CMake and GoogleTest/CTest.
---

# build-and-test

## When to use

Use this skill after the project scaffold exists, or when asked to configure,
build, run tests, or diagnose those steps.

## Inputs

- The repository root and current project files.
- A working CMake project and its declared GoogleTest dependency.
- The target platform and any requested build configuration.

Inspect the CMake configuration and existing changes before running commands
or editing files.

## Outputs

- CMake configuration and build results, including command exit statuses.
- The generated Hello World executable and its path.
- GoogleTest/CTest results, including the `BasicAddition` test result.
- Relevant diagnostic output and any narrowly scoped corrections made to the
  build or test setup.

## Actions

1. Configure the project with CMake, for example:
   `cmake -S . -B build`.
2. Build it, for example:
   `cmake --build build --config Release`.
3. Locate and confirm generation of the Hello World executable. Account for
   platform-specific output locations, including configuration subdirectories
   such as `Release`.
4. Run the registered test suite with CTest, for example:
   `ctest --test-dir build -C Release --output-on-failure`.
5. Confirm that GoogleTest/CTest executes at least one unit test named
   `BasicAddition` and reports it passing.
6. Report each command and its actual result. If a correction is necessary,
   keep it limited to the relevant build or test files.

## Verification and checks

Successful completion requires all of the following:

- CMake configuration completes successfully.
- The project builds successfully.
- The build generates the Hello World executable.
- CTest executes the GoogleTest suite successfully.
- A unit test named `BasicAddition` is present and passes.

Check command exit statuses and test output; a configured project alone does
not establish that the build or tests passed.

## Typical errors and handling

- **CMake is missing or too old:** report the required tool and the observed
  error; do not claim configuration succeeded.
- **GoogleTest is unavailable:** report dependency acquisition or discovery
  diagnostics and stop before claiming test success.
- **Compilation or linking fails:** identify the failed build step and include
  relevant diagnostics; do not treat an executable from an earlier build as
  proof of the current build.
- **Executable path differs by platform/configuration:** search the generated
  build tree for the target artifact and report its actual path; if absent,
  treat the build as failed.
- **`BasicAddition` is missing or fails:** report the test result. If test
  implementation is within scope, correct the test/setup and rerun the build
  and test; otherwise report the issue without modifying out-of-scope files.
- **CTest reports no tests:** verify test registration and GoogleTest
  integration, report the diagnostic, and do not report a successful test run.

## Example

**Input:** “Configure, build, and test the project on this machine.”

**Expected result:** Configure with CMake, build the Hello World executable,
run CTest, and report the executable path and test outcomes. Completion is
successful only if configuration and build succeed and the GoogleTest test
named `BasicAddition` passes.
