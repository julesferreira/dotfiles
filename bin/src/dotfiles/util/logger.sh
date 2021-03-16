#!/usr/bin/env bash

set -e

. "$_DOTFILES_ROOT"/util/ansi

log_info() {
	log_template "$@" blue
}

log_error() {
	log_template "$@" red
}

log_template() {
	((length="${#1}"+12))
	ansi --$2 $(head -c "$length" < /dev/zero | tr '\0' '▁')
	ansi --inverse --$2-intense -n ' dotfiles'
	ansi --$2 --bg-$2-intense -n '▕'
	ansi --$2 --bg-white-intense -n '▏'
	ansi --inverse "$1 "
	ansi --$2 $(head -c "$length" < /dev/zero | tr '\0' '▔')
}

dotfiles() {
	"$_DOTFILES_ROOT"/libexec/dotfiles "$@"
}
