{ inputs, config, pkgs, lib, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ./modules/stylix.nix
        inputs.home-manager.nixosModules.home-manager
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelPackages = pkgs.linuxPackages_latest;

    networking.hostName = "nixos"; # Define your hostname.
    networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];

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
    services.xserver.desktopManager.gnome.enable = true;
    services.xserver.windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
            dmenu #application launcher most people use
            i3status # gives you the default i3 status bar
            i3lock #default i3 screen locker
        ];
    };

    programs.xfconf.enable = true;

    programs.zsh.enable = true;
    users.users.vol = {
        isNormalUser = true;
        description = "vol";
        extraGroups = [ "networkmanager" "wheel" "audio"];
        packages = with pkgs; [];
    };
    users.defaultUserShell = pkgs.zsh;

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
        pkgs.wofi
        pkgs.networkmanagerapplet
        pkgs.mako
        pkgs.swww
        pkgs.catppuccin-papirus-folders

        # GUI
        pkgs.xfce.thunar
        pkgs.gvfs
        pkgs.firefox-devedition
        pkgs.vesktop
        pkgs.aseprite
        pkgs.pavucontrol
        pkgs.naps2
        pkgs.mgba
        pkgs.desmume
        pkgs.ghidra
        pkgs.obsidian
        pkgs.obs-studio
        pkgs.vlc
        pkgs.pinta
        pkgs.kdePackages.kdenlive
        pkgs.kdePackages.ark
        pkgs.thunderbird
        pkgs.blender
        pkgs.libreoffice-qt6-still
        pkgs.vscode
        pkgs.virtualbox
        pkgs.gimp
        pkgs.github-desktop
        pkgs.cutter
        pkgs.qalculate-gtk

        # CLI
        pkgs.nitch
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
        pkgs.subversionClient
        pkgs.bashmount
        pkgs.btop
        pkgs.htop
        pkgs.tmux
        pkgs.typst

        # C - Dev
        pkgs.gcc
        pkgs.gnumake
        pkgs.qt5.full
        pkgs.qtcreator

        # Rust - Dev
        rust-analyzer
        rustc
        rustup
        cargo
        rustfmt

        # Python
        pkgs.python3

        # NVIM Language Servers
        pkgs.lua-language-server
        pkgs.rust-analyzer
        pkgs.clang-tools

        # NVIM Related things
        pkgs.wl-clipboard

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



    home-manager = {
        extraSpecialArgs = { inherit inputs; };
        users = {
            vol = import ./home.nix;
        };
    };
    home-manager.backupFileExtension = "backup";

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.05"; # Did you read the comment?
}
