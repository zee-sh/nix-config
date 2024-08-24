{
  config,
  lib, 
  pkgs,
  ...
}:
{

  # Git
  programs.git = {
    enable = true;
    userName = "Zeeshan Sanaullah";
    userEmail = "zeeshansanaullah@hotmail.com";
    extraConfig = {
      diff.colorMoved = "default";
      pull.rebase = true;
    };

    ignores = lib.splitString "\n" (builtins.readFile ./gitignore_global);
    includes = [];

    signing = {
      key = "~/.ssh/ed25519_24.pub";
      signByDefault = true;
      gpgPath = "";
    };
    extraConfig = {
      init = {defaultBranch = "main";};
      gpg = {format = "ssh";};
      core.editor = "nvim";
      #credential.helper = "store --file ~/.git-credentials";
      credential.helper =
        if pkgs.stdenvNoCC.isDarwin
        then "osxkeychain"
        else "cache --timeout=1000000000";
    };
    # Enhanced diffs
    delta = {
      enable = true;
      options = {
        syntax-theme = "Dracula";
        features = "side-by-side line-numbers decorations";
        decorations = "commit-decoration file-style";
        commit-decoration-style = "blue box ul";
        file-style = "blue ul";
        navigate = true;
        light = false;
        line-numbers = true;
        side-by-side = true;
      };
    };
    aliases = (import ../../shell/aliases.nix { inherit pkgs; }).git;
      #fix = "commit --amend --no-edit";
      #oops = "reset HEAD~1";
    #};
    lfs.enable = true;
  };

  # GitHub CLI
  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh";
      editor = "nvim";
    };  
  };

  # LazyGit
  programs.lazygit = {
    enable = true;
  };

}
