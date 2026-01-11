#!/bin/bash

SOURCE_SSH="/mnt/host-ssh"
TARGET_SSH="/home/jaysh/.ssh"
SOURCE_GPG="/mnt/host-gpg"
TARGET_GPG="/home/jaysh/.gnupg"

echo "--- Entrypoint: Setting up keys ---"

# copy ssh keys
if [ -d "$SOURCE_SSH" ] && [ "$(ls -A $SOURCE_SSH)" ]; then
    echo "Copying SSH keys..."
    cp -rL "$SOURCE_SSH/." "$TARGET_SSH/"
    chown -R jaysh:jaysh "$TARGET_SSH"
    chmod 700 "$TARGET_SSH"
    chmod 600 "$TARGET_SSH/"*
    # Optional: public keys readable
    find "$TARGET_SSH" -name "*.pub" -exec chmod 644 {} \;
fi

# copy gpg keys
if [ -d "$SOURCE_GPG" ] && [ "$(ls -A $SOURCE_GPG)" ]; then
    echo "Copying GPG keys..."
    cp -rL "$SOURCE_GPG/." "$TARGET_GPG/"
    chown -R jaysh:jaysh "$TARGET_GPG"
    chmod 700 "$TARGET_GPG"
    chmod 600 "$TARGET_GPG/"*
fi

# give jaysh ownership
chown -R jaysh:jaysh /home/jaysh/dotfiles

# switch user
echo "--- Dropping privileges to jaysh ---"
exec runuser -u jaysh -- "$@"
