with import <nixpkgs> {};

pkgs.mkShell {
  name = "esptool-dev";

  nativeBuildInputs = with pkgs; [
    firefox-unwrapped
    chromium
    glxinfo
    python310
    python310Packages.pip
    python310Packages.tkinter
    python310Packages.dbus-next
    dbus
    thonny
    xdg-utils
    picocom
  ];

  LANGUAGE     = "Python310";
  VERSION      = "python -m esptool version";

  shellHook = ''
    # Optional: Script environment start up 
    # Optional: Set up a virtual environment when entering the shell
    python3 -m venv .venv
    source .venv/bin/activate
    pip install esptool
    echo "Welcome to $LANGUAGE Development Environment"
    $VERSION
  '';
}
