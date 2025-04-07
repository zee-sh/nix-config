{ pkgs }:

with pkgs; [
  any-nix-shell # fish support for nix shell
  bat
  comma # https://github.com/nix-community/comma - Runs software without installing it. 
  croc # https://github.com/schollz/croc - File transfer
  delta # https://github.com/dandavison/delta
  devbox
  difftastic # https://github.com/Wilfred/difftastic
  #dogoo # https://github.com/mr-karan/doggo
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
  superfile
  terminal-notifier # https://github.com/julienXX/terminal-notifier
  tldr
  tmux
  wget
  yq-go # Terminal `jq` for YAML
  yt-dlp
  zsh

  #software-development
  go
  golangci-lint
  

  # Cloud
  awscli2
  aws-nuke
  eksctl
  hcloud
  steampipe

  # IAC
  opentofu
  pulumi
  crd2pulumi
  packer
  terraform

  #DevSecOps
  checkov
  trivy

  # Kubernetes / Docker
  cilium-cli
  #crane
  #dive
  hubble # https://github.com/cilium/hubble/
  k3d
  k9s
  kind
  krew
  kubecolor
  kubectl
  kubectx
  kubefetch # https://github.com/jkulzer/kubefetch
  kubernetes-helm
  kubetail
  lazydocker
  popeye
  stern
  talosctl
  tilt

  # network
  aria # cli downloader
  bandwidth # Modern Unix `iftop`
  bmon # Modern Unix `iftop`at
  curl
  curlie
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
