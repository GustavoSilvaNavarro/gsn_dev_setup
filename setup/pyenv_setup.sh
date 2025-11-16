#!/bin/zsh

set -e  # stop on error

install_pyenv() {
  if command -v pyenv >/dev/null 2>&1; then
    echo "✅ pyenv is already installed."
  else
    echo "📦 Installing PYENV with Homebrew..."
    brew install pyenv
    echo

    if ! grep -q 'export PYENV_ROOT="\$HOME/.pyenv"' ~/.zshrc; then
      echo "⚙️ Configuring Pyenv..."

      echo '# ---- PYENV -----' >> ~/.zshrc
      echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
      echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
      echo 'eval "$(pyenv init - zsh)"' >> ~/.zshrc
      echo
    fi
  fi

  echo "❗️ PYENV has been installed."
  echo
}

install_and_setup_python_version() {
  source ~/.zshrc

  if ! command -v pyenv >/dev/null 2>&1; then
    echo "❌ Pyenv is not installed"
    exit 1
  fi

  echo "✅ PYENV is installed, lets installed python versions"
  local py_v_11="3.12.12"
  local py_v_12="3.13.9"
  local py_v_13="3.14.0"

  pyenv install "$py_v_11"
  pyenv install "$py_v_12"
  pyenv install "$py_v_13"
  echo "Versions of python installed => "$py_v_11" | "$py_v_12" | "$py_v_13""
  echo

  pyenv global "$py_v_11"
  echo "Global python version setup => "$py_v_11""

  echo
  echo "--- Installed Python versions ---"
  pyenv versions
  echo "-----------------------------------"
  echo "❗️ Python Versions where installed"
  echo
}
