{
  config,
  lib,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.neos.desktop.enable {
    programs = {
      hyprland.enable = true;
      hyprland.xwayland.enable = true;
    };

    xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-gtk
      ];
      config = {
        hyprland = {
          default = [ "gtk" ];
          "org.freedesktop.impl.portal.Screenshot" = [ "hyprland" ];
          "org.freedesktop.impl.portal.ScreenCast" = [ "hyprland" ];
        };
        gnome = {
          default = [ "gnome" ];
        };
      };
    };

    systemd.user.targets.hyprland-session = {
      description = "Hyprland compositor session";
      bindsTo = [ "graphical-session.target" ];
      wants = [ "graphical-session-pre.target" ];
      after = [ "graphical-session-pre.target" ];
    };

    environment.systemPackages = with pkgs; [
      awww
      blueman
      brightnessctl
      cliphist
      fuzzel
      hyprlauncher
      hyprlock
      hyprpaper
      hyprpicker
      libnotify
      networkmanagerapplet
      pavucontrol
      swaynotificationcenter
      waybar
      wlogout
      wl-clipboard
      wofi
    ];

    security.polkit.enable = true;

    # Hint Electron apps to use Wayland (Optional)
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
