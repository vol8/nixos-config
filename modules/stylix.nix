{ pkgs, ... }:
{
  stylix.enable = true;
  stylix.targets = {
      gtk.enable = true;
      neovim.enable = false;
  };
  stylix.fonts = {
	monospace = {
		package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
		name = "JetBrainsMono Nerd Font Mono";
	};
  };
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tomorrow-night.yaml";
  stylix.image = /home/vol/nixos-config/wallpapers/tomorrow-japan.jpg;
  stylix.cursor.package = pkgs.capitaine-cursors;
  stylix.cursor.name = "capitaine-cursors";
  stylix.cursor.size = 24;
  stylix.fonts.sizes = {
    applications = 10;
	terminal = 10;
  };


  stylix.opacity.terminal = 1.0;
  stylix.opacity.applications = 1.0;
}
