{ config, pkgs, ...}:
{
  home.sessionVariables = {
    LEDGER_FILE = "~/Documents/share_docs/Financial/ledger/transactions.journal";
  };
  programs.zsh.shellAliases = {
    journal = ''[ -f ~/journal/Daily/$(date +%Y%m%d).md ] || echo "# Journal for $(date '+%A, %B %-d')$(date '+%d' | sed 's/\b\(1[123]\|[^1]1\)\b/th/;s/\b[^1]2\b/nd/;s/\b[^1]3\b/rd/;t;s/.*/th/') $(date +%Y)" > ~/journal/Daily/$(date +%Y%m%d).md; nvim ~/journal/Daily/$(date +%Y%m%d).md'';
    hm = "home-manager switch --flake ~/.dotfiles#thor";
  };
}
