#!/bin/bash
# ~/.bash_profile

# region Prompt Colors

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x "/usr/bin/tput" ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	;;
*) ;;
esac

# enable color support of ls and also add handy aliases
if [ -x "/usr/bin/dircolors" ]; then
	if test -r ~/.dircolors; then
		eval "$(dircolors -b ~/.dircolors)"
	else
		eval "$(dircolors -b)"
	fi
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'

	alias diff='diff --color'
	alias howdoi='howdoi --color'
	alias less='less -RFX --shift=10'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# # Have less display colours
# # from: https://wiki.archlinux.org/index.php/Color_output_in_console#man
# export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
# export LESS_TERMCAP_md=$'\e[1;33m'     # begin blink
# export LESS_TERMCAP_so=$'\e[01;44;37m' # begin reverse video
# export LESS_TERMCAP_us=$'\e[01;37m'    # begin underline
# export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
# export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
# export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
# export GROFF_NO_SGR=1                  # for konsole and gnome-terminal

# export MANPAGER='less -s -M +Gg'

export LESS_TERMCAP_mb=$(
	tput bold
	tput setaf 2
) # green
export LESS_TERMCAP_md=$(
	tput bold
	tput setaf 6
) # cyan
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(
	tput bold
	tput setaf 3
	tput setab 4
) # yellow on blue
export LESS_TERMCAP_se=$(
	tput rmso
	tput sgr0
)
export LESS_TERMCAP_us=$(
	tput smul
	tput bold
	tput setaf 7
) # white
export LESS_TERMCAP_ue=$(
	tput rmul
	tput sgr0
)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)
export GROFF_NO_SGR=1 # For Konsole and Gnome-terminal

# endregion Prompt Colors

# region Environment Variables

# Starship config:
export STARSHIP_CONFIG="${HOME}/.config/starship_ljackson.toml"

# GOVEE API KEY:
export API_KEY="a394ce42-5abc-45d2-9aa7-8690d5685d44"

# MATLAB setup:
export MATLAB_ROOT="${HOME}/MATLAB/R2022b"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${MATLAB_ROOT}/bin/glnxa64:${MATLAB_ROOT}/sys/os/glnxa64"
export PATH="${PATH}:${MATLAB_ROOT}"

export LOCAL_INSTALL_DIR="${HOME}/lib"
export PATH="${LOCAL_INSTALL_DIR}/bin:${PATH}"

export FZF_DEFAULT_OPTS="
--multi
--cycle
--hscroll-off=80
--filepath-word
--layout=reverse
--border
--margin=1
--info=inline
--marker='+'
--ansi
--tabstop=4
--preview-window 'border-top'
--bind 'ctrl-/:change-preview-window(75%|50%|25%|hidden|)'
--bind shift-up:preview-up
--bind shift-down:preview-down
"
export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree"
export FZF_COMPLETION_OPTS="${FZF_DEFAULT_OPTS} --border --info=inline --prompt=' FZF  '"

export BAT_CONFIG_PATH="${HOME}/workstation_config/config/bat/config"

# export NNN_PLUG='f:finder;o:fzopen;p:mocq;d:diffs;t:preview-tui;v:imgview;n:nuke'
export NNN_PLUG='f:finder;o:fzopen;p:mocq;d:diffs;t:preview-tui;v:imgview;n:nuke'
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_TRASH=1
export NNN_SEL="/tmp/.sel"

# endregion Environment Variables

# region Sourcing rc Files

# source "${HOME}/.bash_aliases"
# source "${HOME}/.bash_func_defs"
# source "${HOME}/Workspace/tenbeauty/.tenbeautyrc"

# endregion Sourcing rc Files
