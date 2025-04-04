{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neofetch
    wineWowPackages.stable
    winetricks
    lutris
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
    rhythmbox
    libgpod
    ollama
    heimdall
    baobab
    taisei
    appimage-run
    krita
    v2raya


    nerdfonts
    ipafont
  ];

  fonts.fontconfig.enable = true;

}
