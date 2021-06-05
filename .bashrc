#
#       /$$                           /$$                          
#      | $$                          | $$                          
#      | $$$$$$$   /$$$$$$   /$$$$$$$| $$$$$$$   /$$$$$$   /$$$$$$$
#      | $$__  $$ |____  $$ /$$_____/| $$__  $$ /$$__  $$ /$$_____/
#      | $$  \ $$  /$$$$$$$|  $$$$$$ | $$  \ $$| $$  \__/| $$      
#      | $$  | $$ /$$__  $$ \____  $$| $$  | $$| $$      | $$      
#   /$$| $$$$$$$/|  $$$$$$$ /$$$$$$$/| $$  | $$| $$      |  $$$$$$$
#  |__/|_______/  \_______/|_______/ |__/  |__/|__/       \_______/
#
#                 ----------=====+++$+++=====----------
#
#                   Syudagye's .bashrc right here OwO
#
# (Warning :  A lot of things here come from Manjaro's default .bashrc)
#



# ---==+==---
##    Env
# ---==+==---

export PATH="$HOME/.local/bin:$PATH"

# ---==+==---
##  Aliases
# ---==+==---

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less
alias nuget="mono /usr/local/bin/nuget.exe"
alias rpicom="picom -b --config ~/.config/picom/picom.conf"
alias rbar="~/.config/polybar/launch.sh detach"
alias ls='exa -l --git'
alias la='ls -a'
alias lg='ls --git-ignore'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias cdshared='cd /mnt/shared'
alias fixchars='sed -i -e 's/\r$//''
alias config="git --git-dir=$HOME/dotfiles --work-tree=$HOME"

alias female=man	# l'inclusivité 

alias vi=vim

# ---==+==---
##  Options
# ---==+==---

shopt -s histappend	# Enable history appending instead of overwriting.  #139609
shopt -s expand_aliases
shopt -s checkwinsize

# ---==+==---
## Functions
# ---==+==---

# nothing here for now

# ---==+==---
##  Startup
# ---==+==---

#poggers
#neofetch --color_blocks off | lolcat	# Absolute necessity
eval "$(starship init bash)"		# Starts the starship prompt
