use std 'path add'

# Path
# Add Nix to path on MacOS
# TODO: Merge this setting to upstream nixpkgs and remove from here
if (uname | get kernel-name) == "Darwin" {
	path add /usr/local/bin
	path add /nix/var/nix/profiles/default/bin
	path add /run/current-system/sw/bin
	path add ~/.nix-profile/bin
	(uname | get machine) == "arm64"; path add /opt/homebrew/bin # Add Homebrew to path on MacOS on ARM machine
}
$env.PATH = ($env.PATH | uniq) # De-duplicate path elements
