{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
    settings = {
    monitor = [
      "eDP-1, 2880x1800@90.01Hz, 0x0, 2"
      ", highres, auto, 1"
    ];
      "$mod" = "SUPER";
      "$terminal" = "ghostty";
      "$menu" = "wofi --show drun";
      bind = [
	"$mod, Q, exec, $terminal"
	  "$mod, C, killactive,"
	  "$mod, M, fullscreen, 1"
	  "$mod, L, exit,"
	  "$mod, R, exec, $menu"
	  "$mod, S, exec, hyprshot -m output --clipboard-only"

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
	"firefox"
	"ghostty"
      ];

      general = {
	allow_tearing = true;
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
	blur = {
	  size = 16;
	  passes = 2;
	  new_optimizations = "on";
	  ignore_opacity = true;
	  xray = true;
	};
      };

      blurls = "waybar";

      input = {
	kb_layout = "us, ru, jp";
	kb_options = "grp:alt_shift_toggle,caps:swapescape";
      };

      windowrulev2 = [
	"move cursor, class:REAPER,floating:1"
#"nofocus,class:REAPER,title:^(menu)$"
	  "nofocus,class:REAPER,title:^$"
      ];
    };
  };

  #services.hyprpaper = {
  #  enable = true;
  #  settings = {
  #    #preload = "~/.cache/current-wallpaper.jpg";
  #    #wallpaper = ", ~/.cache/current-wallpaper.jpg";
  #  };
  #};


  stylix.targets.hyprpaper.enable = true;

}
