dotfiles
========

the stuff with dots

# First brew some 🍻

Initialize [Homebrew](https://brew.sh):

    $ ./scripts/homebrew_init.sh

## Disable analytics

    $ brew analytics off

## Install 1password

    $ brew cask install 1password

## Install mas

    $ brew install mas



# Get the dots

    $ git clone https://github.com/matthew-cox/dotfiles.git .dotfiles
    $ cd .dotfiles/
    $ git submodule init
    $ git submodule update

### Python

Prefer [pyenv](https://github.com/pyenv/pyenv) and [pynenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv) over the global version:

    $ ./scripts/python_init.sh

### Mac AppStore Apps

Install the apps from the AppStore:

    # ./scripts/mas_install.sh

### Bootstrap
<!-- Some casks may require Xcode be installed, which comes from mas.  Always run mas first! -->

Bootstrap many things with [Cider](https://github.com/msanders/cider):

    $ ln -s ~/.dotfiles/cider ~/.cider
    $ pip install -U cider
    $ yes | cider restore
    $ cider apply-defaults
    $ cider relink

### Perl

Prefer [perlbrew](https://github.com/gugod/App-perlbrew) over the global version:

    $ ./scripts/perl_init.sh

Start a new terminal, then:

    $ perlbrew install --skip-existing perl-5.27.2
    $ perlbrew switch perl-5.27.2

### Ruby

Prefer [rbenv](https://github.com/rbenv/rbenv) over the global version:

    $ ./scripts/ruby_init.sh

### SSH

#### config.d

Needs [poet](https://github.com/awendt/poet):

    $ gem install poet
    $ rm -f ~/.ssh/config
    $ poet

#### Key Symlinks

    $ ln -s ~/.ssh/simplisafe/PrdCommon.pem ~/.ssh/

### TextMate

Install TextMate bundle manager and bundles:

    # ./scripts/textmate_init.sh

### Zsh

Change the user shell:

    $ chsh -s /bin/zsh

Open a new terminal
