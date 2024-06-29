{ config, ... }:
{

  programs.nushell = {
    enable = true;
    envFile.source = ./env.nu;
    configFile.source = ./config.nu;
    #extraEnv = ''
    #  mkdir ${config.xdg.cacheHome}/starship
    #  ${starshipCmd} init nu | save -f ${config.xdg.cacheHome}/starship/init.nu
    #'';
    #extraConfig = ''
    #  use ${config.xdg.cacheHome}/starship/init.nu
    #'';
  };
}
