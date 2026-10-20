{
  description = "CsMut";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };

        dotnet = pkgs.dotnetCorePackages.combinePackages [
          pkgs.dotnet-sdk_10
          pkgs.dotnet-sdk_11
        ];
      in {
        devShells.default = pkgs.mkShell {
          packages = [
            dotnet
          ];

          shellHook = ''
            export DOTNET_ROOT="${dotnet}"
            export PATH="${dotnet}/bin:$PATH"
          '';
        };
      }
    );
}
