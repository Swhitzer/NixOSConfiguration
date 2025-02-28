{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neofetch
    wineWowPackages.stable
    winetricks
    steam
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
    imagemagick
    nerdfonts
    swaynotificationcenter
    localsend
    mpv
  ];
}
