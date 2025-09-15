#!/bin/zsh

set -e  # stop on error
echo "🚀 Bootstrapping your machine as a Software Engineer..."

# --- Install Homebrew ---
install_homebrew() {
  if ! command -v brew &>/dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    if ! command -v brew &>/dev/null; then
      echo "❌ Error: Homebrew failed to install. Exiting."
      exit 1  # Exit the script with an error code
    else
      brew update && brew upgrade && brew cleanup # update homebrew
      clear
      echo "✅ Homebrew successfully installed."
    fi
  else
    brew update && brew upgrade && brew cleanup
    clear
    echo "✅ Homebrew already installed"
  fi
}

# --- Install Brewfile ---
# echo "📦 Installing apps and tools from Brewfile..."
# brew bundle --file=./Brewfile

# --- Run setup scripts ---
# for script in setup/*.sh; do
#   echo "⚙️ Running $script..."
#   source "$script"
# done

install_homebrew

echo "🎉 Done! Restart terminal to apply settings."
