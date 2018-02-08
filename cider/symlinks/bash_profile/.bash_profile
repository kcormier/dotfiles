source ~/.profile
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/Users/kcormier/simplisafe_projects/chewie-tool/bin:$PATH"
#
# Add rbenv
#
#eval "$(rbenv init -)"
#rbenv bundler on

#
# pyenv
#
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

