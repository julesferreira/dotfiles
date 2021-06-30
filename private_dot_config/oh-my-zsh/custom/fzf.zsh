export FZF_COMPLETION_TRIGGER=';'

fzf-vicmd-completion() {
	zle vi-add-next
	FZF_COMPLETION_TRIGGER= fzf-completion
	zle vi-cmd-mode
}

zle -N fzf-vicmd-completion
bindkey -a $FZF_COMPLETION_TRIGGER fzf-vicmd-completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
