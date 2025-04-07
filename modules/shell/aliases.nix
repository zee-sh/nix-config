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

    t = "task";
    tl = "task --list-all";

 
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
    ael = "aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws";

    # Cilium
    cil = "cilium";

    # kubectl 
    ## https://github.com/ahmetb/kubectl-aliases/blob/master/.kubectl_aliases
    ## https://github.com/LongerHV/nixos-configuration/blob/e3251efce564330977ff2555648982f126c26327/modules/home-manager/myHome/zsh/kubectl.zsh

    ## General aliases
    k = "kubectl";
    kx = "kubectx";
    kns = "kubens";
    ka = "kubectl apply -f";
    kg = "kubectl get";
    kd = "kubectl describe";
    kdel = "kubectl delete";
    kgy = "kubectl get -o=yaml";
    ke = "kubectl exec -it";

    ## Tools for accessing all information
    kga = "kubectl get all";
    kgaa = "kubectl get all --all-namespaces";

    ## Pod management
    kgp = "kubectl get pod";
    kgpa = "kubectl get pods --all-namespaces";
    kgpawd = "kubectl get pods --all-namespaces -o wide";
    kdp = "kubectl describe pods";
    kgpw = "kgp --watch";
    kgpwd = "kgp -o wide";
    kdelp = "kubectl delete pods";
    kgpl = "kgp -l"; # get pod by label: kgpl "app=myapp" -n myns

    # Deployment management.
    kgd = "kubectl get deployment";
    kgda = "kubectl get deployment --all-namespaces";
    kgdw = "kgd --watch";
    kgdwd = "kgd -o wide";
    ked = "kubectl edit deployment";
    kdd = "kubectl describe deployment";
    kdeld = "kubectl delete deployment";
    ksd = "kubectl scale deployment";
    krsd = "kubectl rollout status deployment";
    kgrs = "kubectl get rs";
 
    ## Service management
    kgs = "kubectl get service";
    kgsa = "kubectl get svc --all-namespaces";
    kgsw = "kgs --watch";
    kgswd = "kgs -o wide";
    kes = "kubectl edit svc";
    kds = "kubectl describe svc";
    kdels = "kubectl delete svc";

    ## Ingress management
    kgi = "kubectl get ingress";
    kgia = "kubectl get ingress --all-namespaces";
    kei = "kubectl edit ingress";
    kdi = "kubectl describe ingress";
    kdeli = "kubectl delete ingress";

    ## Namespace management
    kgns = "kubectl get namespaces";
    kens = "kubectl edit namespace";
    kdns = "kubectl describe namespace";
    kdelns = "kubectl delete namespace";
    kcn = "kubectl config set-context --current --namespace";

    ## ConfigMap management
    kgcm = "kubectl get configmaps";
    kgcma = "kubectl get configmaps --all-namespaces";
    kecm = "kubectl edit configmap";
    kdcm = "kubectl describe configmap";
    kdelcm = "kubectl delete configmap";

    ## Secret management
    kgsec = "kubectl get secret";
    kgseca = "kubectl get secret --all-namespaces";
    kdsec = "kubectl describe secret";
    kdelsec = "kubectl delete secret";

    ## Node Management
    kgn = "kubectl get nodes";
    kdn = "kubectl describe nodes";
    kdelno = "kubectl delete node";

    ## Logs
    kl = "kubectl logs";
    kl1h = "kubectl logs --since 1h";
    kl1m = "kubectl logs --since 1m";
    kl1s = "kubectl logs --since 1s";
    klf = "kubectl logs -f";
    klf1h = "kubectl logs --since 1h -f";
    klf1m = "kubectl logs --since 1m -f";
    klf1s = "kubectl logs --since 1s -f";

    ksys = "kubectl --namespace=kube-system";
    kdsys = "kubectl --namespace=kube-system describe";
    kgsys = "kubectl --namespace=kube-system get";

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
