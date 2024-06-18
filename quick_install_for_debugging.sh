#!/usr/bin/env bash

# Author Carl's shell script to install and run demo on his macOS computers.
# Useful for debugging.

# LOCAL INSTALL
# >>> conda create --name afa-toml conda-forge::dlib "python>=3.9" scikit-image
# >>> conda activate afa-toml
# >>> pip install -U pytest
# >>> cd ~/Tools/auto-face-align-toml
# >>> pip install .
# >>> pytest -v src/alignfaces/tests/
# >>> python demos/demo_1_alignment/run_demo.py

mother=$(pwd)

# Activate appropriate virtual environment.
status=$(uname -n)
if [ "$status" = "ML089328-10722" ]; then
  echo "This is Carl's ZU MacBook Pro (M1)."
  eval "$(conda shell.bash hook)"
  conda activate afa-toml
else
  echo "Unknown computer."
fi

# Install face toolbox.
if [ "$1" = "install" ] ; then
  pip install .
else
  echo "Type './quick_install_for_debugging.sh install' to install face toolbox."
fi

# Run unit tests.
cd "$mother/src/alignfaces/tests"
pytest -v
cd $mother


# Run basic sample script.
cd "$mother/demos/demo_1_alignment"
python run_demo.py

# Examine output of sample script.
find ./faces-aligned-windowed -name "*.png" -exec open {} \;


# In macOS at least, reverts to original directory and virtual enviroment
#   when this shell script terminates.

# END
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------