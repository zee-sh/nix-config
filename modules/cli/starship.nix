{ pkgs, lib, ...}: 
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
    settings = {
      format = "$directory$character";
      right_format = "$git_branch$git_commit$git_state$git_status$aws$nix_shell$cmd_duration$shlvl";

      add_newline=false;
      command_timeout = 1000;

      fill = {
        symbol = " ";
        disabled = false;
      };

      # Core
      username = {
        format = "[$user]($style)";
        #show_always = true;
      };
      hostname = {
        format = "[@$hostname]($style) ";
        ssh_only = true;
        style = "bold green";
      };
      shlvl = {
        #format = "[$shlvl]($style) ";
        format = "[$symbol $shlvl]($style)";
        style = "bold yellow";
        threshold = 2;
        #repeat = true;
        disabled = false;
      };
      cmd_duration = {
        format = "[$duration]($style) ";
      };

      directory = {
        #style = "bg:#A277FF fg:#15141B";
        style="bold green";
        format = "[$path ]($style)[$read_only]($read_only_style)";
        truncation_length = 3;
      };
      nix_shell = {
        format = " [( $name <- )$symbol]($style) ";
        impure_msg = "";
        symbol = " ";
        style = "bold red";
      };

      character = {
        #error_symbol = "[~>](bold red)";
        error_symbol = "[✖](bold fg:red)";
        success_symbol = "[>](bold green)";
        vimcmd_symbol = "[<<-](bold yellow)";
        vimcmd_visual_symbol = "[<<-](bold cyan)";
        vimcmd_replace_symbol = "[<<-](bold purple)";
        vimcmd_replace_one_symbol = "[<<-](bold purple)";
      };

      time = {
        format = "\\\[[$time]($style)\\\]";
        disabled = false;
      };

      # Cloud
      gcloud = {
        format = "on [$symbol$active(/$project)(\\($region\\))]($style)";
      };
      aws = {
        format = " [$symbol$profile(\\($region\\))]($style)";
      };

      # Icon changes only \/
      aws.symbol = " ";
      conda.symbol = " ";
      dart.symbol = " ";
      directory.read_only = " ";
      docker_context.symbol = " ";
      elm.symbol = " ";
      elixir.symbol = "";
      gcloud.symbol = " ";
      git_branch.symbol = " ";
      golang.symbol = " ";
      hg_branch.symbol = " ";
      java.symbol = " ";
      julia.symbol = " ";
      memory_usage.symbol = "󰍛 ";
      nim.symbol = "󰆥 ";
      nodejs.symbol = " ";
      package.symbol = "󰏗 ";
      perl.symbol = " ";
      php.symbol = " ";
      python.symbol = " ";
      ruby.symbol = " ";
      rust.symbol = " ";
      scala.symbol = " ";
      shlvl.symbol = "";
      swift.symbol = "󰛥 ";
      terraform.symbol = "󱁢";

      palette = "catppuccin_mocha";

      palettes.catppuccin_mocha = {
        rosewater = "#f5e0dc";
        flamingo  = "#f2cdcd";
        pink      = "#f5c2e7";
        mauve     = "#cba6f7";
        red       = "#f38ba8";
        maroon    = "#eba0ac";
        peach     = "#fab387";
        yellow    = "#f9e2af";
        green     = "#a6e3a1";
        teal      = "#94e2d5";
        sky       = "#89dceb";
        sapphire  = "#74c7ec";
        blue      = "#89b4fa";
        lavender  = "#b4befe";
        text      = "#cdd6f4";
        subtext1  = "#bac2de";
        subtext0  = "#a6adc8";
        overlay2  = "#9399b2";
        overlay1  = "#7f849c";
        overlay0  = "#6c7086";
        surface2  = "#585b70";
        surface1  = "#45475a";
        surface0  = "#313244";
        base      = "#1e1e2e";
        mantle    = "#181825";
        crust     = "#11111b";
      };

      palettes.gruvbox_dark = {
        color_fg0 = "#fbf1c7";
        color_bg1 = "#3c3836";
        color_bg3 = "#665c54";
        color_blue = "#458588";
        color_aqua = "#689d6a";
        color_green = "#98971a";
        color_orange = "#d65d0e";
        color_purple = "#b16286";
        color_red = "#cc241d";
        color_yellow = "#d79921";
      };

      palettes.flexoki_dark = {
        black = "#100f0f";
        red = "#af3029";
        green = "#66800b";
        yellow = "#ad8301";
        blue = "#205ea6";
        purple = "#5e409d";
        cyan = "#24837b";
        white = "#cecdc3";
        bright-black = "#575653";
        bright-red = "#d14d41";
        bright-green = "#879a39";
        bright-yellow = "#d0a215";
        bright-blue = "#4385be";
        bright-purple = "#8b7ec8";
        bright-cyan = "#3aa99f";
        bright-white = "#fffcf0";
      };  

      palettes.catppuccin_latte = {
        rosewater = "#dc8a78";
        flamingo = "#dd7878";
        pink = "#ea76cb";
        mauve = "#8839ef";
        red = "#d20f39";
        maroon = "#e64553";
        peach = "#fe640b";
        yellow = "#df8e1d";
        green = "#40a02b";
        teal = "#179299";
        sky = "#04a5e5";
        sapphire = "#209fb5";
        blue = "#1e66f5";
        lavender = "#7287fd";
        text = "#4c4f69";
        subtext1 = "#5c5f77";
        subtext0 = "#6c6f85";
        overlay2 = "#7c7f93";
        overlay1 = "#8c8fa1";
        overlay0 = "#9ca0b0";
        surface2 = "#acb0be";
        surface1 = "#bcc0cc";
        surface0 = "#ccd0da";
        base = "#eff1f5";
        mantle = "#e6e9ef";
        crust = "#dce0e8";
      };  
    };
  };
}
