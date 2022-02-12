{ config, pkgs, unstablePkgs, username, ... }:
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = username;
  home.homeDirectory = "/home/${username}";
  manual.manpages.enable = false;

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    "discord-ptb"
    "google-chrome"
    "postman"
    "slack"
    "spotify-unwrapped"
    "spotify"
    "teams"
    "teamviewer"
    "unrar"
    "zoom"
  ];

  home.packages = with pkgs; [
    # Nix-related:
    cachix
    nix-index
    nix-prefetch-git
    nix-tree
    # appimage-run
    patchelf
    # home-manager

    # shell / dev utils:
    asciinema
    # w3m
    yq

    # Build systems:
    # cmake gnumake ninja meson

    # Debuggers:
    # gdb lldb_13

    # C/C++ toolchain:
    # GCC9 should have the highest priority
    # (lib.setPrio 30 binutils) (lib.setPrio 20 clang_11) (lib.setPrio 10 gcc10) lld_11

    # Haskell
    # ghc

    # Python
    # python3

    # crypto & network
    # nethogs # monitoring

    bat
    gitAndTools.diff-so-fancy

    # D toolchain
    #unstablePkgs.dmd unstablePkgs.dub unstablePkgs.ldc

    # DevOps
    # azure-cli
    # docker-compose
    # kubernetes-helm
    # kubectl
    # terraform
    # lens

    # gui sys
    gparted
    wireshark-qt
    glxinfo

    # gui general
    google-chrome firefox # opera # browsers
    # libreoffice
    onlyoffice-bin
    teamviewer
    discord-ptb slack tdesktop teams zoom-us # IM / Video
    unstablePkgs.vscode # GUI text editors / IDEs
    postman # API client
    # remmina # remote desktop
    deluge transmission-gtk # P2P/Torrent
    tilix # alacritty # Terminal emulators
    spotify vlc mpv # Audio & video players
    # reaper audacity # Audio editing
    blender # 3D modeling
    gimp inkscape # Image editing
    pick-colour-picker
    gcolor3
    xclip xorg.xhost # X11 related
    xournal # Edit PDFs
    # qrencode

    # sys
    # gptfdisk parted # disk partitioning
    ext4magic testdisk # disk recovery
    # iotop # monitoring
    p7zip unrar # archival and compression (unzip is installed via sys/*.nix)
    # usbutils pciutils

    # blockchain
    # go-ethereum

    # themes
    gnome3.gnome-tweaks
    paper-gtk-theme
    #paper-icon-theme
    #adementary-theme
    #adapta-gtk-theme
    #pantheon.elementary-gtk-theme
    #numix-gtk-theme
    #numix-sx-gtk-theme
    #onestepback
    #plano-theme
    #plata-theme
    qogir-theme
    #shades-of-gray-theme
    #sierra-gtk-theme
    #solarc-gtk-theme
    #sweet
    #theme-obsidian2
    #theme-vertex
    yaru-theme
    #zuki-themes
  ];

  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    delta.enable = true;
    includes = [
      { path = ../../.gitconfig; }
      { path = ../../.config/git/aliases.gitconfig; }
      { path = ../../.config/git/delta.gitconfig; }
      { path = ../../.config/git/delta-themes.gitconfig; }
    ];
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";
}
