{ config, pkgs, ... }:

let 
  my-custom-nerdfont = pkgs.callPackage ./package/font/default.nix {};
in
{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      device = "nodev";
      efiSupport = true;
      enable = true;
      version = 2;
    };
  };

  networking.hostName = "nix"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
    keyMap = "us";
  };

  services.xserver.layout = "us";

  sound.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  services.xserver.libinput.enable = true;

  users.users.xl = {
    isNormalUser = true;
    extraGroups = [ "wheel" "disk" "libvirtd" "docker" "audio" 
      "video" "input" "networkmanager" "network" "light"
    ]; 
  };

  environment.systemPackages = with pkgs; [
    # linux
    sway neovim htop stow zsh tmux light waybar dmenu-wayland
    pulsemixer fzf mpv ripgrep zsh zsh-syntax-highlighting
    pcmanfm xz lm_sensors exa joshuto ncdu
    alacritty
    # Document
    sxiv zathura
    # Language
    python310 rnix-lsp nodePackages.pyright
    # Internet
    wget curl firefox networkmanager git
    tdesktop
    python310Packages.pip
    python310Packages.numpy
    python310Packages.scipy
    libreoffice
    hyprland
    qtile
    unzip
    jdk8
  ];

  fonts = {
    fonts = with pkgs;[
      jetbrains-mono 
      liberation_ttf 
      font-awesome_5
      terminus_font
      my-custom-nerdfont
      #nerdfonts
      #terminus-nerdfont
    ];
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
  programs.light.enable = true;

  programs.zsh.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;
  users.defaultUserShell = pkgs.zsh;

  system.stateVersion = "22.11";
}
