{
  lib,
  pkgs,
  config,
  ...
}: {
  imports = [
    ./openjdk.nix
    ./python.nix
  ];
  options = {
    working.coding.essentials.enable = lib.mkEnableOption "Enable essentials tools for coding";
  };

  config = lib.mkIf config.working.coding.essentials.enable {
    home.packages = with pkgs; [
      httpie
      gradle
      iredis
      postgresql
      pgadmin4-desktopmode
      nodejs_20
      go
      postman
      mysql84
      yarn
    ];
  };
}
