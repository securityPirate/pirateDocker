#!/usr/bin/bash
apt-get update
apt-get install -y wget curl git nmap

#Download Latest Go

echo "Finding latest version of Go for AMD64..."
latest="$(curl -s https://golang.org/VERSION?m=text)"
DL_PKG="$latest.linux-amd64.tar.gz"
DL_URL="https://golang.org/dl/$DL_PKG"

echo "Downloading latest Go for AMD64: ${latest}"
wget --no-check-certificate --continue --show-progress "$DL_URL"

# Remove Old Go
rm -rf /usr/local/go

# Install new Go
tar -C /usr/local -xzf "${latest}".linux-amd64.tar.gz
echo "Create the skeleton for your local users go directory"
mkdir -p ~/go/{bin,pkg,src}
echo "Setting up GOPATH"
echo "export GOPATH=~/go" >> ~/.profile && source ~/.profile
echo "Setting PATH to include golang binaries"
echo "export PATH='$PATH':/usr/local/go/bin:$GOPATH/bin" >> ~/.profile && source ~/.profile

# Remove Download
rm "${latest}".linux-amd64.tar.gz

# Print Go Version
/usr/local/go/bin/go version