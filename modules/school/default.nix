{ config, pkgs, lib, ... }:

{
  options = {
    school.enable = lib.mkEnableOption "Enable tools for school modules";
  };

  config = lib.mkIf config.working.devops.k8s.enable {
    home.packages = with pkgs; [
        android-studio
    ];
  };
}

