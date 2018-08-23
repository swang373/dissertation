#!/usr/bin/env bash

# Install TeX Live with the minimal set of packages needed to support
# compilation of the University of Florida's dissertation template
# on Travis-CI's default virtualization environment (Ubuntu 14.04 LTS).
#
# Based on the Travis-CI setup written by Joseph Wright for the LaTeX3 project.

# Setup TeX Live if a cached version is unavailable
export PATH="/tmp/texlive/bin/x86_64-linux:$PATH"

if ! command -v xelatex > /dev/null; then
  wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
  tar -zxf install-tl-unx.tar.gz
  pushd install-tl-20*
  ./install-tl --profile=../.ci/texlive.profile
  popd
fi

# Install base packages required to build plain and LaTeX formats
tlmgr install cm etex knuth-lib latex-bin tex-ini-files unicode-data xetex

# Install packages required for graphics support (includes graphicx, keyval, lscape)
tlmgr install graphics graphics-cfg graphics-def oberdiek

# Install packages required for font support
tlmgr install --no-depends fontspec
tlmgr install lm zapfding

# Install remaining packages needed to compile the UF dissertation template
# amscls includes amsthm
# ms includes ragged2e
# tools includes bm, calc, longtable, tabularx
tlmgr install  \
  algorithmicx \
  amscls       \
  amsfonts     \
  amsmath      \
  geometry     \
  hyperref     \
  ifxetex      \
  natbib       \
  ms           \
  sectsty      \
  setspace     \
  tools        \
  ulem         \
  url

# Disable backups to reduce cache size
tlmgr option -- autobackup 0

# Update all local packages only
tlmgr update --self --all --no-auto-install

