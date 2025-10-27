set shell := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]
set script-interpreter := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]

# TODO: Implement commands from nvim.just and fix init command below

# LazyVim
[macos]
[script]
init:
    echo "do shell script \"NVIM_APPNAME=lazyvim open -na Neovide.app\"" | osacompile -o /Applications/LazyVim.app
