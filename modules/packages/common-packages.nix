{ pkgs }:

with pkgs; [
  any-nix-shell # fish support for nix shell
  bat
  comma # https://github.com/nix-community/comma - Runs software without installing it. 
  croc # https://github.com/schollz/croc - File transfer
  devbox
  difftastic # https://github.com/Wilfred/difftastic
  #devenv
  fd
  fzf
  git
  gh
  gnupg
  go-task
  jq
  lazygit
  magic-wormhole # https://github.com/magic-wormhole/magic-wormhole
  neofetch
  nix-direnv
  pre-commit
  procs # https://github.com/dalance/procs
  ripgrep
  terminal-notifier # https://github.com/julienXX/terminal-notifier
  tldr
  tmux
  wget
  yq-go # Terminal `jq` for YAML
  yt-dlp
  zsh

  # Cloud
  awscli2
  #aws-nuke
  eksctl
  steampipe

  # IAC
  opentofu
  pulumi
  crd2pulumi
  #terraform

  #DevSecOps
  checkov

  # Kubernetes / Docker
  cilium-cli
  hubble # https://github.com/cilium/hubble/
  k3d
  k9s
  kind
  krew
  kubectl
  kubectx
  kubefetch # https://github.com/jkulzer/kubefetch
  #kubernetes-helm
  kubetail
  lazydocker
  popeye
  stern

  # network
  aria # cli downloader
  bandwidth # Modern Unix `iftop`
  bmon # Modern Unix `iftop`at
  curl
  dog # https://github.com/ogham/dog
  gping
  httpie
  ipcalc
  iperf3
  mtr # Modern Unix `traceroute`
  nexttrace # https://github.com/nxtrace/NTrace-core
  nmap
  tcpflow # https://github.com/simsong/tcpflow
  tcping-go # https://github.com/cloverstd/tcping
  tcptraceroute
  speedtest-cli
  trippy # mtr alternative # https://github.com/fujiapple852/trippy # https://trippy.cli.rs/
  xh # https://github.com/ducaale/xh

]
