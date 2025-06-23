# Config for application use at school 
# Maybe no more use :D

{ config, pkgs, lib, ... }:

{
  options = {
    school.enable = lib.mkEnableOption "Enable tools for school modules";
  };

  config = lib.mkIf config.school.enable {
    home.packages = with pkgs; [
        android-studio
    ];
  };
}

