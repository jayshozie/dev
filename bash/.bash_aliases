# .bash_aliases

# easier to type src then the whole command
alias src='source ~/.bashrc'

# netrw
alias nv='nvim .'

# i like it this way
alias ll='ls -lAh'

# better safe then sorry
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# easier readability
alias df='df -h'

# automatically enable METU VPN because via-cli is trash
alias metuvpn='~/scripts/metuvpn.sh'

# my projects are small and mostly single filed so this script works fine
alias bench='~/scripts/which_bench.sh'

# sometimes it feels better to look at diffs, logs, and status in a text editor
alias utils='./utils.sh'

# you won't even believe how much i make changes to these files
alias dot='cd ~/dotfiles && nvim .'
alias lsp='cd ~/.config/nvim/ && nvim ./lua/jaysh/lazy/lsp.lua'
alias rc='nvim ~/.bashrc'
alias ali='nvim ~/.bash_aliases'
alias gitconf='nvim ~/.gitconfig'

# easier access to stuff i'm constantly working on
alias project='cd ~/projects/c-mastery-projects/jayshell'
alias scri='cd ~/scripts && nvim ~/scripts'
alias docs='cd ~/Documents'
alias downs='cd ~/Downloads'

# my very own weather scrip
alias weather='~/scripts/weather/weather.sh'

# waha-tui, to stay on the latest version
alias wp='waha-tui'

# batcat => cat
alias bat='batcat'

# i usually sleep while my workstation is on, so i have an alias to shut it down
# automatically after 90 minutes
alias sleep='sudo shutdown +90'
# here if i change my mind
alias unsleep='sudo shutdown -c'

# i usually close my workstation via terminal mostly, and got annoyed at always
# writing the whole command
alias sp='sudo poweroff'
