# Infracture only installation of TeX Live
# This is just enough to support tlmgr
selected_scheme scheme-infraonly

# Redefine the path to avoid permissions and
# allow Travis-CI to cache the installation
TEXDIR /tmp/texlive
TEXMFCONFIG ~/.texlive/texmf-config
TEXMFHOME ~/texmf
TEXMFLOCAL /tmp/texlive/texmf-local
TEXMFSYSCONFIG /tmp/texlive/texmf-config
TEXMFSYSVAR /tmp/texlive/texmf-var
TEXMFVAR ~/.texlive/texmf-var

# Do not install documentation or sources
option_doc 0
option_src 0
