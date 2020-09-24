alias ls='ls -GFlash'
alias list='exa -la --git --header'
alias cat='bat'

# Git shortcuts
alias gs='git status'
alias gcm='git checkout master'
alias ga='git add'
alias gc='git commit -m'
alias gb='git checkout -b'

GPG_TTY=$(tty)
export GPG_TTY
export PATH="/usr/local/opt/openssl/bin:$PATH"

# Use brew packages over MacOS defaults. Specifically for gcc vs. clang
export PATH="/usr/local/opt/llvm:$PATH"
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