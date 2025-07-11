# Config for desktop apps: music player, discord or maybe microsoft team,...
{
  config,
  pkgs,
  lib,
  ...
}: {
  options = {
    desktop.enable = lib.mkEnableOption "Enable desktop apps";
  };
  config = lib.mkIf config.desktop.enable {
    home.packages = with pkgs; [
      spotify
      discord
      zathura
      steam
      lutris
    ];
  };
}
