{
  config,
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # Build systems
    cmake
    gnumake

    # Debugging
    gdb
    valgrind

    #c/c++
    gcc15
    gcc
    clang
    llvm

    #java(jdk)
    openjdk24
    #jdk24
    zulu24
    #python
    python3Full
    python-launcher
    python313Packages.pip
    pipx
    uv
    pipenv
    python313Packages.tkinter
    python313Packages.distutils

    # Rust
    rustc
    cargo

    # JavaScript
    nodejs
    yarn

    # Go
    go

    #sql
    sqlite
    postgresql
    dbeaver-bin #gui
    # beekeeper-studio
    #mariadb
    mariadb_118
    mycli
    mysql84
    mysql-workbench

    # CLI utilities
    #htop
    tree
    #unzip
    zip
    #wget
    #curl

    # Linting & formatting
    # shellcheck

    #editor
    #neovim
    gedit

    #daily use
    #lsd
    eza
    #btop
    bat
    #curl
    #wget
    #zoxide

    #shell
    #fish
    nushell
    nu_scripts
    # Official plugins
    nushellPlugins.query
    nushellPlugins.gstat
    nushellPlugins.formats
    nushellPlugins.hcl
    nushellPlugins.units
    nushellPlugins.semver
    nushellPlugins.polars
    nushellPlugins.highlight
    nufmt

    skim
    navi
    atuin
    bottom
    lazygit
    gh
    procs
    du-dust

    # Editor support
    vscode-extensions.thenuprojectcontributors.vscode-nushell-lang

    #fetch
    # fastfetch (home-manager)
    nerdfetch

    # Assembly
    nasm
    binutils

    # Bash & Scripting
    shellcheck
    shfmt

    #terminal
    # ghostty wezterm alacritty kitty (home-manager)
    wezterm

    ripgrep # Enhance the teaching experience grep and telescope
    #xclip # or clipcat

    #wl-clipboard

    #notes making apps
    obsidian
    appflowy

    #media
    mpv
    mpd
    telegram-desktop
    # discord (home-manager)

    # fuzzy finder
    #fzf
    fd
    fzf-zsh
    fzf-make

    #starship config
    starship

    oh-my-posh
    #yazi
    chafa
    #ranger
    lf
    ffmpeg
    vlc
    imagemagick
    p7zip
    #  hyprcursor (in hyprland.nix)
    #hyprland
    ueberzug
    pistol
    oh-my-zsh
    python313Packages.image-go-nord
    astroterm
    findutils
    rtkit
    xsel
    unrar
    # gemini-cli ( in home-manager)

    just
    catppuccin-whiskers
    rofi-emoji
    youtube-music
    yt-dlp
    ytmdl
    mov-cli
    niriswitcher
    ryzenadj

    #office
    libreoffice-fresh
    onlyoffice-desktopeditors
    fff
    ascii-image-converter
    neofetch
    cpufetch
    screenfetch
    xfce.mousepad
    # music
    spotify

    #language model
    ollama
    open-interpreter

    eww
    wireplumber # PipeWire volume control

    #tor
    tor
    tor-browser

    nasm # Netwide Assembler (x86/x64)
    binutils # GNU assembler (gas)
    llvmPackages.bintools # LLVM assembler tools

    # Debuggers
    gdb # GNU debugger
    lldb
    assemblyscript
    rappel
    asmrepl
    asm-lsp
    armitage
    armips
    armadillo
    kanata
    kanata-with-cmd
#    caligula #user-friendly disk imaging
    figlet
    toilet
    lolcat
    boxes
    cowsay
   kdePackages.plasma-nm
   networkmanagerapplet
   protonvpn-gui
   protonvpn-cli
    ueberzugpp
    #openvpn
     openvpn
     openvpn3
     ghostscript
     #powershell
     powershell
     steam-run
  ];

    services.geoclue2.enable = true;
    services.gvfs.enable = true;

  services.mysql = {
    enable = true;
    package = pkgs.mysql84;
  };
  services.postgresql.enable = true;
  # services.postgresql.enableTCPIP = true; # Optional: Enable remote connections
  #services.tor.enable = true;
  programs.pay-respects.enable = true;
  programs.command-not-found.enable = true;
  services.xserver.videoDrivers = ["amdgpu"];

  boot.initrd.kernelModules = ["amdgpu"];

  services.fwupd.enable = true; # For firmware updates

  #To reduce information leakage from kernel logs and pointers.
  boot.kernel.sysctl."kernel.kptr_restrict" = 1;
  boot.kernel.sysctl."kernel.dmesg_restrict" = 1;

  hardware.enableRedistributableFirmware = true;
  hardware.cpu.amd.updateMicrocode = true;

  # boot.kernelParams = [
  # For Barcelo APUs, these are more relevant:
  #  "amdgpu.dc=1" # Enable Display Core (required for most AMD GPUs)
  # "amdgpu.sg_display=0" # Only if you still see display issues
  # "radeon.si_support=0" # Force AMDGPU driver
  # "amdgpu.si_support=1"
  #];

  #hardware.graphics = {
  # enable = true; # Enables graphics stack (OpenGL, Vulkan, etc.)
  # enable32Bit = true; # Enables 32-bit support for e.g. Steam, Wine
  # extraPackages = with pkgs; [
  #   amdvlk
  #   mesa # OpenGL/Vulkan drivers
  #   vulkan-loader
  #   libva # Video acceleration
  # ];
  # extraPackages32 = with pkgs; [
  #   driversi686Linux.amdvlk
  # ];
  #};

  environment.variables = {
    AMD_VULKAN_ICD = "RADV"; # Use Mesa's Vulkan driver instead of AMDVLK
    RADV_PERFTEST = "gpl"; # Enable advanced features
    #here key
  };

  # security.sudo.extraConfig = ''
  # Defaults env_keep += "PROMPT"
  #  Defaults env_keep += "PS1"
  #'';

  catppuccin.flavor = "mocha";
  catppuccin.enable = true;

#  nixos-boot = {
    # enable = true;

    # Set background color to pure black
    #bgColor.red = 0;
    #bgColor.green = 0;
    # bgColor.blue = 0;

    # Optional: show the theme for a few seconds in fast boots
 #   duration = 3.0;
 # };
}
