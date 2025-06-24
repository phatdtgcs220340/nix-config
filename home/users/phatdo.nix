# My config for development and daily use
# May take a look at my full .dotfiles config at
# https://github.com/phatdtgcs220340/.dotfiles
{...}: {
  imports = [
    ../../modules/working/coding
    ../../modules/working/workflow
    ../../modules/working/devops
    ../../modules/utilities
    ../../modules/desktop
    ../../modules/school
  ];

  working = {
    coding = {
      multiJDK.enable = true;
      python = {
        enable = true;
        pythonVersion = "python311";
        packages = ["cryptography"];
      };
      tools.enable = true;
    };
    workflow = {
      neovim.enable = true;
      terminal.enable = true;
      wm.enable = true;
    };
    devops = {
      k8s.enable = true;
    };
  };

  utilities = {
    enable = true;
    screen-utilities.enable = true;
  };

  desktop.enable = true;
  school.enable = true;
  home.username = "phatdo";
  home.homeDirectory = "/home/phatdo";

  home.stateVersion = "24.05";
}
