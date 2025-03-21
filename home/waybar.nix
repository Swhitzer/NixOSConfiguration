{ config, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
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
	tooltip = false;
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

    style = with config.lib.stylix.colors.withHashtag;
    ''
    @define-color background ${base00}; @define-color base01 ${base01}; @define-color base02 ${base02}; @define-color base03 ${base03};
    @define-color base04 ${base04}; @define-color base05 ${base05}; @define-color base06 ${base06}; @define-color foreground ${base07};

    @define-color base08 ${base08}; @define-color color9 ${base09}; @define-color base0A ${base0A}; @define-color base0B ${base0B};
    @define-color base0C ${base0C}; @define-color base0D ${base0D}; @define-color base0E ${base0E}; @define-color base0F ${base0F};

    * {
      font-size: ${builtins.toString config.stylix.fonts.sizes.desktop}pt;
    }

    window#waybar{
      all:unset;
      background: alpha(@background, .4);
    }
    .modules-left {
      padding:1px;
      margin:0 0 0 0;
    }
    .modules-center {
      padding:1px;
      margin:0 0 0 0;
      border-bottom-right-radius: 5px;
      border-bottom-left-radius: 5px;
      background:#000000;
      color: #ffffff;
    }

    .modules-right {
      padding:1px;
      margin: 0 0 0 0;
    }
    tooltip {
      background: alpha(@background, .5);
      color: @foreground;
      text-shadow: none;
    }
    #clock:hover, #custom-notification:hover,#bluetooth:hover,#network:hover,#battery:hover, #cpu:hover,#memory:hover,#temperature:hover{
      transition: all .3s ease;
      color:@color9;
    }
    #custom-notification {
      padding: 0px 5px;
      transition: all .3s ease;
      color:@foreground;
    }
    #clock{
      padding: 0px 5px;
      color:@foreground;
      transition: all .3s ease;
      font-weight: 600;
    }
    #workspaces {
      padding: 0px 5px;
    }
    #workspaces button {
      all:unset;
      padding: 0px 5px;
      color: alpha(@color9,.4);
    }
    #workspaces button:hover {
      color:rgba(0,0,0,0);
      border: none;
    }
    #workspaces button.active {
      color: @color9;
      border: none;
    }
    #workspaces button.empty {
      color: rgba(0,0,0,0);
      border: none;
    }
    #workspaces button.empty:hover {
      color: rgba(0,0,0,0);
      border: none;
    }
    #workspaces button.empty.active {
      color: @color9;
      border: none;
    }
    #bluetooth{
      padding: 0px 5px;
      transition: all .3s ease;
      color:@foreground;
    }

    #network{
      padding: 0px 5px;
      transition: all .3s ease;
      color:@foreground;
    }
    #battery{
      padding: 0px 5px;
      transition: all .3s ease;
      color:@foreground;
    }
    #battery.charging {
      color: #26A65B;
    }
    
    #battery.warning:not(.charging) {
      color: #ffbe61;
    }
    
    #battery.critical:not(.charging) {
      color: #f53c3c;
      animation-name: blink;
      animation-duration: 0.5s;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
      animation-direction: alternate;
    }

    #group-expand{
      padding: 0px 5px;
      transition: all .3s ease; 
    }

    #custom-expand{
      padding: 0px 5px;
      color:alpha(@foreground,.3);
      transition: all .3s ease; 
    }

    #custom-expand:hover{
      color:rgba(255,255,255,.2);
    }

    #custom-colorpicker{
      padding: 0px 5px;
    }

    #cpu,#memory,#temperature{
      padding: 0px 5px;
      transition: all .3s ease; 
      color:@foreground;
    }

    #custom-endpoint{
      color:transparent;
    }

    #tray{
      padding: 0px 5px;
      transition: all .3s ease; 
    }

    #tray menu * {
      padding: 0px 5px;
      transition: all .3s ease; 
    }
    
    #tray menu separator {
      padding: 0px 5px;
      transition: all .3s ease; 
    }
  '';
};

stylix.targets.waybar = {
  enable = true;
};

stylix.targets.swaync.enable = true;
}
