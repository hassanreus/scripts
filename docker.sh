 rm -rf .docker
 rm -rf goinfre/.brew
 rm -rf goinfre/.docker
 rm -rf goinfre
 ln -s ../../goinfre/hseffian goinfre
 rm -rf $HOME/.brew && git clone --depth=1 https://github.com/Homebrew/brew $HOME/.brew && echo 'export PATH=$HOME/.brew/bin:$PATH' >> $HOME/.zshrc && source $HOME/.zshrc && brew update
 mv .brew goinfre/.brew
 rm -rf /Users/hseffian/Library/Caches/Homebrew/*
 ln -s goinfre/.brew .brew
 brew install docker
 brew install docker-machine
 brew install docker-compose
 docker-machine rm -f default
 docker-machine create --driver virtualbox default
 eval $(docker-machine env default)
 mv .docker goinfre
 ln -s goinfre/.docker .docker
