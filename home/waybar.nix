{ ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = builtins.readFile ./style.css;
    settings = [{
      layer = "top";
      modules-right = [
	"group/expand"
	"bluetooth"
	"network"
	"battery"
      ];
      modules-center = [
	"hyprland/workspaces"
      ];

      modules-left = [
	"clock"
	"tray"
	"custom/notification"
      ];
      clock = {
	format-alt = "{:%a, %d. %D  %H:%M}";
      };

      battery = {
	interval = 30;
	states = {
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

      network = {
	format-wifi = "";
	format-ethernet = "";
	format-disconnected = "";
	tooltip-format-wifi = "{essid ({signalStrenght}%)}";
	tooltip-format-ethernet = "{ifname} ";
	tooltip-format-disconnected = "Damn, no internet...";
	on-click = "ghostty -e nmtui";
      };

      bluetooth = {
	format-on = "󰂯";
	format-off = "";
	format-disabled = "󰂲";
	format-connected-battery = "{device_battery_percentage}% 󰂯";
	format-alt = "{device_alias} 󰂯";
	tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
	tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
	tooltip-format-enumerate-connected = "{device_alias}\n{device_address}";
	tooltip-format-enumerate-connected-battery = "{device_alias}\n{device_address}\n{device_battery_percentage}%";
	on-click = "ghostty -e bluetoothctl";
      };

      "custom/expand" = {
	format = "";
	tooltip = false;
      };

      "custom/endpoint" = {
	format = "|";
	tooltip = false;
      };

      "group/expand" = {
	orientation = "horizontal";
	drawer = {
	  transition-duration = 600;
	  transition-to-left = true;
	  click-to-reveal = true;
	};
	modules = [
	  "custom/expand"
	  "cpu"
	  "memory"
	  "temperature"
	  "custom/endpoint"
	];
      };

      "custom/notification" = {
	tooltip = false;
	format = "";
	on-click = "swaync-client -t -sw";
	escape = true;
      };

      cpu = {
	format = "󰻠";
	tooltip = true;
      };

      memory = {
	format = "";
      };

      temperature = {
	critical-threshold = 80;
	format = "";
      };

      tray = {
	icon-size = 14;
	spacing = 10;
      };
    }];
  };
}
