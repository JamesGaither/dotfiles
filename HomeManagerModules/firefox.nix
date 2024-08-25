{ pkgs, inputs, ...}:

{
  programs.firefox = {
    enable = true;
    profiles.default = {
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        bitwarden
        vimium
      ];
      isDefault = true;
      search = {
        force = true; # Replace the existing search config. Required to set search settings
        default = "DuckDuckGo";
        order = ["DuckDuckGo" "Google"];
        engines = {
          "Google".metaData.alias = "@g";
          # Disable all the useless default search engines
          "Bing".metaData.hidden = true;
          "Amazon.co.jp".metaData.hidden = true;
          "Wikipedia (en)".metaData.hidden = true;
          "eBay".metadata.hidden = true;
        };
      };
      settings = {
        "extensions.autoDisableScopes" = 0;
        #extensions.enabledScopes = 15;
      };
    };
  };

}
