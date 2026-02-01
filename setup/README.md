# Setup Directory

This directory contains all setup and installation scripts for the PODFRIDGE-Databases project.

## Files

### `setup.sh`
Automated setup script that:
- Creates a Python virtual environment at `.venv/`
- Installs Python dependencies for analysis
- Registers a Jupyter kernel named "podfridge" for Quarto
- Installs R packages

**Usage:**
```bash
bash setup/setup.sh
```

### `requirements-analysis.txt`
Core Python dependencies for running the analysis notebooks (pandas, numpy, matplotlib, ipykernel).

**Usage:**
```bash
pip install -r setup/requirements-analysis.txt
```

### `requirements.txt`
Complete Python package dependencies (full pip freeze from the development environment).

**Usage:**
```bash
pip install -r setup/requirements.txt
```

### `requirements-scraping.txt`
Minimal Python dependencies needed only for web scraping components.

**Usage:**
```bash
pip install -r setup/requirements-scraping.txt
```

### `install.R`
R package installation script for all required R packages.

**Usage:**
```bash
Rscript setup/install.R
```

## Quick Start

From the project root directory:

```bash
# Option 1: Automated (recommended)
bash setup/setup.sh

# Option 2: Manual Python setup
python3 -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
pip install -r setup/requirements-analysis.txt
python -m ipykernel install --user --name=podfridge --display-name="PODFRIDGE (Python)"

# Option 3: Manual R setup
Rscript setup/install.R
```

## Virtual Environment

The project uses a Python virtual environment located at `.venv/` in the project root. This keeps dependencies isolated from your system Python installation.

**Activate the environment:**
```bash
# macOS/Linux
source .venv/bin/activate

# Windows
.venv\Scripts\activate
```

**Deactivate:**
```bash
deactivate
```

## Jupyter Kernel for Quarto

The setup script registers a Jupyter kernel named "podfridge" that Quarto uses to execute Python code blocks. When opening a `.qmd` file with Python code, select "PODFRIDGE (Python)" as the kernel.
