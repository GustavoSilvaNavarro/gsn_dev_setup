#!/bin/zsh

set -e  # stop on error

install_rust() {
  if command -v rustc >/dev/null 2>&1; then
    echo "✅ Rust is already installed."
  else
    echo "📦 Installing Rust..."
    # NOTE this might require some answers
    # curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    # curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    echo
  fi

  echo "❗️ Rust setup completed."
  echo
}
