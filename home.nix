{ config, pkgs, lib, ... }:

{
	imports = [
		#nixvim.homeModule.nixvim
	];
	home.username = "swhit";
	home.homeDirectory = "/home/swhit";

	home.stateVersion = "24.11";

	nixpkgs.config.allowUnfree = true;
	
	home.packages = with pkgs; [
		neofetch
		wineWowPackages.stable
		winetricks
		yabridge
		yabridgectl
		brightnessctl
		wl-clipboard
		wofi
		p7zip
		pavucontrol
		qpwgraph
		reaper
		telegram-desktop
		vlc
		qbittorrent
		nerdfonts
		telegram-desktop
		p7zip
		libreoffice-qt
		hunspell
		hunspellDicts.ru_RU
		chromium
		zapret
		pywal16
		imagemagick


    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  	];

	wayland.windowManager.hyprland = {
		enable = true;
		xwayland = {
			enable = true;
		};
		settings = {
			"$mod" = "SUPER";
			"$terminal" = "ghostty";
			"$menu" = "wofi --show drun";
			bind = [
				"$mod, Q, exec, $terminal"
				"$mod, C, killactive,"
				"$mod, M, exit,"
				"$mod, R, exec, $menu"

				"$mod, 1, workspace, 1"
				"$mod, 2, workspace, 2"
				"$mod, 3, workspace, 3"
				"$mod, 4, workspace, 4"
				"$mod, 5, workspace, 5"
				"$mod, 6, workspace, 6"
				"$mod, 7, workspace, 7"
				"$mod, 8, workspace, 8"
				"$mod, 9, workspace, 9"
			];

			bindel = [
				",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
				",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
				",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
				",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

				",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
				",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
			];

			bindm = [
				"$mod, mouse:272, movewindow"
				"$mod, mouse:273, resizewindow"
			];

			exec-once = [
			];

			general = {
				gaps_in = 0;
				gaps_out = 0;
				border_size = 1;
			};

			misc = {
				disable_splash_rendering = true;
				disable_hyprland_logo = true;
			};

			decoration = {
				rounding = 5;
			};

			input = {
				kb_layout = "us, ru";
				kb_options = grp:alt_shift_toggle,caps:swapescape;
			};

			windowrulev2 = [
				"move cursor, class:REAPER,floating:1"
				#"nofocus,class:REAPER,title:^(menu)$"
				"nofocus,class:REAPER,title:^$"
			];
		};
	};

	programs.waybar = {
		enable = true;
		systemd.enable = true;
#		style = builtins.readFile ../waybar/style.css;
		settings = [{
			layer = "top";
			modules-right = [
				"battery"
				"clock"
			];
			clock = {
				format-alt = "{:%a, %d. %D  %H:%M}";
			};
			battery = {
				"interval" = 30;
				"states" = {
					good = 95;
					warning = 30;
					critical = 20;
				};
				format = "{capacity}% {icon}";
				format-charging = "{capacity}% 󰂄";
				format-plugged = "{capacity}% 󰂄 ";
            			format-alt = "{time} {icon}";
				format-icons = [
				    	"󰁻"
					"󰁼"
            				"󰁾"
            				"󰂀"
            				"󰂂"
            				"󰁹"
				];
			};
		}];
	};

	services.hyprpaper = {
		enable = true;
		settings = {
			preload = "~/Pictures/Wallpapers";
			wallpaper = ", ~/Pictures/Wallpapers/BWMarisa.png";
		};
	};

	programs.git = {
		enable = true;
		userName = "Swhitzer";
		userEmail = "Swhitzer@yandex.ru";
	};

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  	home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  	};

  # Home Manager can also manage your environment variables through 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/swhit/etc/profile.d/hm-session-vars.sh
  #
  	home.sessionVariables = {

  	};
	
	programs.ghostty = {
		enable = true;

		enableZshIntegration = true;
		settings = {
			# FUCKING SETTINGS HERE OF THE FUCKING GHOSTTY
			# I DONT KNOW HOW TO SEX FUCKING ZSH RN FUCK ME
			# READ HERE MOTHER FUCKER https://github.com/clo4/ghostty-hm-module
			theme = "/home/swhit/.cache/wal/colors-ghostty.conf";
		};
	};

	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;
		shellAliases = {
			systemUpdate = "sudo nixos-rebuild switch --flake ~/nix/";
			systemUpgrade = "sudo nixos-rebuild switch --upgrade --flake ~/nix/";
			homeUpdate = "home-manager switch --flake ~/nix/";
			homeUpgrade = "home-manager switch --upgrade --flake ~/nix/";
			zapret = "sudo /opt/zapret/init.d/sysv/zapret start";
		};
	};

	#plugins.nixvim.enable = true;
	
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		plugins = with pkgs.vimPlugins; [
			nerdtree
			telescope-sg
		];
	};

	programs.firefox.enable = true;







	
  	programs.home-manager.enable = true;
}
