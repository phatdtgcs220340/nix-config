{...}: {
  imports = [
    ../../modules/working/coding
    ../../modules/working/workflow
    ../../modules/working/devops
    ../../modules/utilities
    ../../modules/desktop
  ];

  working = {
    coding = {
      multiJDK.enable = true;
      python = {
        enable = true;
        pythonVersion = "python311";
        packages = ["cryptography" "pandas"];
      };
      essentials.enable = true;
    };
    workflow = {
      neovim.enable = true;
      terminal.enable = true;
      wm.enable = true;
    };
  };

  utilities = {
    enable = true;
    screen-utilities.enable = true;
  };

  desktop = {
    enable = true;
  };

  home.username = "phatdo";
  home.homeDirectory = "/home/phatdo";

  home.stateVersion = "24.05";
}

