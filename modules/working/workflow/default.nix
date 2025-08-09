# My workflow flake 
# May take a look at https://github.com/phatdtgcs220340/.dotfiles to see detailed config
{pkgs, ...}: {
  imports = [
    ./terminal.nix
    ./neovim.nix
    ./wm.nix
  ];

  home.packages = with pkgs; [
    stow # for manage dotfiles
    zathura # read pdf
  ];
}
