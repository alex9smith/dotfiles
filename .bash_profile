alias ls='ls -GFlash'
alias list='exa -la --git --header'
alias cat='bat'

get_default_branch_name() {
  git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'
}

# Git shortcuts
alias gs='git status'
alias gcd='git checkout $get_default_branch_name'
alias ga='git add'
alias gc='git commit -m'
alias gb='git checkout -b'
alias gd='git diff --cached'

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

# Pyenv init
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# RBenv
eval "$(rbenv init -)"

# Shortcut to DMp scripts
sc() {
	cd /Users/alexsmith/dmp/digitalmarketplace-scripts
	source venv/bin/activate
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/alexsmith/.sdkman"
[[ -s "/Users/alexsmith/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/alexsmith/.sdkman/bin/sdkman-init.sh"

complete -C /usr/local/bin/terraform terraform

# Bash / git tab completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
