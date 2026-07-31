#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$ROOT_DIR/setup/install_software.sh"
"$ROOT_DIR/setup/install_terminal.sh"

echo "Setup complete."
