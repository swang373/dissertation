#!/usr/bin/env bash

# Make sure the current working directory is the build directory.
cd "$TRAVIS_BUILD_DIR"

# Fetch all other remote branches.
git config remote.origin.fetch +refs/heads/*:refs/remotes/origin/*
git fetch

# Stash the build products.
git stash --include-untracked

# Checkout the gh-pages branch.
git checkout -b gh-pages origin/gh-pages

# Remove the previous dissertation version, replace it with the
# latest version built by Travis-CI, and clean untracked files.
rm main.pdf
git stash pop
git add main.pdf
git clean -fxd

