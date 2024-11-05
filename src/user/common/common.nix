# TODO: Delete this file
{ lib, config, ... }:
let gitAliasPrefix = "g";
in {
  # Shell aliases
  options.shell.aliases = lib.mkOption {
    type = lib.types.attrsOf lib.types.str;
    default = {
      "lg" = "lazygit";
    } // lib.attrsets.mapAttrs' (name: value:
      lib.attrsets.nameValuePair (gitAliasPrefix + name) ("git " + value))
      config.programs.git.aliases;
  };
}
