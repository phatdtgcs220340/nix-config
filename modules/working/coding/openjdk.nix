{
  pkgs,
  lib,
  config,
  ...
}: let
  jdk8 = pkgs.openjdk8;
  jdk17 = pkgs.openjdk17;
  jdk21 = pkgs.openjdk21;

  jdkWrapper = name: jdk:
    pkgs.writeShellScriptBin name ''
      export JAVA_HOME=${jdk}
      export PATH=${jdk}/bin:$PATH
      exec "$@"
    '';
in {
  options = {
    working.coding.multiJDK.enable = lib.mkEnableOption "Install multiple JDK versions with isolated wrappers";
  };

  config = lib.mkIf config.working.coding.multiJDK.enable {
    home.packages = [
      (jdkWrapper "jdk8" jdk8)
      (jdkWrapper "jdk17" jdk17)
      (jdkWrapper "jdk21" jdk21)
    ];
  };
}
