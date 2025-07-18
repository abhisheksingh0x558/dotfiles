set shell := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]
set script-interpreter := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]

# Keyd key mappings
[linux]
[script]
init:
    keyd_dir=/etc/keyd
    [[ ! -d "$keyd_dir" ]] && sudo mkdir "$keyd_dir"
    keyd_file="$keyd_dir/default.conf"
    [[ ! -f "$keyd_file" ]] && sudo cp ~/.config/keyd/default.conf "$keyd_file"
    sudo systemctl restart keyd
