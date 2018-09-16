# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
# BEGIN ANSIBLE MANAGED BLOCK go
export PATH=/home/isucon/local/go/bin:/home/isucon/go/bin:$PATH
export GOROOT=/home/isucon/local/go
# END ANSIBLE MANAGED BLOCK go
# BEGIN ANSIBLE MANAGED BLOCK perl
export PATH=/home/isucon/local/perl/bin:$PATH
# END ANSIBLE MANAGED BLOCK perl
# BEGIN ANSIBLE MANAGED BLOCK nodejs
export PATH=/home/isucon/local/node/bin:$PATH
# END ANSIBLE MANAGED BLOCK nodejs
# BEGIN ANSIBLE MANAGED BLOCK php
export PATH=/home/isucon/local/php/bin:$PATH
# END ANSIBLE MANAGED BLOCK php
# BEGIN ANSIBLE MANAGED BLOCK python
export PATH=/home/isucon/local/python/bin:$PATH
# END ANSIBLE MANAGED BLOCK python
# BEGIN ANSIBLE MANAGED BLOCK ruby
export PATH=/home/isucon/local/ruby/bin:$PATH
# END ANSIBLE MANAGED BLOCK ruby

alias ls='ls -la --color'
alias gs='git status'
alias gd='git diff'
function gl(){
  if [ $# -ne 0 ]; then
    git --no-pager log --date=iso --pretty=format:'%h %Cgreen%ad %Cblue%an %Creset%s %C(blue)%d%Creset' $@
  else
    git --no-pager log --date=iso --pretty=format:'%h %Cgreen%ad %Cblue%an %Creset%s %C(blue)%d%Creset' -10
  fi
  echo
}
alias gp='git push'
alias ga='git commit -am'
