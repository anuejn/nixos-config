{ pkgs, lib, ... }: {
  imports = [
    ./git.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    gnumake
    cargo
    clang

    nodejs
    python3

    pandoc
    htop
    cloc
    rink
    jq

    gh
    pre-commit
    rnix-lsp
    nixpkgs-fmt
    nodePackages.gitmoji-cli
    nodePackages.web-ext
    patchelf
    hydra-check

    borgbackup

    youtube-dl
    ffmpeg
  ];
}
