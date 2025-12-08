{
  pkgs ? import <nixpkgs> { },
}:

{
  smoos-bot = pkgs.callPackage ./smoos-bot { };
  smoos-cs = pkgs.callPackage ./smoos-cs { };
  smoos-rs = pkgs.callPackage ./smoos-rs { };
}
