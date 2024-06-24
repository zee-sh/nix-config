{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = (import ../aliases.nix { inherit pkgs; }).shell;
  };

}
