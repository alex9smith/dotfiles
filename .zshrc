# Configure ZSH prompt options
autoload -U colors && colors
setopt prompt_subst

alias ls='ls -GFlash'
alias list='eza -la --git --header'
alias cat='bat'

get_default_branch_name() {
  git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'
}

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gb='git checkout -b'
alias gd='git diff --cached | tig'
alias gp='git push'
alias gpl='git push --force-with-lease'

gcd() {
  git checkout `get_default_branch_name`
}

export VISUAL=vim
export EDITOR="$VISUAL"
export GIT_EDITOR="$EDITOR"

# Changing Prompt for Git folders
inside_git_repo="\$(git rev-parse --is-inside-work-tree 2>/dev/null)"

parse_git_branch() {
  if [ "$inside_git_repo" ]; then
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  else echo ""
  fi
}

export PS1="%1d%{$fg[green]%}\$(parse_git_branch)%{$reset_color%} \$ "

# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color
# fnm
FNM_PATH="/opt/homebrew/opt/fnm/bin"
if [ -d "$FNM_PATH" ]; then
  eval "`fnm env`"
fi

