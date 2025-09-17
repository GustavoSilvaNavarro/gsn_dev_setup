#!/bin/zsh

set -e  # stop on error

setup_aliases() {
  echo "⚙️ Configuring aliases..."

  if ! grep -q 'alias list=' ~/.zshrc; then
    echo 'alias list="eza --color=always --long --icons=always --no-user"' >> ~/.zshrc
  fi

  echo "❗️ Aliases setup completed."
  echo
}
