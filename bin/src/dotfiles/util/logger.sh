#!/usr/bin/env bash

set -e

. "$_DOTFILES_ROOT"/util/ansi

log_info() {
	((length="${#1}"+12))
	ansi --blue $(head -c "$length" < /dev/zero | tr '\0' '▁')
	ansi --inverse --blue-intense -n ' dotfiles'
	ansi --blue --bg-blue-intense -n '▕'
	ansi --blue --bg-white-intense -n '▏'
	ansi --inverse "$1 "
	ansi --blue $(head -c "$length" < /dev/zero | tr '\0' '▔')
}

