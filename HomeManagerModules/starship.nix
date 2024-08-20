{ pkgs, ...}:

{
  programs.starship = {
    enable = true;
    settings = {
      aws.disabled = true;
      # Do not really use package versions, so remove this
      package.disabled = true;
      directory.truncate_to_repo = false;

    };
  };
}
