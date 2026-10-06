@echo off
setlocal

cmake -S . -B build
if errorlevel 1 exit /b %errorlevel%

cmake --build build --config Release
if errorlevel 1 exit /b %errorlevel%

if not exist build\Release\hello_world.exe (
    echo Error: build\Release\hello_world.exe was not generated.
    exit /b 1
)

ctest --test-dir build -C Release --output-on-failure
if errorlevel 1 exit /b %errorlevel%
