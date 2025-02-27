#!/bin/bash
set -eu

SSHPATH="$HOME/.ssh"
mkdir -p "$SSHPATH"
echo "$DEPLOY_KEY" > "$SSHPATH/key"
chmod 600 "$SSHPATH/key"
SERVER_DEPLOY_STRING="$USERNAME@$SERVER_IP:$SERVER_DESTINATION"
ssh-add
# sync it up"
echo "rsync $ARGS -e 'ssh -p $SERVER_PORT' $GITHUB_WORKSPACE/$FOLDER $USERNAME@$SERVER_IP:$SERVER_DESTINATION"
sh -c "rsync -e 'ssh -p $SERVER_PORT' -azp $GITHUB_WORKSPACE/$FOLDER $USERNAME@$SERVER_IP:$SERVER_DESTINATION"
