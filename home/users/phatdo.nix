{ config, pkgs, ... }:

{
  imports = [ 
    ../../modules/openjdk.nix 
    ../../modules/neovim.nix
    ../../modules/python.nix
  ];

  programs.multiJDK.enable = true;
  phatdo.neovim.enable = true;
  home.username = "phatdo";
  home.homeDirectory = "/home/phatdo";
  phatdo.python = {
    enable = true;
    pythonVersion = "python311";
    packages = [
      "cryptography"
    ];
  }; 

  home.packages = with pkgs; [
    ghostty
    spotify
    sway
    gcc
    zig
    tmux
    lazydocker
    bat
    fzf
    htop
    discord
    python3Packages.pip
    nodejs_20
    wofi
    httpie
    neofetch
    ripgrep
    xclip
    # clipboard functions for terminal
    wl-clipboard
    gradle
    iredis
    postgresql
    # Image view
    geeqie
    # for sway login using
    greetd.tuigreet
    lazygit
    # fish theme
    starship
    android-studio

    # Screenshot + Crop image
    grim
    slurp
    swappy
  ];

  
  home.stateVersion = "24.05";
}

