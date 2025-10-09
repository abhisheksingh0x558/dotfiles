set shell := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]
set script-interpreter := ["bash", "-o", "errexit", "-o", "nounset", "-o", "pipefail", "-o", "xtrace", "-c"]

default: refresh prune sync upgrade

# Install Emacs packages
sync:
    emacs --batch --load=~/.config/emacs/init.el --eval="(elpaca-wait)"

# Upgrade Emacs packages
upgrade:
    emacs --batch --load=~/.config/emacs/init.el --eval="(progn (elpaca-pull-all) (elpaca-wait))" # TODO: Run this in the background

# Upgrade Emacs package manager and its registry
refresh:
    emacs --batch --load=~/.config/emacs/init.el --eval="(progn (elpaca-pull elpaca) (elpaca-wait))" # TODO: Run this in the background

# Prune Emacs packages
prune:
    # TODO: Implment these commands # TODO: Run this in the background

# Install Emacs package
install package:
    # TODO: implement this
