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
