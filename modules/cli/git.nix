{
  config,
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

    ignores = [".DS_Store" "*~" "*.swp"];
    includes = [];

    aliases = {};
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
        syntax-theme = "Monokai Extended";
        features = "coracias-caudatus";
        navigate = true;
        light = false;
        line-numbers = true;
        side-by-side = true;
      };
    };

    aliases = {
      fix = "commit --amend --no-edit";
      oops = "reset HEAD~1";

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
