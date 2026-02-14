{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    dbeaver
    # dbeaver-bin
    # Add other dependencies here as needed
  ];
}
