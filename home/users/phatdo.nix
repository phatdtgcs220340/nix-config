{ config, pkgs, ... }:

{
  imports = [ 
    ../../modules/openjdk.nix 
    ../../modules/neovim.nix
  ];

  programs.multiJDK.enable = true;
  phatdo.neovim.enable = true;
  home.username = "phatdo";
  home.homeDirectory = "/home/phatdo";

  home.packages = with pkgs; [
    zsh
    ghostty
    spotify
    sway
    python310
    gcc
    zig
    tmux
    lazydocker
    bat
    fzf
    htop
    python3Packages.pip
    nodejs_20
    wofi
    httpie
    neofetch
    ripgrep
    xclip
    wl-clipboard
    gradle
    iredis
    postgresql
    geeqie
    greetd.tuigreet
    lazygit
  ];

  home.stateVersion = "24.05";
}

