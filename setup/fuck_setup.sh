#!/bin/zsh

set -e  # stop on error

install_the_fuck() {
  if command -v thefuck >/dev/null 2>&1; then
    echo "✅ THEFUCK is already installed."
  else
    echo "📦 Installing THEFUCK with Homebrew..."
    brew install thefuck
    echo
  fi

  if ! grep -q "# ----- THE FUCK -----" ~/.zshrc; then
    echo "⚙️ Configuring thefuck..."
    echo '# ----- THE FUCK -----' >> ~/.zshrc
    echo 'eval $(thefuck --alias)' >> ~/.zshrc
  fi

  echo "❗️ THEFUCK setup completed."
  echo
}
