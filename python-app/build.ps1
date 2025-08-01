pyinstaller --onefile app.py
Copy-Item ..\shared\model.onnx .\dist\
Copy-Item ..\shared\logo.png .\dist\
Copy-Item .\AppxManifest.xml .\dist\
MakeAppx.exe pack /d .\dist /p ONNXPythonApp.msix