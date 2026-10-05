#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  /bin/bash "$SCRIPT_DIR/install_brew.sh"
else
  echo "Homebrew already installed"
fi

# If the only Java installed is the default installation,
# install SDKMAN and Java
if ! which -a java 2>/dev/null | grep -v '^/usr/bin/java$' >/dev/null; then
  echo "Installing SDKMAN and Java 25"
  curl -s "https://get.sdkman.io" | bash
  source "$HOME/.sdkman/bin/sdkman-init.sh"
  sdk install java 25.2.4-graalce
fi

echo "Software install steps completed."
