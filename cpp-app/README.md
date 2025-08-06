# C++ Sample (WinUI 3 + ONNX Runtime)

## Structure
- `frontend/`: WinUI 3 C++ UI (e.g., button triggers inference)
- `backend/`: ONNX Runtime C++ inference logic

## How it works
1. User interacts with the UI (e.g., clicks a button)
2. Frontend calls backend C++ function to run ONNX inference
3. Result is shown in the UI

## Build & Run
- Open in Visual Studio (Windows 11, ARM64/X-Elite recommended)
- Or use `build.ps1` to package as MSIX

## MS Store
- Test on X-Elite, then submit MSIX to Microsoft Store
