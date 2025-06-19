{ config, pkgs, lib, ... }:

{
  options.phatdo.python = {
    enable = lib.mkEnableOption "Enable Python with pip packages";
    packages = lib.mkOption {
      type = with lib.types; listOf str;
      default = [ ];
      description = "List of pip packages to install with Python.";
    };
    pythonVersion = lib.mkOption {
      type = lib.types.str;
      default = "python311";
      description = "Python version to use (e.g., python311, python312)";
    };
  };

  config = lib.mkIf config.phatdo.python.enable {
    home.packages = [
      (
        let
          python = pkgs.${config.phatdo.python.pythonVersion};
        in
          python.withPackages (ps: with ps; builtins.map (pkg: ps.${pkg}) config.phatdo.python.packages)
      )
    ];
  };
}

