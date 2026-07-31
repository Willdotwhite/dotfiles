#zmodload zsh/zprof

export ZSHROOT="$HOME/dotfiles-vsc/zsh"

# Load the shared base shell configuration first.
source "$ZSHROOT/zshrc-base"

# Stuff across all environments
# Source machine-agnostic config fragments (style, git, keybindings, etc).
for file in $ZSHROOT/common/zshrc-*; do
    source "$file"
done

# Stuff specific to this machine
# Source local overrides and machine-specific config files.
for file in $ZSHROOT/local/zshrc-*; do
    source "$file"
done

# Theme
source "$HOME/dotfiles-vsc/dotwo.zsh-theme"

# Must be last
# Syntax highlighting needs to load after most prompt/keybinding setup.
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#zprof
