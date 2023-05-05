#!/bin/bash

USER_ID=${UID:-9001}
GROUP_ID=${GID:-9001}

echo "Starting with UID: $USER_ID, GID: $GROUP_ID"

groupmod -g $GROUP_ID -o user
usermod -u $USER_ID -d /home/user -m -o user

exec gosu user /bin/bash
