# Copyright (C)  2026  Emir Baha YILDIRIM
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

[[ $- != *i* ]] && return

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
shopt -s checkwinsize
shopt -s globstar

export XDG_CONFIG_HOME='/home/jaysh/.config'
export BASH_CONFIG="${XDG_CONFIG_HOME}/bash"

# every other sourced file is sourced in .bash_source
[[ -f "${BASH_CONFIG}/.bash_source" ]] && source "${BASH_CONFIG}/.bash_source"

# tmux-sessionizer thanks to ThePrimeagen
bind '"\C-y":"tmux neww tmux-sessionizer\n"'
