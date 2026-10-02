# My dotfiles

A vaguely-ordered collection of dotfiles for my terminal-heavy workflow.

> [!NOTE]
> Requires zshell (`echo $SHELL == /bin/zsh`)
>
> The zshrc files are 90% done, everything else needs a bit of work; apologies if you see my username in silly places.

## Setup

1. Clone this repo (I use `~/.dotfiles`)
2. Update `~/.zshrc` with the following:

```
source ~/.dotfiles/.zshrc
```

## Setup 2 - full machine setup

> [!WARN]
> If you only wanted to borrow my zshrc file structure, stop reading now

Running `./setup.sh` installs as much of my toolchain as possible, including installing/configuring Ghostty and a bunch
of Homebrew stuff. 
