{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/ibus-bamboo.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname and networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Time zone and locale
  time.timeZone = "Asia/Ho_Chi_Minh";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "vi_VN";
    LC_IDENTIFICATION = "vi_VN";
    LC_MEASUREMENT = "vi_VN";
    LC_MONETARY = "vi_VN";
    LC_NAME = "vi_VN";
    LC_NUMERIC = "vi_VN";
    LC_PAPER = "vi_VN";
    LC_TELEPHONE = "vi_VN";
    LC_TIME = "vi_VN";
  };

  # Input method (Bamboo)
  phatdo.ibus-bamboo.enable = true;
  environment.variables = {
    GTK_IM_MODULE = "ibus";
    QT_IM_MODULE = "ibus";
    XMODIFIERS = "@im=ibus";
    INPUT_METHOD = "ibus";
  };

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  # Display manager and compositor
  services.xserver.enable = false;
  services.desktopManager.gnome.enable = false;
  services.desktopManager.plasma6.enable = false;
  services.displayManager.gdm.enable = false;
  services.xserver.displayManager.startx.enable = false;

  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd sway";
      user = "phatdo";
    };
  };

  # Graphics support
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Printing
  services.printing.enable = true;

  # Sound via PipeWire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Power management
  services.upower.enable = true;

  # Docker
  virtualisation.docker.enable = true;

  # D-Bus
  services.dbus.enable = true;

  # XDG portals for Wayland
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
    config.common.default = "*";
  };

  # User account
  users.users.phatdo = {
    isNormalUser = true;
    description = "Phat Do";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  # Shell
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  # Fonts and cursor
  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
    nerd-fonts.droid-sans-mono
    jetbrains-mono
  ];

  environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
  };

  # Packages
  environment.systemPackages = with pkgs; [
    git
    curl
    unzip
    bash
    bibata-cursors
    brightnessctl
    xdg-desktop-portal
    xdg-desktop-portal-wlr
    pipewire
    wireplumber
    ntfs3g
    cloudflare-warp
    firefox
  ];

  # Cloudflare WARP service
  systemd.services.warp-svc = {
    description = "Cloudflare WARP service";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.cloudflare-warp}/bin/warp-svc";
      Restart = "always";
    };
  };

  # Nix settings
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  # System version
  system.stateVersion = "25.05";
}

