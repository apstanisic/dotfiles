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
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # All manually installed Nix packages. 
  home.packages = with pkgs; [ 
    bat
    delta
    deno
    docker-compose
    duf
    exa
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
    tldr
    tmux
    topgrade
    trash-cli
    xh
    zellij
	zoxide
    distrobox
    # Problem with desktop integration
#     vscode
    # For some reason `npx -y only-allow pnpm`
    # throws when using nix versions, but not with volta
    # installs both node and npm
#    nodejs-16_x
#    nodePackages.pnpm
#    nodePackages.typescript
     # Can't access network for some reason??
#     nodePackages.npm-check-updates
  ];

  # Maybe 
  # dconf = {
  #   enable = true;
  #   settings = {
  #       "org/gnome/calculator" = {
  #       button-mode = "programming";
  #     };
  #   };
  # };
  
}
