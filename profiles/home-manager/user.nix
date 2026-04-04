{...}: c: {pkgs, ...}: {
  home.username = c.username;
  home.homeDirectory =
    if c ? homeDirectory
    then c.homeDirectory
    else if pkgs.stdenv.hostPlatform.isDarwin
    then "/Users/${c.username}"
    else "/home/${c.username}";
}
