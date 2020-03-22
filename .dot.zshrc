export KEYTIMEOUT=1

bindkey -v

function zle-line-init zle-keymap-select {
   VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
   RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}"
   zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

function _reset-prompt-and-accept-line {
  RPROMPT=""
  zle reset-prompt
  zle .accept-line     # Note the . meaning the built-in accept-line.
}
zle -N accept-line _reset-prompt-and-accept-line

bindkey "^R" history-incremental-search-backward
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
bindkey "^X^E" edit-command-line

export EDITOR=vim
export ANSIBLE_NOCOWS=1
export ANSIBLE_HOST_KEY_CHECKING=false
alias k=kubectl
alias ccat='ccat --bg=dark --color=always'
alias gapw='git -c interactive.diffFilter="git diff --color-words" add -p'
eval "$(direnv hook zsh)"

HISTSIZE=10000000
SAVEHIST=10000000

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY # Don't execute immediately upon history expansion.
[[ -f '/usr/share/fzf/key-bindings.zsh' ]] && source /usr/share/fzf/key-bindings.zsh
[[ -f '/usr/share/fzf/completion.zsh' ]] && source /usr/share/fzf/completion.zsh
FZF_DEFAULT_OPTS="--preview='echo {} | ccat --color=always'"

autoload -U colors; colors
#source ~/prj/superbrothers/zsh-kubectl-prompt/kubectl.zsh
#RPROMPT='%{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'

# show_virtual_env() {
#   if [ -n "$VIRTUAL_ENV" ]; then
#    echo "($(basename $(dirname $VIRTUAL_ENV)))"
#  fi
#}
#export -f show_virtual_env
#PS1='$(show_virtual_env) '$PS1


