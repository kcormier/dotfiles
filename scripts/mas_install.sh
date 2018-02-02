#!/usr/bin/env bash
#
# Initialize Mas App Store apps
#
set -o errexit -o pipefail -o nounset
# set -x
WORKDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" || exit; pwd -P)
#
##############################################################################
#
# Load some utilities
#
readonly THE_UTILS=( "common" )

for utility in "${THE_UTILS[@]}"; do
  if [[ -r "${WORKDIR}/utils_${utility}.sh" ]]; then
    source "${WORKDIR}/utils_${utility}.sh"
  fi
done
#
##############################################################################
#
# "Global" variables
#
MAS_APPS=(
  # Installed manually as part of prep
  # 443987910  #1Password
  406056744  #Evernote
  412980789  #Full Deck Solitaire
  803453959  #Slack
  406825478  #Telephone
  410628904  #Wunderlist
  715768417  #Microsoft Remote Desktop 8.0
  1295203466 #Microsoft Remote Desktop 10
  497799835  #Xcode
)

# Might need this if running under tmux
# || echo ensures we don't fail in the event reattach-to-user-namespace is missing
user_namespace_attach="$(command -v reattach-to-user-namespace 2>/dev/null || echo)"

if [[ $(command -v mas) ]]; then
  for APP in "${MAS_APPS[@]}"; do
    putinfo "Installing '${APP}'..."
    if [[ -n "${user_namespace_attach:-}" ]]; then
      $user_namespace_attach mas install $APP
    else
      mas install $APP
    fi
    putinfo "Done"
  done
else
  puterror "mas command not found"
  exit 1
fi
