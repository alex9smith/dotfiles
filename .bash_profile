alias ls='ls -GFlash'
alias list='exa -la --git --header'
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

GPG_TTY=$(tty)
export GPG_TTY
export PATH="/usr/local/opt/openssl/bin:$PATH"

# Use brew packages over MacOS defaults. Specifically for gcc vs. clang
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH=/usr/local/bin:$PATH

# Changing Prompt for Bash
inside_git_repo="\$(git rev-parse --is-inside-work-tree 2>/dev/null)"
parse_git_branch() {
  if [ "$inside_git_repo" ]; then
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  else echo ""
  fi
}
parse_git_commit() {
  if [ "$inside_git_repo" ]; then
    git log --pretty=format:'%h' -n 1 2> /dev/null | tr -d '\n'
  else echo ""
  fi
}

export PS1="\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] \$(parse_git_commit) \$ "

# Suppress ZSH message on Mac
export BASH_SILENCE_DEPRECATION_WARNING=1

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Pyenv init
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# RBenv
eval "$(rbenv init -)"

# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Bash / git tab completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

. "$HOME/.cargo/env"

# GOV.UK
export PATH=$PATH:~/govuk/govuk-docker/exe

alias gu="govuk-docker"
alias gur="govuk-docker-run"
alias guu="govuk-docker-up"
alias gux="govuk-docker-run bundle exec"

alias x='bundle exec'
alias ra='x rubocop -A'
alias xr='x rake'
