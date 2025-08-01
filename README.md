## 📁 Repo Structure: `onnx-msix-samples/`

```
onnx-msix-samples/
├── shared/
│   ├── model.onnx
│   └── logo.png
├── python-app/
│   ├── app.py
│   ├── AppxManifest.xml
│   └── build.ps1
├── electron-app/
│   ├── main.js
│   ├── renderer.js
│   ├── index.html
│   ├── package.json
│   ├── AppxManifest.xml
│   └── build.ps1
├── csharp-app/
│   ├── ONNXCSharpApp.csproj
│   ├── MainWindow.xaml
│   ├── MainWindow.xaml.cs
│   ├── AppxManifest.xml
│   └── build.ps1
├── cpp-app/
│   ├── main.cpp
│   ├── AppxManifest.xml
│   └── build.ps1
└── build-all.ps1
```

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
pyinstaller --onefile app.py
Copy-Item ..\shared\model.onnx .\dist\
Copy-Item ..\shared\logo.png .\dist\
Copy-Item .\AppxManifest.xml .\dist\
MakeAppx.exe pack /d .\dist /p ONNXPythonApp.msix
```

---

## ⚡ Electron `build.ps1`

```powershell
electron-packager . onnx-electron-app --platform=win32 --arch=x64
Copy-Item ..\shared\model.onnx .\onnx-electron-app-win32-x64\
Copy-Item ..\shared\logo.png .\onnx-electron-app-win32-x64\
Copy-Item .\AppxManifest.xml .\onnx-electron-app-win32-x64\
MakeAppx.exe pack /d .\onnx-electron-app-win32-x64 /p ONNXElectronApp.msix
```

---

## 💻 C# `build.ps1`

```powershell
# Assumes Visual Studio build already done
Copy-Item ..\shared\model.onnx .\bin\Release\
Copy-Item ..\shared\logo.png .\bin\Release\
Copy-Item .\AppxManifest.xml .\bin\Release\
MakeAppx.exe pack /d .\bin\Release /p ONNXCSharpApp.msix
```

---

## ⚙️ C++ `build.ps1`

```powershell
# Assumes Visual Studio build already done
Copy-Item ..\shared\model.onnx .\Release\
Copy-Item ..\shared\logo.png .\Release\
Copy-Item .\AppxManifest.xml .\Release\
MakeAppx.exe pack /d .\Release /p ONNXCApp.msix
```