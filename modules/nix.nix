{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    nix-ld
    nix-output-monitor
    nixd # Language server
    nvd # Diff tool
    nixfmt # Formatting nix files
  ];

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    nss
  ];
  programs.nh.enable = true;
}
