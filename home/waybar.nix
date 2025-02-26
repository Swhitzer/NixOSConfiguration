{ ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
# style = builtins.readFile ~/.config/waybar/style.css;
    settings = [{
      layer = "top";
      modules-right = [
	"bluetooth"
	  "network"
	  "battery"
      ];
      modules-center = [
	"hyprland/workspaces"
      ];

      modules-left = [
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
}
