# My config for development and daily use
# May take a look at my full .dotfiles config at
# https://github.com/phatdtgcs220340/.dotfiles
{...}: {
  imports = [
    ../../modules/working/coding
    ../../modules/working/workflow
  ];

  working = {
    coding = {
      multiJDK.enable = true;
      python = {
        enable = true;
        pythonVersion = "python311";
        packages = ["cryptography"];
      };
      essentials.enable = true;
    };
    workflow = {
      neovim.enable = true;
      terminal.enable = true;
    };
  };

  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

  home.stateVersion = "24.05";
}
