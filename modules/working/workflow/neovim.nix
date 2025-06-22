{ config, pkgs, lib, ... }:

{
  options = {
    working.workflow.neovim.enable = lib.mkEnableOption "Enable Neovim with language servers";
  };

  config = lib.mkIf config.working.workflow.neovim.enable {
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

