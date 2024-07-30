{ pkgs }:

with pkgs; [
  any-nix-shell # fish support for nix shell
  bat
  comma # https://github.com/nix-community/comma - Runs software without installing it. 
  croc # https://github.com/schollz/croc - File transfer
  difftastic # https://github.com/Wilfred/difftastic
  #devenv
  fd
  fzf
  git
  gh
  gnupg
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
  #terraform

  # Kubernetes / Docker
  k9s
  #krew
  kubectl
  kubectx
  #kubernetes-helm
  kubetail
  #kubens
  lazydocker
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
