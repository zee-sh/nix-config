{ pkgs, ... }:

{
  programs.wezterm = {
    enable = true;
    enableBashIntergration = true;
    enableZshIntegration = true;
    extraConfig = builtins.readFile ./wezterm.lua;
  };
}
