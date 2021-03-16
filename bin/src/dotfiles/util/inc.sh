#!/usr/bin/env bash

set -e

. "$_DOTFILES_ROOT"/util/ansi
. "$_DOTFILES_ROOT"/util/logger.sh

dotfiles() {
	"$_DOTFILES_ROOT"/libexec/dotfiles "$@"
}
