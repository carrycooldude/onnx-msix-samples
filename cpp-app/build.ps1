# Ensure Release folder exists
$releasePath = ".\Release"
if (!(Test-Path $releasePath)) {
    Write-Host "❌ Release folder not found. Please build the C++ project in Visual Studio first."
    exit
}

# Copy shared assets
Copy-Item ..\shared\model.onnx $releasePath
Copy-Item ..\shared\logo.png $releasePath
Copy-Item .\AppxManifest.xml $releasePath

# Package with MSIX
MakeAppx.exe pack /d $releasePath /p ONNXCApp.msix

Write-Host "✅ C++ MSIX package created: ONNXCApp.msix"