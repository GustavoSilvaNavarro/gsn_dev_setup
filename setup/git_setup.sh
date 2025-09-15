#!/bin/zsh

set -e  # stop on error

configure_git() {
  echo "⚙️ Configuring Git..."

  # Check if a global user.name is already set
  if [ -z "$(git config --global user.name)" ]; then
    echo "🤔 No Git user name found."
    # NOTE When writing name like Gustavo Silva no need for double quote ""
    read "git_name?Please enter your full name for Git: "
    git config --global user.name "$git_name"
  else
    local current_name="$(git config --global user.name)"
    echo "✅ Git user name is already set to: $current_name"
  fi

  # Check if a global user.email is already set
  if [ -z "$(git config --global user.email)" ]; then
    echo "🤔 No Git user email found."
    read "git_email?Please enter your email for Git: "
    git config --global user.email "$git_email"
  else
    local current_email="$(git config --global user.email)"
    echo "✅ Git user email is already set to: $current_email"
  fi

  # Verify the settings
  echo "❗️ Git has been successfully setup."
}
