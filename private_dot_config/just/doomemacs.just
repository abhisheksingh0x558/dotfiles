set shell := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]
set script-interpreter := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]

# TODO: Implement commands from emacs.just and fix init command below

# Doomemacs
[macos]
[script]
init:
    echo "do shell script \"open -na Emacs.app --args --init-directory $HOME/.config/doomemacs\"" | osacompile -o /Applications/Doomemacs.app
