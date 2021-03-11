help:
	@echo 'usage:'
	@echo '  make homebrew  install/upgrade homebrew'

install-homebrew:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

homebrew: install-homebrew
	@echo 'install/upgrade homebrew'
