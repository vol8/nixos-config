{ pkgs, ... }:
{
  stylix.enable = true;
  stylix.targets.gtk.enable = true;
  stylix.targets.nixvim.enable = true;
  stylix.targets.nixvim.transparentBackground.main = true;
  stylix.fonts = {
	monospace = {
		package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
		name = "JetBrainsMono Nerd Font Mono";
	};
  };
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";
  stylix.image = /home/vol/.background-image;
  stylix.cursor.package = pkgs.capitaine-cursors;
  stylix.cursor.name = "capitaine-cursors";
  stylix.cursor.size = 28;
  stylix.fonts.sizes = {
  	applications = 10;
	  terminal = 12;
  };

  stylix.opacity.terminal = 1.0;
  stylix.opacity.applications = 1.0;
}
