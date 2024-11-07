#!/bin/sh
set -e
echo "Activating feature 'doppler'"
COMPLETION=${COMPLETION:-true}
echo "doppler completion files installed: $COMPLETION"
# feature scripts run as root but we want to install doppler for the container
# or remote user
# https://containers.dev/implementors/features/#user-env-var
DIRECTORY="$_REMOTE_USER_HOME"

# Update package index and install dependencies
apk add --no-cache wget bash ca-certificates

# Add Doppler's package repo
wget -q -t3 'https://packages.doppler.com/public/cli/rsa.8004D9FF50437357.key' -O /etc/apk/keys/cli@doppler-8004D9FF50437357.rsa.pub
echo 'https://packages.doppler.com/public/cli/alpine/any-version/main' | tee -a /etc/apk/repositories

# Install Doppler CLI
apk add doppler

mkdir -p /usr/local/share/doppler
cp ${PWD}/scripts/setup-doppler.sh /usr/local/share/doppler/setup-doppler.sh
chmod +x /usr/local/share/doppler/setup-doppler.sh

# Install completions
if [ "$COMPLETION" = "true" ]; then
    apk add bash-completion
    doppler completion install bash
    doppler completion install zsh
    # Fish completions not supported due to limitations
fi

# Clean up
rm -rf /tmp/doppler