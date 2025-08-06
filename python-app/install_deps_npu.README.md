# install_deps_npu.bat — Python NPU Dependency Installer

This script helps you quickly set up all required Python dependencies for the ONNX Python app, with special support for Qualcomm Hexagon NPU (Snapdragon X Elite) acceleration.

---

## What does this script do?

1. **Checks for Python**
   - Verifies that Python 3.8+ is installed and available in your PATH.
   - If not found, prints an error and exits.

2. **Upgrades pip and installs core dependencies**
   - Upgrades `pip` to the latest version.
   - Installs `numpy` (for numerical operations) and `flask` (for the web UI).

3. **Installs ONNX Runtime and Extensions**
   - Installs `onnxruntime` (the main ONNX inference engine).
   - Installs `onnxruntime-extensions` (for extra ONNX features and custom ops).

4. **(Optional) Installs NPU-Optimized ONNX Runtime**
   - If you have a Qualcomm NPU-optimized ONNX Runtime wheel (from Qualcomm or Microsoft), you can uncomment and update the relevant line in the script to install it for maximum NPU performance.

5. **Prints Success Message and Next Steps**
   - Tells you how to run the app and where to find more information.

6. **Pauses for User Review**
   - The script pauses at the end so you can read any messages or errors.

---

## How to Use

1. Open a terminal in the `python-app` directory.
2. Run:
   ```
   install_deps_npu.bat
   ```
3. Follow the on-screen instructions.
4. To run the app:
   ```
   python frontend/app.py
   ```

---

## Troubleshooting

- **Python not found:**
  - Install Python 3.8+ from [python.org](https://www.python.org/downloads/)
  - Make sure Python is added to your PATH

- **Permission errors:**
  - Run the terminal as Administrator

- **NPU not detected:**
  - Ensure you are on a Snapdragon X Elite device and have the latest drivers

- **Custom NPU wheel:**
  - If you have a Qualcomm NPU-optimized ONNX Runtime wheel, install it manually:
    ```
    pip install onnxruntime-*-qnn*.whl
    ```

---

## Why use this script?
- **One-click setup** for all dependencies
- **NPU-ready** for Snapdragon X Elite
- **Hackathon-friendly**: clear messages, error handling, and next steps

For more details, see the main `README.md` and `python-app/README.md`.
