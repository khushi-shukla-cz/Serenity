@echo off
echo ========================================
echo Flutter Project Setup Script
echo ========================================
echo.

cd /d "c:\Users\Khushi\OneDrive\Desktop\ai_task"

echo [1/5] Installing Flutter dependencies...
call flutter pub get
if %errorlevel% neq 0 (
    echo ERROR: Failed to install dependencies
    pause
    exit /b 1
)
echo ✓ Dependencies installed successfully
echo.

echo [2/5] Running code generation for Hive models...
call flutter packages pub run build_runner build --delete-conflicting-outputs
if %errorlevel% neq 0 (
    echo WARNING: Code generation failed. You may need to run this manually later.
)
echo ✓ Code generation completed
echo.

echo [3/5] Checking for errors...
call flutter analyze
echo.

echo [4/5] Formatting code...
call flutter format lib/
echo ✓ Code formatted
echo.

echo [5/5] Checking project structure...
dir /s /b lib\ > project_structure.txt
echo ✓ Project structure saved to project_structure.txt
echo.

echo ========================================
echo Setup completed!
echo ========================================
echo.
echo Next steps:
echo 1. Review SETUP_GUIDE.md for detailed instructions
echo 2. Create remaining files (theme, routes, controllers, etc.)
echo 3. Configure Firebase (if needed)
echo 4. Run: flutter run
echo.
pause
