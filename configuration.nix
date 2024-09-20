{ inputs, config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
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
  services.xserver.displayManager.gdm.enable = true;

  # i3
  services.xserver.windowManager.i3 = {
  	enable = true;
	extraPackages = with pkgs; [
		rofi
		i3lock
		alacritty
		i3blocks
	];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vol = {
    isNormalUser = true;
    description = "vol";
    extraGroups = [ "networkmanager" "wheel" "audio"];
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

# System Packages
environment.systemPackages = with pkgs; [
     pkgs.home-manager
     pkgs.nerdfonts
     pkgs.lxappearance

     # GUI
     pkgs.firefox-devedition
     pkgs.vesktop
     pkgs.aseprite
     pkgs.pavucontrol
     pkgs.naps2
     pkgs.mgba
     pkgs.ghidra
     pkgs.obsidian
     pkgs.obs-studio
     pkgs.vlc

     # C - Dev
     pkgs.gcc
     pkgs.gnumake

     # CLI
     pkgs.neofetch
     pkgs.neovim
     pkgs.git
     pkgs.yt-dlp
     pkgs.porsmo
     pkgs.openssh
     pkgs.sshfs
     pkgs.dos2unix
     pkgs.ffmpeg
     pkgs.busybox
     pkgs.musikcube
     pkgs.cava
     pkgs.cmatrix
     pkgs.pulsemixer

     # NVIM Language Servers
     pkgs.lua-language-server
     pkgs.rust-analyzer
     pkgs.clang-tools

     # Wine
     pkgs.wine
     pkgs.wine64
     pkgs.winetricks
     pkgs.wineWowPackages.full
     
     # Pokeemerald build
     pkgs.pkg-config
     pkgs.libpng
     pkgsCross.arm-embedded.stdenv.cc
     pkgs.gcc-arm-embedded
  ];

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;


  nixpkgs.config.packageOverrides = pkgs: {
    wine = (pkgs.winePackagesFor "wine64").minimal;
  };

  home-manager = {
  	extraSpecialArgs = { inherit inputs; };
	  users = {
		  vol = import ./home.nix;
	  };
  };
  home-manager.backupFileExtension = "backup";

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
