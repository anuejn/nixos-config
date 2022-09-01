{ pkgs, lib, ... }: {
  imports = [
    ./git.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    file
    sshfs
    nmap

    gnumake
    pkgconfig
    rustup
    clang
    openssl

    nodejs-slim
    nodePackages.npm
    (python3.withPackages (ps: with ps; [
      numpy
    ]))
    poetry

    imagemagick
    potrace
    pandoc
    htop
    cloc
    rink
    jq
    ripgrep-all

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

    shaderc

    texlive.combined.scheme-full
  ] ++ (if !stdenv.isLinux then [  ] else [ 
    android-tools 
    toybox
  ]);
}
