# Python Sample (Flask + ONNX Runtime + pywinrt)

## Structure
- `frontend/`: Flask UI (e.g., button triggers inference)
- `backend/`: Python ONNX Runtime logic (with pywinrt for Windows APIs)

## How it works
1. User interacts with the UI (e.g., clicks a button)
2. Frontend calls backend Python function (via Flask route) to run ONNX inference
3. Result is shown in the UI

## Build & Run
- `pip install -r requirements.txt` in `python-app/`
- `python frontend/app.py` or use `build.ps1` to package as MSIX

## MS Store
- Test on X-Elite, then submit MSIX to Microsoft Store
