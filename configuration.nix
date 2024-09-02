# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true; 
  services.xserver.windowManager.dwm.enable = true;

  services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs {
    src = ./configs/dwm;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vol = {
    isNormalUser = true;
    description = "vol";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    packages = with pkgs; [];
  };

  # Enable sound
  sound.enable = false;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget 
     pkgs.dmenu
     pkgs.slstatus

     # ST - Terminal
     (st.override { conf = builtins.readFile ./configs/st/config.h; })
     pkgs.st
     (pkgs.st.overrideAttrs (oldAttrs: rec {
       buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
       patches = [
         (fetchpatch {
         url = "https://st.suckless.org/patches/scrollback/st-scrollback-0.8.5.diff";
         sha256 = "sha256-ZZAbrWyIaYRtw+nqvXKw8eXRWf0beGNJgoupRKsr2lc=";
         })
       ];
     }))

     pkgs.neofetch
     pkgs.neovim
     pkgs.firefox-devedition

     # Discord + Discord Configs
     pkgs.vesktop
     #pkgs.discord
     #(pkgs.discord.override {
     #     # remove any overrides that you don't want
     #     withOpenASAR = false;
     #     withVencord = true;
     #})
     pkgs.wget
     pkgs.git
     pkgs.gcc
     pkgs.gnumake
     pkgs.aseprite
     pkgs.nerdfonts
     pkgs.pwvucontrol
     pkgs.pavucontrol
     pkgs.davinci-resolve
     pkgs.openssh
     pkgs.sshfs
     pkgs.linuxKernel.packages.linux_5_4.wireguard
     pkgs.wireguard-tools
     pkgs.mullvad-vpn
     pkgs.qbittorrent
     pkgs.naps2
     pkgs.home-manager
     pkgs.vscode
     pkgs.gcc-arm-embedded
     pkgs.mgba
     pkgs.krita
     pkgs.libreoffice-qt6-still

     # Wine
     pkgs.wine
     pkgs.wine64
     pkgs.winetricks
     pkgs.wineWowPackages.full
     
     # Pokeemerald build
     pkgs.pkg-config
     pkgs.libpng
     pkgsCross.arm-embedded.stdenv.cc
  ];

  nixpkgs.config.packageOverrides = pkgs: {
        wine = (pkgs.winePackagesFor "wine64").minimal;
    };

  # Nvidia Driver
  # services.xserver.videoDrivers = ["nvidia"];
  # hardware.nvidia.modesetting.enable = true;
  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  
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
  system.stateVersion = "24.05"; # Did you read the comment?
}
