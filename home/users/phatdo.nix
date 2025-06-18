{ config, pkgs, ... }:

{
  imports = [ ../../modules/openjdk.nix ];
  programs.multiJDK.enable = true;
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
    openjdk17
    openjdk21
    openjdk8
    wofi
    httpie
    neofetch
    ripgrep
    xclip
    lua-language-server
    jdt-language-server
    wl-clipboard
    gradle
    iredis
    postgresql
    geeqie
    greetd.tuigreet
    lazygit
  ];

  programs.neovim.enable = true;

  home.stateVersion = "24.05";
}

