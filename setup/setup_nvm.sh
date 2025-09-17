#!/bin/zsh

set -e  # stop on error

install_nvm() {
  # Check if NVM is installed via Homebrew
  if [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] || [ -s "$HOME/.nvm/nvm.sh" ]; then
    echo "✅ NVM is already installed."
  else
    echo "📦 Installing NVM with Homebrew..."
    brew install nvm
  fi

  echo "❗️ NVM has been installed. Remember to add its configuration to your .zshrc file."
  echo
}

configure_nvm() {
  echo "🛠️ Configuring NVM..."
  local zshrc_file="$HOME/.zshrc"

  # Check if the NVM export line already exists in the .zshrc file
  if ! grep -q "export NVM_DIR=\"\$HOME/.nvm\"" "$zshrc_file"; then
    echo "Adding NVM configuration to .zshrc..."

    # Append the configuration lines
    cat << 'EOF' >> "$zshrc_file"

# ---- NVM -----
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
EOF

    echo "✅ NVM configuration added to .zshrc"
  else
    echo "✅ NVM configuration already exists in .zshrc"
  fi

  echo "❗️ NVM has been configured."
  echo
}

install_and_set_node() {
  # Check if NVM is installed
  if [ -s "/opt/homebrew/opt/nvm/nvm.sh" ]; then
    source "/opt/homebrew/opt/nvm/nvm.sh"
  elif [ -s "$HOME/.nvm/nvm.sh" ]; then
    source "$HOME/.nvm/nvm.sh"
  else
    echo "❌ NVM is not installed. Please install it first."
    exit 1
  fi

  echo "✅ NVM is installed."
  echo "📦 Installing the latest LTS version of Node.js..."

  local specific_version="24.4.1"

  # Install node version
  nvm install "v$specific_version"
  nvm install --lts
  echo "✅ Node.js versions $specific_version and LTS installed."

  nvm alias default "$specific_version"
  echo "✅ Node.js alias set to $specific_version."

  echo "--- Installed Node.js versions ---"
  nvm ls
  echo "-----------------------------------"
  echo "❗️ Node Versions where installed"
  echo
}
