{
  config,
  pkgs,
  lib,
  ...
}: {
  options = {
    desktop.game.enable = lib.mkEnableOption "Enable game";
  };
  config = lib.mkIf config.desktop.game.enable {
    home.packages = with pkgs; [
      steam
      lutris
    ];
  };
}
