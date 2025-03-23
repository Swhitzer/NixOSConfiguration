{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neofetch
    wineWowPackages.stable
    winetricks
    steam
    steam-run
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
    telegram-desktop
    libreoffice-qt
    hunspell
    hunspellDicts.ru_RU
    chromium
    pywal16
    pywalfox-native
    imagemagick
    swaynotificationcenter
    localsend
    mpv
    python3
    quickemu
    prismlauncher
    hyprshot
    tor-browser
    cider
    ollama
    heimdall
    baobab


    nerdfonts
    ipafont
  ];

  fonts.fontconfig.enable = true;

}
