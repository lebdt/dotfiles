# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
##### export ZSH="$HOME/.oh-my-zsh"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Other environement variables
export HOMEBREW_NO_AUTO_UPDATE=1

# Export path to remove some non-existing dirs in PATH
export PATH="/Users/ebd/.asdf/shims:/opt/homebrew/opt/asdf/libexec/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/dotnet:/Library/Apple/usr/bin:/Users/ebd/.cargo/bin:/Users/ebd/.local/bin"

# Export LIBRARY_PATH to fix some linking errors with rust builds
export LIBRARY_PATH=$(brew --prefix)/lib

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# ZSH_THEME="kardan"

#### ZSH_THEME="typewritten/typewritten"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# function _dotfiles_ansi_dequote()
# {
#   # `strip-ansi-escapes` is a utility that ships with wezterm and filters out ansi escape sequences
#   if hash strip-ansi-escapes 2>/dev/null ; then
#     echo "$1" | strip-ansi-escapes
#   else
#     echo "$1" | perl -pe "s/\\x1b\[[0-9]+(;[0-9]+)*[km]//g"
#   fi
# }

# function _dotfiles_set_window_title()
# {
#   local title
#   title=`_dotfiles_ansi_dequote "$1" | perl -pe "s/;//g"`
#   case $TERM in
#     xterm*|rxvt*|Eterm|eterm|aixterm|dtterm)
#       printf "\033]0;%s\a" "$title"
#       ;;
#     iris-ansi)
#       printf "\033P1.y%s\033\\" "$title"
#       ;;
#     sun-cmd)
#       printf "\033]l%s\033\\" "$title"
#       ;;
#     hpterm)
#       printf "\033&f0k%dD%s" "${#title}" "${title}"
#       ;;
#     screen*|tmux*)
#       # screen and tmux window title
#       printf "\033k%s\033\\" "$title"
#       # set the tmux pane title too
#       [[ -n "$TMUX" ]] && printf "\033]2;%s\033\\" "$title"
#       ;;
#   esac
# }

# Run by zsh immediately before we exec a command; we use it to amend
# the window title to show what is running.
# function preexec()
# {
#   local cmd
#   cmd="$1"
#   case $cmd in
#     fg*)
#       # show something more useful than "fg" when we resume a suspended job
#       local job
#       read cmd job <<< "$cmd"
#       if [[ -z "$job" ]] ; then
#         # the echo is to strip extra whitespace
#         cmd=$(echo $(builtin jobs -l %+ 2>/dev/null | cut -d' ' -f6-))
#       else
#         cmd=$(echo $(builtin jobs -l $job 2>/dev/null | cut -d' ' -f6-))
#       fi
#       ;;
#   esac
#   _dotfiles_set_window_title "❯  $cmd"
# }

# function set_user_var() {
#    printf "\033]1337;SetUserVar=%s=%s\007" $1 `echo -n $2 | base64`
# }

# set_user_var USERHOST "$HOST"
# set_user_var USERPWD "$PWD"

# function which_term() {
#      term=$(ps -p $(ps -p $$ -o ppid=) -o args=);
#      found=0;
#      case $term in
#          *gnome-terminal*)
#              found=1
#              echo "gnome-terminal " $(dpkg -l gnome-terminal | awk '/^ii/{print $3}')
#              ;;
#          *lxterminal*)
#              found=1
#              echo "lxterminal " $(dpkg -l lxterminal | awk '/^ii/{print $3}')
#              ;;
#          rxvt*)
#              found=1
#              echo "rxvt " $(dpkg -l rxvt | awk '/^ii/{print $3}')
#              ;;
#          ## Try and guess for any others
#          *)
#              for v in '-version' '--version' '-V' '-v'
#              do
#                  $term "$v" &>/dev/null && eval $term $v && found=1 && break
#              done
#              ;;
#      esac
#      ## If none of the version arguments worked, try and get the 
#      ## package version
#      [ $found -eq 0 ] && echo "$term " $(dpkg -l $term | awk '/^ii/{print $3}')    
#  }

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)

###### source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
alias nvimdiff="nvim -d"

alias manga="python3 ~/Documents/Mangas/mangascrape.py"

alias reverse="python3 ~/Documents/Python/reverse_text.py"

alias gmaps="python3 ~/Documents/Python/Google\ Maps\ AutoSearch/GMaps_Search.py"

alias step-one="cd /Users/ebd/Documents/RuggeriGusttati/X-OtherFiles/EmailSender/ && python3 step-one.py && cd /Users/ebd/"

alias texrun="mkdir -p output && lualatex --output-directory=output"

alias ls="ls --color"

alias cat="bat"

alias tile="yabai --start-service && skhd --start-service"

function fzf_open() {
   fzfGetPath=$(fzf); nvim $fzfGetPath 
}

alias fzf-open="fzf_open"

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

source ~/.scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#232323"

. /opt/homebrew/opt/asdf/libexec/asdf.sh

# export PATH="/Users/ebd/.asdf/shims:/Users/ebd/.cargo/bin:/opt/homebrew/opt/asdf/libexec/bin:/Users/ebd/.local/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/Library/Frameworks/Python.framework/Versions/3.10/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/dotnet:/Library/Apple/usr/bin"

export FZF_DEFAULT_OPTS="-m"
FZF_DEFAULT_OPTS+=" --color='fg+:#d7005f,bg+:-1,info:-1'"
FZF_DEFAULT_OPTS+=" --height 40%"
FZF_DEFAULT_OPTS+=" --bind 'ctrl-u:preview-up,ctrl-d:preview-down,ctrl-o:toggle+up,ctrl-i:toggle+down,ctrl-space:toggle-preview'"
FZF_DEFAULT_OPTS+=" --preview 'bat -n --color=always {}'"
# FZF_DEFAULT_OPTS+=" --preview-window=:hidden"
# FZF_DEAFULT_OPTS+=" --bind='?:toggle-preview"

export GIT_EDITOR=nvim

export VISUAL=nvim

export EDITOR="$VISUAL"

# export NEOVIDE_FRAME=buttonless

export JUPYTER_PATH=/opt/homebrew/share/jupyter 

export JUPYTER_CONFIG_PATH=/opt/homebrew/etc/jupyter

bindkey -v
