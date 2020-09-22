#
# ~/.bashrc
#


## Custom shell options
PS1='[\u@\h \W]\$ '

## alias commands
alias vi='vim'
alias intellij="_JAVA_AWT_WM_NONREPARENTING=1 idea"
alias pacup='aur sync -u && sudo pacman -Syu'
alias flactomp3='convertFlac'
alias ls='ls --color=auto'
alias lst='ls -tlc --color=auto'
alias redshift='redshift -l $(curl ipinfo.io 2>/dev/null | jq -j .loc | tr ',' ':')'
alias lastmod="mpcLastModified"
alias sc='cd ~/Dev/scripts && ls -hl'
alias mpd="source ~/Dev/scripts/runMPD.sh"
alias lxc-console="sudo lxc-console -n vpn -t 0"
alias mntdrs="mountVirtDrives.sh"
alias ncmpcpp='queryRemoteServer.sh ncmpcpp'
alias ncmpc='queryRemoteServer.sh ncmpc'
alias mpc="queryRemoteServer.sh mpc"
alias mpvnv="mpv --no-video"
alias pebg='nohup pulseeffects --gapplication-service >/dev/null &'
alias yt='searchYouTubeVideo'
alias tmux='tmux -f ~/.config/tmux/tmux.conf'
alias l='highlightLess'
alias clp='copyToClipboard.sh'
alias bt='bluetoothctl'
alias c='calculateScript'
alias xo='xdg-open'
alias rp='nitrogen --set-scaled --random'
alias fzf='fzf --bind=alt-k:up,alt-j:down'
alias stc='systemctl'
alias tray='runTray'
alias gcp='git cherry-pick'
alias gco='git checkout'
alias reload='source ~/.bashrc && reset'
alias gd='cd ~/Dev/'
alias lf='lfrun'
alias 4c='scrapeThread.py'
alias abook='abook --datafile ~/.local/share/abook/addressbook'
alias newsboat='newsboat -u ~/.local/share/newsboat/urls'
alias mbsync='mbsync -c ~/.config/mbsync/mbsyncrc'
alias gdot='cd ~/Dev/dotfiles'
alias grep='grep --color'

## Export shell variables
export PATH="$PATH:$HOME/.local/bin"
export HISTCONTROL=ignoreboth:erasedups
export EDITOR="vim"
export TERMINAL="urxvtc"
export BROWSER="qutebrowser"
export BSPWM_STATE=/tmp/bspwm-state.json
export MPD_HOST=Desktop
export _JAVA_AWT_WM_NONREPARENTING=1
#export ZATHURA_PLUGINS_PATH=/usr/local/lib/zathura/
export KUBECONFIG="$(find ~/.kube/configs/ -type f -printf "%p:" 2>/dev/null)$HOME/.kube/config"

## MPD related settings
export MPD_PORT=6600
export MPD_HOST=Desktop
## XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
## LESS
export LESSHISTFILE="$HOME/.cache/lesshst"
export LESSHISTSIZE=500
## VIM (commented out until coc supports customizing config file path)
## export VIMINIT='source $XDG_CONFIG_HOME/vim/vimrc'
## URXVT
export RXVT_SOCKET="/tmp/urxvtd-$HOSTNAME"
## PASS
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export PASSWORD_STORE_KEY="$(cat $XDG_DATA_HOME/password-store/.gpg-id)"
## NOTMUCH
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch/notmuch-config"
## NPM
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
## GnuPG
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GPG_TTY="$(tty)"
## Lemonbar related settings
export PANEL_FIFO=/tmp/panel-fifo
export PANEL_HEIGHT=20
export PANEL_FONT="-*-fixed-*-*-*-*-10-*-*-*-*-*-*-*"
export PANEL_WM_NAME=bspwm_panel
## go settings
export GOPATH=$HOME/.cache/go
export GOARCH=amd64
export GOOS=linux

# Set default output device as the unplugged headphones port, since that's what my audio interface actually outputs to
grep -q "MJ12" /etc/hostname && pactl set-sink-port alsa_output.pci-0000_0c_00.3.analog-stereo analog-output-headphones

gpg-connect-agent updatestartuptty /bye &>/dev/null
if [[ "$(tty)" = "/dev/tty1" ]]
then
	pgrep bspwm || startx
fi

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi


## Custom Commands
calculateScript() {
	echo "$@" | bc -l
}

uploadFile() {
	file="$@"
	curl -F"file=@$file" https://0x0.st | tee >(xclip -sel c)
}

showUnicodeFonts() {
	fc-match -s monospace:charset=$@ | less
}

highlightLess() {
	if (( $# != 1 )); then echo "One argument required!"; exit 1; fi
	highlight --force -O xterm256 "$@" | less -R
}

showFonts() {
	for i in /usr/share/fonts/*/
	do
		if [ -e "${i}fonts.alias" ]
		then
			cat "${i}fonts.alias"
		fi
		if [ -e "${i}fonts.dir" ]
		then
			cat "${i}fonts.dir"
		fi
	done
}

showSymbols() {
	font="$1"
	echo "$font"
	let i=0
	while (( i < 500 ))
	do
		let i++
		echo -e "\u${i}"
	done
	let i=0
}

testUnicode() {
	while true
	do
		echo -e "\uf242"
		echo -e "\uf34e"
		echo -e "\uf242"
		echo -e "\uf242"
		echo -e "\uf242"
		sleep 1
	done
}

testtext() {
	while true
	do
		echo -e "One two three four Пётр Ильич Чайковский 喜多郎  山崎ハコ  ゆらゆら帝国 白木秀雄 矢野顕子 福居良 lelelel \uf242\uf242\uf242\uf242"
		sleep 1
	done
}

spurdo() {
sed "s/kek/geg/gI;s/epic/ebin/gI;s/america/clapistan/gI;s/right/rite/gI;s/your/ur/gI;s/\./ :DD/gI;s/'//gI;s/,/XDD/gI;s/wh/w/gI;s/th/d/gI;s/af/ab/gI;s/ap/ab/gI;s/ca/ga/gI;s/ck/gg/gI;s/co/go/gI;s/ev/eb/gI;s/ex/egz/gI;s/et/ed/gI;s/iv/ib/gI;s/it/id/gI;s/ke/ge/gI;s/nt/nd/gI;s/op/ob/gI;s/ot/od/gI;s/po/bo/gI;s/pe/be/gI;s/pi/bi/gI;s/up/ub/gI;s/va/ba/gI;s/ck/gg/gI;s/cr/gr/gI;s/kn/gn/gI;s/lt/ld/gI;s/mm/m/gI;s/nt/dn/gI;s/pr/br/gI;s/ts/dz/gI;s/tr/dr/gI;s/bs/bz/gI;s/ds/dz/gI;s/es/es/gI;s/fs/fz/gI;s/gs/gz/gI;s/ is/iz/gI;s/as/az/gI;s/ls/lz/gI;s/ms/mz/gI;s/ns/nz/gI;s/rs/rz/gI;s/ss/sz/gI;s/ts/tz/gI;s/us/uz/gI;s/ws/wz/gI;s/ys/yz/gI;s/alk/olk/gI;s/ing/ign/gI;s/ic/ig/gI;s/ng/nk/gI" \
<<< "${@:-$(cat /dev/stdin)}"
}


mpcLastModified() { 
	mpc -f "%mtime%;%file%" listall | sed -r -n 's/[a-zA-Z]{3} ([a-zA-Z]{3}) ([0-9]{1,2}) ([0-9]{2}:[0-9]{2}:[0-9]{2}) ([0-9]{4});(.*)/echo "$(date -d"\2 \1 \4 \3" +%s)"\\;"\5"/ep' | sort -k1 | cut --complement -d";" -f1 | tail
}


convertFlac() {
	songName="$1"
	if [[ -e "$songName" ]]; then
		ffmpeg -i "$1" -c:a libmp3lame -q:a 0 -id3v2_version 3 -map_metadata 0 "${songName::-5}".mp3
	else
		echo "song not found"
	fi
}

convToWebm() {
	input="$1"
	output="$2"
	ffmpeg -i "$input" -c:v libvpx-vp9 -crf 30 -b:v 0 -b:a 128k -c:a libopus "$output"
}

runTray() {
	bg="$(xrdb -query | grep background | head -n1 | cut -f2)"
	width="$(xrandr | grep primary | sed -nE 's/^.*([0-9]{4})x[0-9]+\+[0-9]+\+[0-9]+.*$/\1/p')"
	icons=3
	icon_size=20
	scrollbar_size=5
	xpos=$((width - (2 * scrollbar_size) - (icons * icon_size) ))
	stalonetray --config ~/.config/stalonetrayrc -bg "$bg" --icon-size "$icon_size" --geometry "$icons"x1+"$xpos"+0 --scrollbars-size "$scrollbar_size" --scrollbars-highlight disable --window-type dock
}

dunst_custom_color() {
	bg="$(xrdb -query | grep '^*background' | tr -d "\t" | cut -d":" -f2)"
	dunst -lb "$bg" -nb "$bg" -cb "$bg" 
}

switch_KB_layout() {
	kbmap="$(setxkbmap -query | grep layout | tr -d " " | cut -d":" -f2)"
	[[ $kbmap == "us" ]] && setxkbmap be && echo "keymap changed to be layout!" && return
	setxkbmap us && echo "keymap changed to us layout!"
}

aur_uninstall() {
	[[ -z $1 ]] && echo "Provide package name as argument!" && return
	repo-remove /var/cache/pacman/custom/custom.db.tar.gz "$1"
}
