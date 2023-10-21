{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "aleksandar";
  home.homeDirectory = "/home/aleksandar";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # All manually installed Nix packages. 
  home.packages = with pkgs; [ 
    sqlite
    bat
    delta
    deno
    # docker-compose
    duf
    # exa
    eza
    fd
    fzf
    gdu
    htop
    mcfly
    neovim
    rclone
    ripgrep
    rsync
    starship
    # tldr, Rust version alt
    tealdeer
    tmux
    # upgrade 
    topgrade
    # trush cli alt in rust 
    trashy
    # httpie alt
    xh
    # tmux alt
    zellij
    # jumper
	  zoxide
    distrobox
    # github cli
    gh
    # Dotfiles manager
    chezmoi
    wl-clipboard
    # Run multiple processes within TUI
    mprocs
    # Speed test
    speedtest-go
    # To create bootable flash drive
    ventoy
    # Node version manager
    fnm
  ];
  
}
