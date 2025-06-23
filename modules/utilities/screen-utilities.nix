{ config, pkgs, lib, ... }:

{
  options = {
    utilities.screen-utilities.enable = lib.mkEnableOption "Enable screen utilities include screenshot, crop images";
  };

  config = lib.mkIf config.utilities.screen-utilities.enable {
    home.packages = with pkgs; [
      # screenshot, crop image
      grim
      slurp
      swappy

      # image viewer
      geeqie
    ];
  };
}

