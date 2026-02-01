#!/bin/bash

echo "=== PODFRIDGE-Databases Setup ==="
echo ""

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( cd "$SCRIPT_DIR/.." && pwd )"

# Check prerequisites
command -v R >/dev/null 2>&1 || { echo "Error: R is not installed. Please install R >= 4.0"; exit 1; }
command -v python3 >/dev/null 2>&1 || { echo "Error: Python is not installed. Please install Python >= 3.13"; exit 1; }
command -v quarto >/dev/null 2>&1 || { echo "Error: Quarto is not installed. Please install Quarto >= 1.3"; exit 1; }

echo "✓ Prerequisites found"
echo ""

# Create Python virtual environment if it doesn't exist
VENV_DIR="$PROJECT_ROOT/.venv"
if [ ! -d "$VENV_DIR" ]; then
    echo "Creating Python virtual environment..."
    python3 -m venv "$VENV_DIR"
    echo "✓ Virtual environment created at $VENV_DIR"
else
    echo "✓ Virtual environment already exists at $VENV_DIR"
fi
echo ""

# Activate virtual environment and install Python dependencies
echo "Installing Python dependencies..."
source "$VENV_DIR/bin/activate"
pip install --upgrade pip
pip install -r "$SCRIPT_DIR/requirements-analysis.txt"
echo ""

# Register Jupyter kernel for Quarto
echo "Registering Jupyter kernel..."
python -m ipykernel install --user --name=podfridge --display-name="PODFRIDGE (Python)"
echo "✓ Kernel 'podfridge' registered"
echo ""

# Install R packages
echo "Installing R packages..."
Rscript "$SCRIPT_DIR/install.R"
echo ""

echo "=== Setup Complete ==="
echo ""
echo "To activate the Python environment manually:"
echo "  source $VENV_DIR/bin/activate"
echo ""
echo "To render the Quarto site:"
echo "  quarto preview"
