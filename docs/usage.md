# Usage

## Project

Laboratory Work 1, Variant 1 is a minimal cross-platform C++ Hello World
project built with CMake and tested with GoogleTest through CTest. GitHub
Actions CI covers Windows, Linux, and macOS.

## Using the `build-engineer` agent

Open the repository in Visual Studio Code with GitHub Copilot Chat enabled.
Select **build-engineer** in the agent picker, then describe the work or select
one of the prompt commands under `.github/prompts/`:

- `git-init` — inspect repository state and prepare `.gitignore`.
- `create-project` — invoke `project-scaffold` to create the minimal project.
- `create-build` — invoke `build-and-test` to configure, build, and test.
- `create-actions` — invoke `github-actions` to create cross-platform CI.
- `check` — perform read-only final verification and report PASS/FAIL.
- `init` — orchestrate the complete setup and stop when a required stage
  fails.

Run `init` in this order:

1. `git-init`
2. `create-project`
3. `create-build`
4. `create-actions`
5. `check`

## Verify locally

From the repository root, configure with CMake, build, and run all registered
tests:

```sh
cmake -S . -B build
cmake --build build --config Release
ctest --test-dir build -C Release --output-on-failure
```

To run only the `BasicAddition` test:

```sh
ctest --test-dir build -C Release -R BasicAddition --output-on-failure
```

The generated executable is `build/hello_world` on Unix/macOS and typically
`build/Release/hello_world.exe` on Windows. Run it from the repository root
with `./build/hello_world` on Unix/macOS or `.\build\Release\hello_world.exe`
in PowerShell on Windows; it should print `Hello, World!`.

## Run CI scripts locally

The scripts configure the project, build the executable, and run CTest:

- Unix/macOS: `./ci.sh`
- Windows Command Prompt: `ci.bat`

The GitHub Actions workflow is `.github/workflows/ci.yml`. Its matrix covers
Windows, Linux, and macOS and invokes the platform build scripts.
