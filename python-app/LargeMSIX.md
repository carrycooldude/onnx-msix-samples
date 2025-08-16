Packaging large Python projects into `.exe` files using **PyInstaller**—especially for **MSIX deployment**—can be tricky when it comes to **hidden imports**. Let's walk through a structured approach to solve this.

---

## 🛠 Step-by-Step Guide to Packaging with PyInstaller for MSIX

### 1. ✅ Basic PyInstaller Command
Start with a simple command to generate the `.exe`:

```bash
pyinstaller --onefile your_script.py
```

But for MSIX and large projects, you'll likely need more control.

---

### 2. 🕵️‍♂️ Identify Hidden Imports
PyInstaller sometimes misses imports that are dynamically loaded (e.g., via `importlib`, plugins, or frameworks like `PyQt`, `Tkinter`, or `TensorFlow`).

Use this command to log missing imports:

```bash
pyinstaller --onefile --log-level=DEBUG your_script.py
```

Then look for messages like:
```
WARNING: Hidden import 'xyz' not found
```

---

### 3. 📦 Add Hidden Imports Manually
Once you identify them, include them using `--hidden-import`:

```bash
pyinstaller --onefile your_script.py \
  --hidden-import=module1 \
  --hidden-import=module2 \
  --hidden-import=module3
```

If there are many, consider using a `.spec` file.

---

### 4. 🧾 Use a `.spec` File for Complex Projects
Run PyInstaller once to generate a `.spec` file:

```bash
pyi-makespec your_script.py
```

Then edit the `.spec` file:

```python
# Add hidden imports here
hiddenimports = ['module1', 'module2', 'module3']

a = Analysis(
    ...
    hiddenimports=hiddenimports,
    ...
)
```

Then build using:

```bash
pyinstaller your_script.spec
```

---

### 5. 📦 MSIX Packaging Tips
If you're targeting **MSIX**, you’ll need to:

- Use `--onefile` to simplify deployment
- Ensure all dependencies are bundled
- Use [MSIX Packaging Tool](https://learn.microsoft.com/en-us/windows/msix/packaging-tool/create-app-package) to wrap the `.exe` into an MSIX container

You can also use `Advanced Installer` or `WiX Toolset` for more control.

---

### 6. 🧪 Debugging Common Errors
Here are some common fixes:

| Error Type | Fix |
|------------|-----|
| `ModuleNotFoundError` | Add to `--hidden-import` |
| `DLL load failed` | Ensure correct architecture (x86 vs x64) |
| `FileNotFoundError` | Use `datas=[('path/to/file', 'target_folder')]` in `.spec` |
| GUI not launching | Add `--noconsole` for GUI apps |

---

### 7. 🧠 Pro Tip: Use `pyi-archive_viewer`
To inspect your `.exe` contents:

```bash
pyi-archive_viewer dist/your_script.exe
```

This helps verify if all modules are included.



## 🚨 Problem Summary

You're getting errors like:

```
Error in PDF processing: No module named 'transformers.models.shieldgemma2'
```

This means PyInstaller is missing **dynamically imported submodules** from the `transformers` library (like `shieldgemma2`, `wav2vec2_with_lm`, etc.). These aren't detected automatically because `transformers` uses dynamic imports and lazy loading.

---

## ✅ Solution Strategy

### 1. **Explicitly Add Hidden Imports**
Use the `--hidden-import` flag for each missing submodule:

```bash
pyinstaller your_script.py --onefile \
  --hidden-import=transformers.models.shieldgemma2 \
  --hidden-import=transformers.models.wav2vec2_with_lm \
  --hidden-import=transformers.models.nougat.tokenization_nougat_fast \
  --hidden-import=transformers.models.gemma.modeling_flax_gemma
```

You can add more based on the log. If there are too many, use a `.spec` file.

---

### 2. **Use a `.spec` File for Better Control**
Generate it:

```bash
pyi-makespec your_script.py
```

Edit the `.spec` file:

```python
hiddenimports = [
    'transformers.models.shieldgemma2',
    'transformers.models.wav2vec2_with_lm',
    'transformers.models.nougat.tokenization_nougat_fast',
    'transformers.models.gemma.modeling_flax_gemma',
    # Add more as needed
]

a = Analysis(
    ...
    hiddenimports=hiddenimports,
    ...
)
```

Then build:

```bash
pyinstaller your_script.spec
```

---

### 3. **Use `collect_submodules` for Dynamic Modules**
If you're using `transformers` heavily, automate hidden imports:

```python
from PyInstaller.utils.hooks import collect_submodules

hiddenimports = collect_submodules('transformers.models')
```

This grabs all submodules under `transformers.models`.

---

### 4. **MSIX Packaging Reminder**
Once `.exe` is built:

- Use [MSIX Packaging Tool](https://learn.microsoft.com/en-us/windows/msix/packaging-tool/create-app-package) to wrap it
- Ensure dependencies are bundled
- Test on a clean machine to verify no missing DLLs or Python dependencies
