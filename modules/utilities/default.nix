{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./screen-utilities.nix
  ];
  options = {
    utilities.enable = lib.mkEnableOption "Enable default utilities";
  };

  config = lib.mkIf config.utilities.enable {
    home.packages = with pkgs; [
      pavucontrol # manages sound functionalities
      calcurse # calendar tool
      ttyper
      playerctl
      popsicle
    ];
  };
}
