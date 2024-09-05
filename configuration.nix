{ inputs, config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
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

  # Display Manager and Desktop Manager  
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.budgie.enable = true;  

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vol = {
    isNormalUser = true;
    description = "vol";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    packages = with pkgs; [];
  };

  # Enable sound
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System Packages
  environment.systemPackages = with pkgs; [
     pkgs.neofetch
     pkgs.neovim
     pkgs.firefox-devedition
     pkgs.vesktop
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

  home-manager = {
  	extraSpecialArgs = { inherit inputs; };
	users = {
		vol = import ./home.nix;
	};
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
