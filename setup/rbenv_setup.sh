#!/bin/zsh

set -e  # stop on error

install_rbenv() {
  if command -v rbenv >/dev/null 2>&1; then
    echo "✅ RBENV is already installed."
  else
    echo "📦 Installing RBENV with Homebrew..."
    brew install rbenv
    echo

    if ! grep -q 'rbenv init' ~/.zshrc; then
      echo "⚙️ Configuring rbenv..."
      echo '# ---- RBENV -----' >> ~/.zshrc
      echo 'eval "$(rbenv init -)"' >> ~/.zshrc
    fi
  fi

  echo "❗️ RBENV setup complete."
  echo
}

install_latest_ruby() {
  echo "🔥 Installing Ruby..."

  source ~/.zshrc
  if ! command -v rbenv >/dev/null 2>&1; then
    echo "❌ RBENV is not installed"
    exit 1
  fi

  local ruby_v="3.4.6"
  rbenv install "$ruby_v"
  echo "✅ Ruby Version "$ruby_v" has been installed"
  echo

  echo "❗️ Ruby has been installed and configured"
}
