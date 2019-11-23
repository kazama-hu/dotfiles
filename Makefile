init:
	zsh
    if [ ! -e "${ZDOTDIR:-$HOME}/.zprezto" ]; then
		git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    fi
    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    	ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done

    chsh -s /usr/bin/zsh

	if [ ! -e "${HOME}/.pyenv" ]; then
		git clone https://github.com/pyenv/pyenv.git ~/.pyenv
	fi

deploy:
	ln -sf .latexmkrc ~/.latexmkrc
	ln -sf .nanorc ~/.nanorc
	ln -sf .spacemacs ~/.spacemacs
	ln -sf .tmux.conf ~/.tmux.conf
	ln -sf .p10k.zsh ~/.p10k.zsh
	ln -sf .zpreztorc ~/.zpreztorc
	ln -sf .zshrc ~/.zshrc

	exec $SHELL -l

server_2:
	ln -sf .zshenv_2 ~/.zshenv

server_4:
	ln -sf .zshenv_4 ~/.zshenv
