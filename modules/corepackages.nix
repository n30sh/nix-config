{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    btop
    exfat
    exfatprogs
    fastfetch
    firefox
    fish
    git
    gparted
    kitty
    lolcat
    mpv
    ntfs3g
    p7zip
    starship
    steam-run-free
    unzip
    vlc
    wget
    wl-clipboard
    yazi

    neovim
    fd
    ripgrep
    luaPackages.tree-sitter-cli
  ];
}
