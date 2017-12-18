{ pkgs, lib, ... }:

{
  users.defaultUserShell  = pkgs.zsh;

  environment.shellAliases = {
    vi    = "nvim";
    pingg = "ping -c 4 8.8.8.8";
  };

  programs.zsh = {
    enable                    = true;
    enableAutosuggestions     = true;
    enableCompletion          = true;
    syntaxHighlighting.enable = true;
  };
}
