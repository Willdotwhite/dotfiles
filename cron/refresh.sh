#!/bin/zsh

# This script refreshes the AWS CodeArtifact token for NPM if it hasn't been refreshed in the last 11 hours.
# Designed to be run from cron every hour
#
#   crontab -e
#   1 * * * * /path/to/script/refresh_codeartifact_token.sh >> /tmp/refresh_codeartifact_token.log 2>&1
set -e
export AWS_PROFILE=tooling
TIMESTAMP_FILE="$HOME/.npm_last_run_check"

if stat --version >/dev/null 2>&1; then
    # GNU stat (from Homebrew/Coreutils)
    STAT_FLAGS="-c %Y"
else
    # BSD stat (Default macOS)
    STAT_FLAGS="-f %m"
fi

if [[ -f "$TIMESTAMP_FILE" ]]; then
    LAST_RUN=$(stat $STAT_FLAGS "$TIMESTAMP_FILE")
else
    LAST_RUN=0
fi

NOW=$(date +%s)
DIFF=$(( NOW - LAST_RUN ))

# If the token was last refreshed more than 11 hours ago (39600 seconds), refresh it
if [[ $DIFF -ge 39600 ]]; then
    source ~/.zprofile
    source ~/.zshrc
    echo "Signing in to NPM CodeArtifact"
    aws codeartifact login --tool npm --repository npm --domain bbc-search --domain-owner 536795411033 --region eu-west-1
    echo "Signing in to PIP CodeArtifact"
    aws codeartifact login --tool pip --repository cosmic --domain bbc-search --domain-owner 536795411033 --region eu-west-1
    touch "$TIMESTAMP_FILE"
else
    echo "Task skipped. Only $DIFF seconds since last run."
fi
