HISTSIZE=10000
alias python="python2"
alias x="xterm -fn 7x13 &"
alias v="vim"
alias vmi="vim"
alias vun="vim"
alias e="vim"
alias l="ls -altrh"
alias g="grep -i"
alias size="du -h --max-depth=1"
alias gv="evince"
alias mkdit="mkdir"
alias mount_usb="sudo mount /dev/sdb1 /mnt/usb"
alias umount_usb="sudo umount /mnt/usb"
alias mount_pi=" sudo mount.cifs //pi/BigDrive /mnt/pi -o user=pi"
alias umount_pi=" sudo umount /mnt/pi"
alias latest="ls -lt |head"
alias fuck='sudo $(history -p \!\!)'
alias ff="find . -iname"
alias gpush="git push origin master"
alias gpull="git pull --rebase origin master"
alias glog="git log --pretty=oneline --abbrev-commit"
alias anki="anki -b ~/.anki"
alias lynx="lynx -cookies=1 -accept_all_cookies=1 -image_links"
alias vim.vanilla="vim -u /dev/null"

#sudo modprobe vboxdrv

function debug() { java -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005 $@;}

function psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }

function psfind() { ps aux |grep $1; }
function pskill() { ps aux |grep $1 |awk '{print $2}' |xargs kill -9; }

function checkip() { curl https://checkip.perfect-privacy.com/json |python -m json.tool; }
#python shell env setup
export PYTHONSTARTUP=~/.pythonrc

# setup virtualenv commands
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

# check that tmux is installed
if command -v tmux > /dev/null; then
  # check that we're not already in screen or tmux; only via SSH connection (remote)
  if [[ ! $TERM =~ screen ]] && [ -z $TMUX ] ; then
     if tmux ls | grep -q admin; then
        exec tmux attach -t admin
     else
        exec tmux new -s admin -n main
     fi
  fi
fi

export TERM=xterm-256color

eval "$(pipenv --completion)"

# add git-branch to prompt
. ~/.git-prompt.sh
PS1='\u@\h: \w$(__git_ps1 " (%s)")\$ '


# setup GOPATH
export GOPATH=$(echo ~/go)
mkdir -p $GOPATH 

function view_ff() {
    # convert markdown to html w/ pandoc and view in firefox
    tmp_path=$(mktemp)
    pandoc -s $1 > $tmp_path
    firefox $tmp_path
}
