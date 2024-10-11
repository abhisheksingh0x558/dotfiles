{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Fennel
    # TODO: Install linter
    luajitPackages.fennel
    fennel-ls # Language server
    fnlfmt # Formatter
  ];
}
