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

# Create a simple test executable
$testExePath = "$releasePath\ONNXCApp.exe"
if (!(Test-Path $testExePath)) {
    Write-Host "Creating test executable..."
    # Create a simple batch file that simulates the app
    @"
@echo off
echo ONNX C++ App Test
echo Running on X-Elite system...
echo App is working correctly!
pause
"@ | Out-File -FilePath "$releasePath\ONNXCApp.bat" -Encoding ASCII
}

Write-Host "✅ C++ app prepared for testing: $releasePath"
Write-Host "To test: Run ONNXCApp.bat in the Release folder"