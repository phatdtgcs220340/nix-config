{ config, pkgs, lib, ... }:

{
  options = {
    phatdo.neovim.enable = lib.mkEnableOption "Enable Neovim with language servers";
  };

  config = lib.mkIf config.phatdo.neovim.enable {
    programs.neovim = {
      enable = true;
    };

    home.packages = with pkgs; [
      lua-language-server
      jdt-language-server
      nil              # nix language server
      nixpkgs-fmt      # nix formatter
      (pkgs.vimPlugins.packer-nvim)
    ];
  };
}

