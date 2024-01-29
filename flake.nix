{
  description = "Pipeline Query Language";

  inputs = {
    nixpkgs.url = "nixpkgs";
    flake-utils.url = "flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.go-tools # staticcheck
            pkgs.go_1_21
            pkgs.gotools  # godoc, etc.
          ];

          hardeningDisable = [ "fortify" ];
        };
      }
    );
}
