{ pkgs }:

with pkgs; [
  any-nix-shell # fish support for nix shell
  bat
  difftastic # https://github.com/Wilfred/difftastic
  #devenv
  fd
  fzf
  git
  gh
  gnupg
  jq
  kubectl
  kubectx
  #kubernetes-helm
  kubetail
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
  #wezterm
  yq-go # Terminal `jq` for YAML
  yt-dlp
  zsh

  # network
  bandwidth # Modern Unix `iftop`
  bmon # Modern Unix `iftop`at
  curl
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
  trippy # https://github.com/fujiapple852/trippy # https://trippy.cli.rs/

]
