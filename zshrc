# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history


export LC_CTYPE=fr_FR.UTF-8


setopt HIST_IGNORE_DUPS
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
#eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#Navigation dans l'autocompletion
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BDésolé, pas de résultats pour : %d%b'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:mv:*' ignore-line yes
zstyle ':completion:*:cp:*' ignore-line yes

# un VRAI éditeur de texte ;)
export EDITOR=/usr/bin/vim
# Pour Crontab
export VISUAL=/usr/bin/vim

autoload -U promptinit
promptinit
prompt adam2
# do NOT share history between terminals
unsetopt share_history

# Adds custom zsh completion
if [ -d $HOME/.zsh/complete ]; then
    fpath=(~/.zsh/complete $fpath)
fi

if [ -f .$HOME/.zsh/tools/completion-generator/zsh-completion-generator.plugin.zsh ]; then
    GENCOMPL_PY=python2
    GENCOMPL_FPATH=$HOME/.zsh/complete
    source $HOME/.zsh/tools/completion-generator/zsh-completion-generator.plugin.zsh
fi

# Use modern completion system
autoload -Uz compinit
compinit


# source aliases
[ -f ~/.aliases ] && source ~/.aliases

# Default keybindings
bindkey  '\eOH' beginning-of-line
bindkey  '\eOF' end-of-line
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history
bindkey "^[[2~" yank
bindkey "^[[3~" delete-char
bindkey "^[e" expand-cmd-path
bindkey " " magic-space

bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word

