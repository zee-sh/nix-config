{ pkgs, ... }: 
{
  imports = [ 
    ../modules/cli/utils.nix
    ../modules/cli/git/git.nix
    ../modules/cli/tmux.nix
    ../modules/cli/starship.nix
    ../modules/shell/zsh/zsh.nix
    ../modules/shell/fish/fish.nix
    ../modules/shell/nushell/nushell.nix
  ];

  # this is internal compatibility configuration for home-manager,
  # don't change this!
  home.stateVersion = "23.05";
  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.home-manager = {
    enable = true;
  };

  xdg.enable = true;
  xdg.configFile."wezterm/wezterm.lua".source = ../modules/terminal/wezterm/wezterm.lua;

  home.packages = import ../modules/packages/default.nix { inherit pkgs; };
  home.shellAliases = (import ../modules/shell/aliases.nix { inherit pkgs; }).shell;

  home.sessionVariables = {
    AWS_PAGER = "${pkgs.bat}/bin/bat -p --color=always -l json";
  };
  
}
