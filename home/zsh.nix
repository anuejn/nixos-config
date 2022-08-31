{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
    xclip
  ];
  programs = {
    exa = { enable = true; enableAliases = true; };
    bat.enable = true;
    autojump.enable = false;
    zoxide.enable = true;
    fzf.enable = true;

    starship = {
      enable = true;
      enableZshIntegration = true;
    };
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;

    history = {
      size = 100000;
      save = 2000000;
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "history"
      ];
    };

    shellAliases = {
      cat = "bat";
      cd = "z";
      vi = "vim";
      open = "detach xdg-open";
      o = "open";
      py = "python";
      clip = "xclip -selection clipboard";
      fhs = "~/fhs.sh";
    };

    initExtra = ''
      function detach {
         nohup $* >/dev/null 2>&1
      }

      function r {
        rink "$*"
      }
    '';

    dirHashes = {
      # Shortcuts for popular locations
      ap = "$HOME/code/apertus";
      au = "$HOME/code/audapolis/audapolis";
      co = "$HOME/code";
      dl = "$HOME/Downloads";
    };

    sessionVariables = {
      EDITOR = "vim";
    };
  };
}
