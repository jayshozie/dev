# .bash_aliases

# easier to type src then the whole command
alias src='source ~/.bashrc'

# netrw
alias nv='nvim .'

# update
alias update='sudo pacman -Syu'

# programs
alias img='imv'
alias vid='vlc'
alias yay='paru'

# i like it this way
alias ll='eza -liah --git'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias fd='fd -uic always'
alias find='fd -uic always'

# better safe then sorry
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# easier readability
alias df='df -h'
alias tree='tree -aC'

# sometimes it feels better to look at diffs, logs, and status in a text editor
alias utils='./utils.sh'
alias dev-commit="git add . && git commit -m 'wip: automated dev-commit' && git push"

# you wouldn't even believe how much i make changes to these files
alias dev='cd ~/dev && nv'
alias lsp='pushd ~/dev/env/neovim/.config/nvim/ && nvim ./lua/jaysh/lazy/lsp.lua && popd'
alias rc='nvim ~/dev/env/bash/.bashrc'
alias ali='nvim ~/dev/env/bash/.bash_aliases'
alias gitconf='nvim ~/dev/env/git/.gitconfig'

# easier access to stuff i'm constantly working on
alias project='pushd ~/projects/c-mastery-projects/jayshell && nv'
alias scri='pushd ~/dev/env/scripts/.local/bin/scripts/ && nv && popd'
alias docs='cd ~/Documents'
alias downs='cd ~/Downloads'
alias uni='cd ~/uni'
alias 240='cd ~/uni/ceng240'
alias 301='cd ~/uni/ceng301'

# i usually sleep while my workstation is on, so i have an alias to shut it down
# automatically after 90 minutes
alias eepy='shutdown +90'
# here if i change my mind
alias uneepy='shutdown -c'

# i usually close my workstation via terminal mostly, and got annoyed at always
# writing the whole command
alias die='shutdown now'
alias arise='shutdown -r now'
