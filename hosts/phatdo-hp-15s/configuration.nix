# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Select internationalisation properties.
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

  environment.variables = {
    GTK_IM_MODULE = "ibus";
    QT_IM_MODULE = "ibus";
    XMODIFIERS = "@im=ibus";
    INPUT_METHOD = "ibus";
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  environment.etc."regreet/background.jpg".source =
    /home/phatdo/.dotfiles/images/wallpapers/pochita.png;

  programs.regreet = {
    enable = true;
    settings = {
      background = {
        path = "/etc/regreet/background.jpg";
        fit = "Fill";
      };
      env = {
        ENV_VARIABLE = "value";
      };
      GTK = {
        application_prefer_dark_theme = true;
        cursor_theme_name = "Adwaita";
        cursor_blink = true;
        font_name = "Cantarell 16";
        icon_theme_name = "Adwaita";
        theme_name = "Adwaita";
      };
      commands = {
        reboot = ["systemctl" "reboot"];
        poweroff = ["systemctl" "poweroff"];
        x11_prefix = ["startx" "/usr/bin/env"];
      };
      appearance = {
        greeting_msg = "Xin tao chua ma vo may cua tao";
      };
      widget = {
        clock = {
          format = "%a %H:%M";
          resolution = "500ms";
          timezone = "Asia/Ho_Chi_Minh";
          label_width = 150;
        };
      };
    };
    extraCss = ''
        .card {
            background-color: #222;
      }
    '';
  };

  services.xserver.enable = false;
  services.gnome.core-shell.enable = false;
  services.gnome.core-apps.enable = false;
  services.desktopManager.plasma6.enable = false;
  services.xserver.displayManager.startx.enable = false;
  services.xserver.desktopManager.plasma5.enable = false;
  services.desktopManager.gnome.enable = false;
  services.displayManager.gdm.enable = false;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
    # use the example session manager (no others are packaged yet so this is enabled by default,
    #wireplumber no need to redefine it in your config for now)
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.phatdo = {
    isNormalUser = true;
    description = "Phat Do";
    extraGroups = ["networkmanager" "wheel" "docker"];
  };

  services.dbus.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-wlr];
    config.common.default = "*";
  };

  # Install firefox.
  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

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
    # add anything else you use
  ];

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Ice"; # or "Adwaita", "capitaine-cursors", etc.
    XCURSOR_SIZE = "24";
  };

  fonts.packages = [
    pkgs.nerd-fonts._0xproto
    pkgs.nerd-fonts.droid-sans-mono
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
  nixpkgs.config.allowUnfree = true;
  virtualisation.docker.enable = true;
}
