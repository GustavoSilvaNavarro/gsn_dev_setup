#!/bin/zsh

set -e  # stop on error

install_fzf() {
  if command -v fzf >/dev/null 2>&1; then
    echo "✅ FZF is already installed."
  else
    echo "📦 Installing FZF with Homebrew..."
    brew install fzf
    echo
  fi

  # Add FZF config block if not already in zshrc
  if ! grep -q "# ---- FZF -----" ~/.zshrc; then
    echo "⚙️ Configuring fzf..."

    cat >> ~/.zshrc <<'EOF'

# ---- FZF -----
eval "$(fzf --zsh)"

# --- setup fzf theme ---
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}" "$@" ;;
    ssh)          fzf --preview 'dig {}' "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}
EOF
    echo
  fi

  echo "❗️ FZF setup completed."
  echo
}
