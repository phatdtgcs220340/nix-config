# My config for neovim package and its related dependencies
{
  config,
  pkgs,
  lib,
  ...
}: {
  options = {
    working.workflow.neovim.enable = lib.mkEnableOption "Enable Neovim with language servers";
  };

  config = lib.mkIf config.working.workflow.neovim.enable {
    programs.neovim = {
      enable = true;
      extraPackages = with pkgs; [
        # Language servers
        nil
        lua-language-server
        pyright # Python
        yaml-language-server
        bash-language-server
        jdt-language-server
        nodejs
        typescript
        typescript-language-server
        tailwindcss-language-server

        # Formatters (optional)
        black # Python formatter
        shfmt # Bash formatter
        yamllint # YAML linter
        alejandra # nix formatter
        prettier
        eslint
      ];
    };

    home.packages = with pkgs; [
      jdt-language-server
      (pkgs.vimPlugins.packer-nvim)
    ];
  };
}
