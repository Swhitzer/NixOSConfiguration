{ inputs, pkgs, ... }:
{
  stylix = {
    enable = true;

    image = ~/Pictures/Wallpapers/Snow.jpg;

    fonts = {
      sansSerif = {
        package = inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd;
        name = "SFProDisplay Nerd Font";
      };
      serif = {
        name = "New York Nerd Font";
        package = inputs.apple-fonts.packages.${pkgs.system}.ny-nerd;
      };
    };

    autoEnable = true;
  };
}
