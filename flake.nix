{
  description = "Super Mario Odyssey: Online Server";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      inherit (nixpkgs) lib;
      systems = lib.systems.flakeExposed;
      eachSystem = lib.genAttrs systems;
    in
    {
      packages = eachSystem (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          smoos-bot = pkgs.callPackage ./SMOOS-Bot { };
          smoos-cs = pkgs.callPackage ./SMOOS-CS { };
          smoos-rs = pkgs.callPackage ./SMOOS-RS { };
        }
      );
    };
}
