init:
	$(eval SHELL := $(shell which zsh))
	$(SHELL) -c 'if [[ ! -e "${HOME}/.zprezto" ]]; then git clone --recursive https://github.com/sorin-ionescu/prezto.git "${HOME}/.zprezto"; fi'
	$(SHELL) -c 'setopt EXTENDED_GLOB'
	$(SHELL) -c 'for rcfile in "${HOME}"/.zprezto/runcoms/^README.md(.N); do ln -s "$rcfile" "${HOME}/.${rcfile:t}"; done'
	$(SHELL) -c 'if [[ ! -e "${HOME}/.pyenv" ]]; then git clone https://github.com/pyenv/pyenv.git ~/.pyenv; fi'

deploy: init
	ln -sf ~/dotfiles/.latexmkrc ~/.latexmkrc
	ln -sf ~/dotfiles/.nanorc ~/.nanorc
	ln -sf ~/dotfiles/.spacemacs ~/.spacemacs
	ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
	ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh
	ln -sf ~/dotfiles/.zpreztorc ~/.zpreztorc
	ln -sf ~/dotfiles/.zshrc ~/.zshrc
	chsh -s $(SHELL)
	exec "${SHELL}"
	$(SHELL)

macbook:
	ln -sf ~/dotfiles/.zshenv ~/.zshenv

server_2:
	ln -sf ~/dotfiles/.zshenv_2 ~/.zshenv

server_4:
	ln -sf ~/dotfiles/.zshenv_4 ~/.zshenv

server_5:
	ln -sf ~/dotfiles/.zshenv_5 ~/.zshenv
