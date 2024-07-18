# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias bashrc-source="source ~/.bashrc"
alias bashrc-edit="nano ~/.bashrc"

#Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# ---- fzf ----
eval "$(fzf --bash)"

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# Delay fzf-git sourcing because sourcing automatically results in a black screen after login
if [[ $- == *i* ]]; then
  source ~/.fzf-git/fzf-git.sh
fi

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# catppuccin colors
export FZF_DEFAULT_OPTS=" \
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

# ---- eza ----
alias ls="eza --color=always --icons=always"
alias lst="eza --color=always --icons=always --tree --level=2"

# ---- spicetify ----
export PATH=$PATH:/home/whisprs/.spicetify

# ---- bash prompt ----
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set_ps1() {
  # https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797#256-colors
  # ^ Use the 256-colors IDs
  local accent_color_1='215'
  local accent_color_2='111'
  local text_color_1='232'
  local text_color_2='232'
  local dirchar_color='208'
  local end_prompt_color='5'

  local pwd2=$(echo "$PWD" | sed -e "s:$HOME:~:" -e "s:\([^/]\)/:\1$(printf ' \356\202\261 '):g")
  PS1="\n\342\224\214\342\224\200 \[\e[38;5;$(echo $accent_color_1)m\]\356\202\262\[\e[0m\e[48;5;$(echo $accent_color_1)m\e[38;5;$(echo $text_color_1)m\] \u@\h \[\e[0m\e[48;5;$(echo $accent_color_2)m\e[38;5;$(echo $accent_color_1)m\]\356\202\260\[\e[38;5;$(echo $text_color_2)m\] $pwd2 \[\e[0m\e[38;5;$(echo $accent_color_2)m\]\356\202\260\n\[\e[38;5;$(echo $end_prompt_color)m\]$\[\e[0m\] "
}

PROMPT_COMMAND="set_ps1"

clear
