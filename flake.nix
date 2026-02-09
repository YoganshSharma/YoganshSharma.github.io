{
  description = "Yogansh's personal website";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      rec {
        packages.website = pkgs.stdenv.mkDerivation {
          name = "website";
          src = ./.;

          nativeBuildInputs = with pkgs; [
            zola
          ];

          buildPhase = ''
            pwd
            pushd web
            zola build
            popd
          '';

          installPhase = ''
            mkdir -p $out
            cp -r web/public/. $out/
          '';
        };
        packages.default = packages.website;
        apps.default = flake-utils.lib.mkApp {
          # drv = pkgs.writeShellScriptBin "pages" "${pkgs.python3}/bin/python3 -m http.server 8000 -d ${packages.pages}";
          drv = self.packages.${system}.website;
        };
        devShell = pkgs.mkShell {
          packages = [
            pkgs.zola
            pkgs.mprocs
          ];
        };

      }
    );
}
