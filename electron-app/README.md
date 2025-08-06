# Electron Sample (React + Node.js + ONNX Runtime)

## Structure
- `frontend/`: React UI (e.g., button triggers inference)
- `backend/`: Node.js ONNX Runtime logic

## How it works
1. User interacts with the UI (e.g., clicks a button)
2. Frontend calls backend Node.js function (via IPC or API) to run ONNX inference
3. Result is shown in the UI

## Build & Run
- `npm install` in `electron-app/`
- `npm start` or use `build.ps1` to package as MSIX

## MS Store
- Test on X-Elite, then submit MSIX to Microsoft Store
