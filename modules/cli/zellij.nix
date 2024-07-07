{ pkgs, ... }:

{

  programs.zellij = {
    enable = true;
    settings = {
      theme = "Dracula";
    };
  };
}
