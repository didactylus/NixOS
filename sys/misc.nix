( pkgs, ... )

{
  environment.systemPackages = with pkgs; [
    nil
    lua-language-server
    stylua
    nixd
  ];
}
