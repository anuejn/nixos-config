{ pkgs, lib, ... }: {
  imports = [
    ./git.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    gnumake
    cargo
    clang

    nodejs-slim
    nodePackages.npm
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
    nixopsUnstable

    borgbackup

    youtube-dl
    ffmpeg
  ];
}
