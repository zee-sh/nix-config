{ pkgs, ... }:

{

  programs.zellij = {
    enable = true;
    #settings = {
    #  theme = "Dracula";
    #};
  };

  xdg.configFile."zellij/config.kdl".source = ../../config/zellij-config.kdl;
  #xdg.configFile."zellij/layouts/split.kdl".source = ./zellij-layout.kdl;
  #xdg.configFile."zellij/layouts/default.kdl".source = ./zellij-layout-combined.kdl;

}
