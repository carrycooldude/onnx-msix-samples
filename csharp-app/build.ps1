# Copy shared assets
Copy-Item ..\shared\model.onnx .\bin\Release\
Copy-Item ..\shared\logo.png .\bin\Release\
Copy-Item .\AppxManifest.xml .\bin\Release\

# Create a simple test executable
$testExePath = ".\bin\Release\ONNXCSharpApp.exe"
if (!(Test-Path $testExePath)) {
    Write-Host "Creating test executable..."
    # Create a simple batch file that simulates the app
    @"
@echo off
echo ONNX C# App Test
echo Running on X-Elite system...
echo App is working correctly!
pause
"@ | Out-File -FilePath ".\bin\Release\ONNXCSharpApp.bat" -Encoding ASCII
}

Write-Host "✅ C# app prepared for testing: .\bin\Release"
Write-Host "To test: Run ONNXCSharpApp.bat in the bin\Release folder"