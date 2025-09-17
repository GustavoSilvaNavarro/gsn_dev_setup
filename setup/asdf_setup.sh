#!/bin/zsh

set -e  # stop on error

install_asdf() {
  if command -v asdf >/dev/null 2>&1; then
    echo "✅ asdf is already installed."
  else
    echo "📦 Installing ASDF with Homebrew..."
    brew install asdf
    echo

    if ! grep -q "asdf.sh" ~/.zshrc; then
      echo "⚙️ Configuring ASDF..."

      echo '# ---- ASDF -----' >> ~/.zshrc
      echo ". \"$(brew --prefix asdf)/libexec/asdf.sh\"" >> ~/.zshrc
      echo
    fi
  fi

  echo "❗️ ASDF has been installed."
  echo
}

installing_go() {
  echo "🔥 Installing Go..."

  source ~/.zshrc
  if ! command -v asdf >/dev/null 2>&1; then
    echo "❌ ASDF is not installed"
    exit 1
  fi

  local go_v="1.25.1"
  asdf plugin add golang
  echo "🐱 Golang plugin has been installed"
  echo

  asdf install golang "$go_v"
  echo "✅ Go Version "$go_v" has been installed"
  echo

  # asdf set golang "$go_v" # it might not be necessary
  echo "Global version of Golang => "$go_v""
  echo

  echo "❗️ Golang has been installed and configured"
}
