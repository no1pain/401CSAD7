# Laboratory Work 1 — Cross-Platform Hello World

- **Student:** Oleksandr Kazan
- **Group:** KI-401
- **Variant:** 1

## Project

A small cross-platform C++ Hello World project built with CMake and tested with
GoogleTest and CTest. The project will be developed in stages with assistance
from a dedicated AI agent.

## Build and test

```sh
cmake -S . -B build
cmake --build build
ctest --test-dir build --output-on-failure
```

## Launching the AI agent

1. Open this repository in Visual Studio Code with GitHub Copilot Chat enabled.
2. Open Copilot Chat and select **build-engineer** in the agent picker.
3. Describe the task you want the agent to perform.

The agent is defined in `.github/agents/build-engineer.agent.md`; its skills
and prompt commands are in `.github/skills/` and `.github/prompts/`.
