# My Package - Python Boilerplate

A Python package boilerplate built with `uv`, `ruff`, and Python 3.13.

## ✅ Current Status

This package is fully functional and ready to be customized.

## 🚀 Quick Test

```bash
uv run my-package Alice

# Test module execution
uv run python -m my_package Alice
```

## 📋 Customization Guide

### Step 1: Update Package Metadata in `pyproject.toml`

```toml
[project]
name = "your-awesome-package"  # Change from "my-package"
version = "0.1.0"  # Add your starting version
description = "Your package description"  # Update description
authors = [
    {name = "Your Name", email = "your.email@example.com"},  # Update author info
]

# Update repository URLs
[project.urls]
Homepage = "https://github.com/camille-004/your-awesome-package"
Documentation = "https://github.com/camille-004/your-awesome-package"
Repository = "https://github.com/camille-004/your-awesome-package"
Issues = "https://github.com/camille-004/your-awesome-package/issues"

[project.scripts]
your-awesome-package: "your_package.main:main"  # Update CLI command name

[tool.ruff.lint.isort]
known-first-party = ["your_package"]  # Update package name
```

### Step 2: Rename Package Directory and Files

```bash
mv src/my_package src/your_package

# Update all imports, references
sed -i '' 's/my_package/your_package/g' src/your_package/__init__.py
sed -i '' 's/my_package/your_package/g' src/your_package/__main__.py
sed -i '' 's/my_package/your_package/g' tests/test_main.py
sed -i '' 's/my-package/your-awesome-package/g' pyproject.toml
```

### Step 3: Update Source Files
#### `src/your_package/__init__.py`:

```python
"""Your awesome package description."""

__version__ = "0.1.0"
__author__ = "Your Name"
__email__ = "your.email@example.com"

from .main import main

__all__ = ["main"]
```

### Step 4: Add Your Dependencies

```bash
# Runtime dependencies
make add PACKAGE=requests
make add PACKAGE=numpy
make add PACKAGE=pandas

# Dev dependencies
make add-dev PACKAGE=sphinx

# Sync environment
make sync
```
