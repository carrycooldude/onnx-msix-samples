@echo off

REM === Python Dependency Installer for ONNX + Qualcomm NPU (Snapdragon X Elite) ===
REM For Hackathon Use: Installs all required packages for this sample

REM Check for Python
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python is not installed or not in PATH.
    echo Please install Python 3.8+ from https://www.python.org/downloads/ and re-run this script.
    pause
    exit /b 1
)

REM Install core dependencies
pip install --upgrade pip
pip install numpy flask

REM Try to install ONNX Runtime with Qualcomm NPU support
REM (If not available, fallback to CPU version)
echo Installing ONNX Runtime for Snapdragon NPU (Hexagon)...
pip install onnxruntime-extensions
pip install onnxruntime
REM Qualcomm NPU-optimized wheels may be available from Qualcomm or Microsoft
REM Example (uncomment and update if you have a specific wheel):
REM pip install onnxruntime-*-qnn*.whl

REM Print success message
echo.
echo [SUCCESS] All dependencies installed!
echo If you have a Qualcomm NPU-optimized ONNX Runtime wheel, install it manually for best performance.
echo.
echo To run the app:
echo   cd python-app
    echo   python frontend\app.py

echo For more info, see the README.md
pause
