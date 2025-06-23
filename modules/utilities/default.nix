{ config, lib, pkgs, ... } :
{
  imports = [
    ./screen-utilities.nix
  ];
  options = {
    utilities.enable = lib.mkEnableOption "Enable default utilities";
  };

  config = lib.mkIf config.utilities.enable {
    home.packages = with pkgs; [
        pavucontrol # manages sound functionalities
        bluetuith # manages bluetooth
    ];
  };
}
