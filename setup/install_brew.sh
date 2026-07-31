#!/usr/bin/env bash
set -euo pipefail

# General purpose, likely for any env
brew install \
  bat \
  coreutils \
  curl \
  fzf \
  git \
  htop \
  jq

# Current work focus/requirements
brew install \
  awscli \
  cmake \
  docker-credential-helper-ecr \
  gradle \
  make \
  node \
  pnpm \
  ruff \
  uv


# Work-specific
brew tap bbc/gobbc https://github.com/bbc/gobbc
brew trust bbc/gobbc
brew install gobbc
