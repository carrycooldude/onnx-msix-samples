# Python Sample (Flask + ONNX Runtime + pywinrt)

## Structure
- `frontend/`: Flask UI (e.g., button triggers inference)
- `backend/`: Python ONNX Runtime logic (with [pywinrt](https://github.com/pywinrt/pywinrt) for Windows APIs)

## How it works
1. User interacts with the UI (e.g., clicks a button)
2. Frontend calls backend Python function (via Flask route) to run ONNX inference
3. Result is shown in the UI

## About pywinrt
- This sample uses [pywinrt](https://github.com/pywinrt/pywinrt) to access Windows Runtime APIs from Python, enabling deeper Windows integration for your AI apps.

## Build & Run
- `pip install -r requirements.txt` in `python-app/`
- `python frontend/app.py` or use `build.ps1` to package as MSIX

---

## 🚀 NPU (Qualcomm Hexagon) Support & Dependency Installation

This sample is ready for Snapdragon X Elite (Qualcomm Hexagon NPU 0) acceleration!

### Quick Install (Recommended for Hackathon)
1. Open a terminal in the `python-app` directory.
2. Run:
   ```
   install_deps_npu.bat
   ```
   This script will:
   - Check for Python
   - Install all required dependencies (`numpy`, `flask`, `onnxruntime`, `onnxruntime-extensions`)
   - Attempt to install NPU-optimized ONNX Runtime if available
   - Print clear instructions and troubleshooting tips

3. To run the app:
   ```
   python frontend/app.py
   ```

### Notes for NPU Acceleration
- The script installs the standard ONNX Runtime. For best NPU performance, install a Qualcomm-optimized ONNX Runtime wheel if available (see Qualcomm or Microsoft docs).
- If NPU is not available, ONNX Runtime will use CPU fallback.
- For advanced NPU features, see [ONNX Runtime QNN documentation](https://onnxruntime.ai/docs/execution-providers/QNN-ExecutionProvider.html).

### Troubleshooting
- **Python not found:** Install Python 3.8+ from [python.org](https://www.python.org/downloads/)
- **Permission errors:** Run the terminal as Administrator
- **NPU not detected:** Ensure you are on a Snapdragon X Elite device and have the latest drivers
- **Custom wheel:** If you have a Qualcomm NPU-optimized ONNX Runtime wheel, install it manually:
  ```
  pip install onnxruntime-*-qnn*.whl
  ```

---

## MS Store
- Test on X-Elite, then submit MSIX to Microsoft Store
