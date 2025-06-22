{ config, pkgs, lib, ... }:

{
  options = {
    working.workflow.wm.enable = lib.mkEnableOption "Enable Customized Window Manager ";
  };

  config = lib.mkIf config.working.workflow.wm.enable {
    home.packages = with pkgs; [
        sway
        wofi
        greetd.tuigreet
    ];
  };
}

