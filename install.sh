#!/bin/zsh

set -e  # stop on error
source ./setup/git_setup.sh

echo "🚀 Bootstrapping your machine as a Software Engineer..."
echo

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

  echo "❗️ Homebrew has been successfully installed."
  echo
}

# --- Install Brewfile ---
install_homebrew_resources() {
  echo "📦 Installing apps and tools from Brewfile..."
  brew bundle --file=./Brewfile
  echo "❗️ Homebrew has successfully installed all packages."
}

install_homebrew
install_git
configure_git
# install_homebrew_resources

echo "💯 Done! Restart terminal to apply settings."
