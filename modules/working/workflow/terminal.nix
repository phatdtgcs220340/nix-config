{ config, pkgs, lib, ... }:

{
  options = {
    working.workflow.terminal.enable = lib.mkEnableOption "Enable Terminal with daily tools";
  };

  config = lib.mkIf config.working.workflow.terminal.enable {
    home.packages = with pkgs; [
      ghostty
      gcc
      zig
      tmux
      lazydocker
      bat
      fzf
      htop
      neofetch
      ripgrep
      xclip
      wl-clipboard
      lazygit
      starship
      fish
      jq
    ];
  };
}

