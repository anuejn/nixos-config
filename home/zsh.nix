{
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
    vi = "vim";
    ls = "exa";
  };

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
}
