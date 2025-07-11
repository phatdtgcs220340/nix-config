{
  config,
  pkgs,
  lib,
  ...
}: {
  options = {
    working.coding.tools.enable = lib.mkEnableOption "Enable necessary tools for coding";
  };

  config = lib.mkIf config.working.coding.tools.enable {
    home.packages = with pkgs; [
      httpie
      gradle
      iredis
      postgresql
      pgadmin4-desktopmode
      nodejs_20
      go
      postman
    ];
  };
}
