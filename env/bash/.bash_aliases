# .bash_aliases

# easier to type src then the whole command
alias src='source ~/.bashrc'

# netrw
alias nv='nvim .'

# i like it this way
alias ll='ls -lAh --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# better safe then sorry
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# easier readability
alias df='df -h'

# sometimes it feels better to look at diffs, logs, and status in a text editor
alias utils='./utils.sh'

# you wouldn't even believe how much i make changes to these files
alias dev='cd ~/dev && nv'
alias lsp='pushd ~/dev/env/neovim/.config/nvim/ && nvim ./lua/jaysh/lazy/lsp.lua && popd'
alias rc='nvim ~/dev/env/bash/.bashrc'
alias ali='nvim ~/dev/env/bash/.bash_aliases'
alias gitconf='nvim ~/dev/env/git/.gitconfig'

# easier access to stuff i'm constantly working on
alias project='pushd ~/projects/c-mastery-projects/jayshell && nv && popd'
alias scri='pushd ~/dev/env/scripts && nv && popd'
alias docs='cd ~/Documents'
alias downs='cd ~/Downloads'

# batcat => cat
alias bat='batcat'

# i usually sleep while my workstation is on, so i have an alias to shut it down
# automatically after 90 minutes
alias eepy='shutdown +90'
# here if i change my mind
alias uneepy='shutdown -c'

# i usually close my workstation via terminal mostly, and got annoyed at always
# writing the whole command
alias die='systemctl poweroff'
