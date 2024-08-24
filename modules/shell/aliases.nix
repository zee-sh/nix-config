{ pkgs }:

{
  gh = {
    pvw = "pr view --web";
    rvw = "repo view --web";
  };

  git = {
    ba = "branch -a";
    bd = "branch -D";
    br = "branch";
    cam = "commit -am";
    co = "checkout";
    cob = "checkout -b";
    ci = "commit";
    cm = "commit -m";
    cp = "commit -p";
    crp = "cherry-pick";
    d = "diff";
    dco = "commit --amend --no-edit --signoff";
    s = "status";
    pr = "pull --rebase";
    st = "status";
    l =
      "log --graph --pretty='%Cred%h%Creset - %C(bold blue)<%an>%Creset %s%C(yellow)%d%Creset %Cgreen(%cr)' --abbrev-commit --date=relative";
    whoops = "reset --hard";
    wipe = "commit -s";
    fix = "rebase --exec 'git commit --amend --no-edit -S' -i origin/develop";
  };

  shell = {
    # General

    cd = "z";
    lg = "lazygit";
    g = "git ";
    ga = "git add";
    gco = "git checkout";
    gcm = "git checkout main";
    gd = "git diff";
    gds = "git diff --staged";
    gst	= "git status";
    gl = "git log";
    gpr = "git pull --rebase";

 
    l = "eza -l --icons --git -a";
    ltr = "eza -lh --tree --git --icons=auto";

    nvim ="/Users/zeeshans/nvim-macos-arm64/bin/nvim";
    vim = "nvim";
    v = "vim";
 
    fzp = "fzf -m --preview 'bat --style=numbers --color=always {}'";
    vinv = "v $(fzp)";

    f = "open .";
    cl = "clear";

    st1 = "export STARSHIP_CONFIG=~/projects/personal/nix-config/config/starship1.toml";

    # Dirs
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    "....." = "cd ../../../..";
    "......" = "cd ../../../../..";
    "--" = "cd -";

    #Network
    ip = "dig +short myip.opendns.com @resolver1.opendns.com";
    localip = "ipconfig getifaddr en0";
    copyssh = "pbcopy < $HOME/.ssh/ed25519_24.pub";
    addssh = "ssh-add  ~/.ssh/ed25519 --apple-use-keychain --apple-load-keychain";

    # Print each PATH entry on a separate line
    #path = "echo -e ${PATH//:/\\n}";

    flushd = "dscacheutil -flushcache && killall -HUP mDNSResponder";
    lscleanup = "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder";

    # Hide/show all desktop icons (useful when presenting)
    hidedesktop = "defaults write com.apple.finder CreateDesktop -bool false && killall Finder";
    showdesktop = "defaults write com.apple.finder CreateDesktop -bool true && killall Finder";

    diff = "diff --color=auto";
    grep = "grep --color=auto";
    szsh = "source ~/.zshrc";

    tf = "terraform";
    pl = "pulumi";
    plp = "pulumi preview";



    # AWS
    aid = "aws sts get-caller-identity --query Account --output text";
    asl = "aws sso login";

    # kubectl
    k = "kubectl";
    kx = "kubectx";
    ka = "kubectl apply -f";
    kg = "kubectl get";
    kd = "kubectl describe";
    kdel = "kubectl delete";
    kl = "kubectl logs";
    kgp = "kubectl get pod";
    kgpa = "kubectl get pods --all-namespaces";
    kgd = "kubectl get deployments";
    ke = "kubectl exec -it";

    # Direnv helpers
    da = "direnv allow";
    dr = "direnv reload";
    dk = "direnv revoke";

    yt = "yt-dlp";

    # Nix stuff. Inspired by: https://alexfedoseev.com/blog/post/nix-time.

    # Reload the Home Manager configuration (after git push)
    xn = "nix run nix-darwin --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake .";
    xx = "darwin-rebuild switch --flake .";

    # Run Nix garbage collection
    ngc = "nix store gc -v";

    # Nix flake helpers
    ndev = "nix develop";
    ndc = "nix develop --command";
    nfc = "nix flake check";
    nfca = "nix flake check --all-systems";
    nfs = "nix flake show";
    nfu = "nix flake update";
    nsn = "nix search nixpkgs";
    nixg = "sudo nix-collect-garbage -d";
    updateNix = "sudo nixos-rebuild switch --flake .#hostname";
    updateHome = "sudo -i nix-channel --update && home-manager switch --flake .#user@hostname";

    #nhs = "home-manager switch --flake '.#${username}@${hostName}'";
    #nxh = "nixos-rebuild switch --flake '.#${hostName}'";
    #nds = "darwin-rebuild switch --flake '.#${hostName}'";

    # Restart Nix daemon
    rnd = "sudo launchctl unload /Library/LaunchDaemons/org.nixos.nix-daemon.plist && sudo launchctl load /Library/LaunchDaemons/org.nixos.nix-daemon.plist";

    # processes
    pf = "pgrep -f";
  };
}
