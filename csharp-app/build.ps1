Copy-Item ..\shared\model.onnx .\bin\Release\
Copy-Item ..\shared\logo.png .\bin\Release\
Copy-Item .\AppxManifest.xml .\bin\Release\
MakeAppx.exe pack /d .\bin\Release /p ONNXCSharpApp.msix