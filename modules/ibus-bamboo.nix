{
  lib,
  config,
  bamboo,
  ...
}: {
  options.phatdo.ibus-bamboo.enable = lib.mkEnableOption "Enable ibus-bamboo input method";

  config = lib.mkIf config.phatdo.ibus-bamboo.enable {
    i18n.inputMethod = {
      enabled = "ibus";
      ibus.engines = [bamboo];
    };
  };
}
