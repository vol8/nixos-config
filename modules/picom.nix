{
  services.picom = {
		enable = true;
		backend = "glx";
		fade = true;
		fadeDelta = 4;
		shadow = true;
		shadowOffsets = [
			(-15)
			(-15)
		];
		shadowOpacity = 0.8;

		settings = {
			blur = {
			  method = "dual_kawase";
			  size = 3;
			  deviation = 5.0;
			};

      corner-radius = 15;
      detect-client-opacity = true;
      rounded-corners-exclude = [
        "window_type = 'dock'"
        "window_type = 'desktop'"
        "class_g = 'i3bar'"
        "class_g = 'i3blocks'"
      ];

			opacity-rule = [
				"85:class_g = 'alacritty'"
				"85:class_g = 'vesktop'"
				"85:class_g = 'rofi'"
				"85:class_g = 'nvim'"
				"85:class_g = 'neovim'"
			];
		};
	};
}
