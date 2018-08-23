#!/usr/bin/env bash

# Fetch refs for remote branches other than master
git config remote.origin.fetch +refs/heads/*:refs/remotes/origin/*
git fetch

# Stash the build products
git stash --include-untracked

# Checkout the gh-pages branch and remove
# the current version of the dissertation
git checkout -b gh-pages origin/gh-pages
rm main.pdf

# Unstash the build products and remove all untracked files
git stash pop
git clean -fxd

