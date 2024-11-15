{ pkgs, ... }:
{
  stylix.enable = true;
  stylix.targets.gtk.enable = true;
  stylix.fonts = {
	monospace = {
		package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
		name = "JetBrainsMono Nerd Font Mono";
	};
  };
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
  stylix.image = /home/vol/.background-image;
  stylix.cursor.package = pkgs.capitaine-cursors;
  stylix.cursor.name = "capitaine-cursors";
  stylix.cursor.size = 28;
  stylix.fonts.sizes = {
    applications = 11;
	terminal = 11;
  };

  stylix.opacity.terminal = 0.9;
  stylix.opacity.applications = 1.0;
}
