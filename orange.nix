{ pkgs ? import <nixpkgs> {} }:

let
  py = pkgs.python3;
in
pkgs.mkShell {
  buildInputs = [
    (py.withPackages (ps: [
      ps.orange3
    ]))

    # Qt 5 with Wayland plugins
    pkgs.qt5.qtbase
    pkgs.qt5.qtsvg
    pkgs.qt5.qtdeclarative
    pkgs.qt5.qtwayland
  ];

  shellHook = ''
    # ensure python exists as `python`
    if ! command -v python >/dev/null 2>&1; then
      alias python=python3
    fi

    # do NOT force xcb anymore; let it use wayland / wayland-egl
    unset QT_QPA_PLATFORM
  '';
}

