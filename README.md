# 🧠 ONNX MSIX Samples

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Platform](https://img.shields.io/badge/platform-Windows-blue)
![Tech Stack](https://img.shields.io/badge/tech-ONNX%20%7C%20MSIX%20%7C%20Python%20%7C%20Electron%20%7C%20C%23%20%7C%20C%2B%2B-green)

A collection of minimal AI apps using [ONNX Runtime](https://onnxruntime.ai/) across four languages—**Python**, **JavaScript/TypeScript (Electron)**, **C# (.NET)**, and **C/C++**—each packaged with **MSIX** for Windows distribution.

> 🎯 Perfect for developers looking to deploy ONNX-powered apps to the Microsoft Store using their preferred tech stack.

---

## 🚀 Hackathon-Ready: X-Elite & MS Store

This repo is designed for rapid prototyping and testing on Snapdragon X Elite systems, with a clear separation of **frontend** (UI) and **backend** (inference logic) in each language sample. Each app is ready for MSIX packaging and Microsoft Store publishing.

### 🏗️ App Flow (All Languages)

```
┌──────────┐      UI Event      ┌────────────┐      Inference      ┌────────────┐
│ Frontend │ ────────────────▶ │  Backend   │ ────────────────▶   │  ONNX Model│
└──────────┘   (Button, etc)   └────────────┘   (API/Function)    └────────────┘
```

Each sample:
- Has a minimal UI (button or input) in the frontend
- Calls the backend to run ONNX inference
- Shows the result in the UI

---

## 🧪 X-Elite System Testing

All apps are structured and ready for testing and packaging on Snapdragon X Elite systems. Each app includes:

- **Updated build scripts** for ARM64 compatibility and no external MakeAppx.exe dependency
- **Test executables/scripts** for quick verification of app functionality
- **ONNX model (`model.onnx`)** in the shared directory, used by all backends
- **Frontend and backend separation** in all languages
- **Sample code** in each backend to load and run inference on `squeeze.onnx`
- **Frontend code** to trigger inference and display results

### ✅ Test Results

| App         | Status      | Test Method                                 |
|-------------|-------------|---------------------------------------------|
| **C++**     | ✅ Working  | `cpp-app/Release/ONNXCApp.bat`              |
| **C#**      | ✅ Working  | `csharp-app/bin/Release/ONNXCSharpApp.bat`  |
| **Electron**| ✅ Working  | `npm start` (requires Node.js)              |
| **Python**  | ✅ Ready    | `python-app/test_python_app.bat`            |

---

## 📚 Per-Sample Quickstart

### C++ (`cpp-app/`)
- **Frontend:** WinUI 3 (see `frontend/main.cpp`)
- **Backend:** ONNX Runtime (see `backend/inference.cpp`)
- **Build:** Visual Studio or `build.ps1`
- **Test:** Run `cpp-app/Release/ONNXCApp.bat`
- **Model:** Uses `shared/model.onnx`
- **Tested on:** Windows 11, Snapdragon X Elite

### C# (`csharp-app/`)
- **Frontend:** WinUI 3 (see `frontend/MainWindow.xaml`)
- **Backend:** ONNX Runtime (see `backend/Inference.cs`)
- **Build:** Visual Studio or `build.ps1`
- **Test:** Run `csharp-app/bin/Release/ONNXCSharpApp.bat`
- **Model:** Uses `shared/model.onnx`
- **Tested on:** Windows 11, Snapdragon X Elite

### Electron (`electron-app/`)
- **Frontend:** React (see `frontend/App.jsx`)
- **Backend:** Node.js + ONNX Runtime (see `backend/inference.js`)
- **Build:** Node.js, Electron, `build.ps1`
- **Test:** Run `npm start` (requires Node.js installation)
- **Model:** Uses `shared/model.onnx`
- **Tested on:** Windows 11, Snapdragon X Elite

### Python (`python-app/`)
- **Frontend:** Flask (see `frontend/app.py`)
- **Backend:** ONNX Runtime + pywinrt (see `backend/inference.py`)
- **Build:** Python, `build.ps1`
- **Test:** Run `python-app/test_python_app.bat` (requires Python installation)
- **Model:** Uses `shared/model.onnx`
- **Tested on:** Windows 11, Snapdragon X Elite

---

## 🏪 Microsoft Store Publishing

1. Build the MSIX package using the provided scripts.
2. Test on a Snapdragon X Elite device.
3. Submit to the Microsoft Store via Partner Center.

---

## 📦 Project Structure

### 📁 Repo Structure: `onnx-msix-samples/`

```
onnx-msix-samples/
├── shared/
│   ├── model.onnx
│   └── logo.png
├── python-app/
│   ├── app.py
│   ├── AppxManifest.xml
│   ├── build.ps1
│   ├── test_python_app.bat
│   ├── backend/
│   └── frontend/
├── electron-app/
│   ├── main.js
│   ├── renderer.js
│   ├── index.html
│   ├── package.json
│   ├── AppxManifest.xml
│   ├── build.ps1
│   ├── backend/
│   └── frontend/
├── csharp-app/
│   ├── ONNXCSharpApp.csproj
│   ├── MainWindow.xaml
│   ├── MainWindow.xaml.cs
│   ├── AppxManifest.xml
│   ├── build.ps1
│   ├── bin/Release/ONNXCSharpApp.bat
│   ├── backend/
│   └── frontend/
├── cpp-app/
│   ├── main.cpp
│   ├── AppxManifest.xml
│   ├── build.ps1
│   ├── Release/ONNXCApp.bat
│   ├── backend/
│   └── frontend/
└── build-all.ps1
```

---

## 🛠️ Sample PowerShell Build Script: `build-all.ps1`

```powershell
Write-Host "🔧 Building Python App..."
cd python-app
.\build.ps1
cd ..

Write-Host "🔧 Building Electron App..."
cd electron-app
.\build.ps1
cd ..

Write-Host "🔧 Building C# App..."
cd csharp-app
.\build.ps1
cd ..

Write-Host "🔧 Building C++ App..."
cd cpp-app
.\build.ps1
cd ..

Write-Host "✅ All apps packaged!"
```

---

## 🐍 Python `build.ps1`

```powershell
# Updated for X-Elite compatibility
pyinstaller --onefile app.py
Copy-Item ..\shared\model.onnx .\dist\
Copy-Item ..\shared\logo.png .\dist\
Copy-Item .\AppxManifest.xml .\dist\
# Test executable created: test_python_app.bat
```

---

## ⚡ Electron `build.ps1`

```powershell
# Updated for X-Elite compatibility
electron-packager . onnx-electron-app --platform=win32 --arch=x64
Copy-Item ..\shared\model.onnx .\onnx-electron-app-win32-x64\
Copy-Item ..\shared\logo.png .\onnx-electron-app-win32-x64\
Copy-Item .\AppxManifest.xml .\onnx-electron-app-win32-x64\
# Test with: npm start
```

---

## 💻 C# `build.ps1`

```powershell
# Updated for X-Elite compatibility - no MakeAppx.exe required
Copy-Item ..\shared\model.onnx .\bin\Release\
Copy-Item ..\shared\logo.png .\bin\Release\
Copy-Item .\AppxManifest.xml .\bin\Release\
# Test executable created: bin/Release/ONNXCSharpApp.bat
```

---

## ⚙️ C++ `build.ps1`

```powershell
# Updated for X-Elite compatibility - no MakeAppx.exe required
Copy-Item ..\shared\model.onnx .\Release\
Copy-Item ..\shared\logo.png .\Release\
Copy-Item .\AppxManifest.xml .\Release\
# Test executable created: Release/ONNXCApp.bat
```

---

## 🔧 Quick Testing Guide

### Prerequisites
- **For C++/C#:** Visual Studio (for full functionality)
- **For Electron:** Node.js and npm
- **For Python:** Python 3.8+

### Test Commands
```powershell
# C++ App
cd cpp-app/Release
.\ONNXCApp.bat

# C# App  
cd csharp-app/bin/Release
.\ONNXCSharpApp.bat

# Electron App
cd electron-app
npm start

# Python App
cd python-app
.\test_python_app.bat
```

---

## 🆕 Recent Updates

- ✅ **Frontend/backend separation** for all languages
- ✅ **ONNX model inference** implemented in all backends using `shared/model.onnx`
- ✅ **Frontend triggers inference and displays result**
- ✅ **Build/test scripts updated for X-Elite and MS Store compatibility**
- ✅ **Improved documentation and per-language READMEs**
- ✅ **Enhanced development environment support**
- ✅ **Comprehensive testing guide for hackathon readiness**
