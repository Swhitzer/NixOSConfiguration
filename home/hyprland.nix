{ ... }:

{
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
	border_size = 0;
      };

      misc = {
	disable_splash_rendering = true;
	disable_hyprland_logo = true;
      };

      decoration = {
	rounding = 0;
      };

      input = {
	kb_layout = "us, ru";
	kb_options = "grp:alt_shift_toggle,caps:swapescape";
      };

      windowrulev2 = [
	"move cursor, class:REAPER,floating:1"
#"nofocus,class:REAPER,title:^(menu)$"
	  "nofocus,class:REAPER,title:^$"
      ];
    };
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = "~/.cache/current-wallpaper.jpg";
      wallpaper = ", ~/.cache/current-wallpaper.jpg";
    };
  };
}
