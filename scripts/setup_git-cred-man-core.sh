# Install Git Credential Manager

wget "https://github.com/GitCredentialManager/git-credential-manager/releases/download/v2.0.886/gcm-linux_amd64.2.0.886.deb" -O /tmp/gcmcore.deb

sudo dpkg -i /tmp/gcmcore.deb

git-credential-manager configure


# Configure it to use SecretService
git config --global credential.credentialStore secretservice
