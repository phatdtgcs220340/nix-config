{ config, pkgs, lib, ... } : 
{
  options = {
    desktop.enable = lib.mkEnableOption "Enable desktop apps";
  };

  config = lib.mkIf config.desktop.enable {
    programs.neovim = {
      enable = true;
    };

    home.packages = with pkgs; [
        spotify
        discord
    ];
  };

}
