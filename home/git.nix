{ pkgs, lib, ... }: {
  programs.git = {
    enable = true;
    userName = "Jaro Habiger";
    userEmail = "jarohabiger@googlemail.com";
    aliases = {
      co = "checkout";
      ci = "commit";
      cia = "commit --amend";
      s = "status";
      st = "status";
      b = "branch";
      p = "pull --rebase";
      pu = "push";
      lol = "log --graph --decorate --pretty=oneline --abbrev-commit --all";
    };
    extraConfig = {
      "merge \"npm-merge-driver\"" = {
        name = "automatically merge npm lockfiles";
        driver = "npx npm-merge-driver merge %A %O %B %P";
      };
      init.defaultBranch = "main";
    };
  };
}
