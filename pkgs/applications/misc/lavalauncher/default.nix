{ lib
, stdenv
, fetchgit
, meson
, ninja
, pkg-config
, scdoc
, cairo
, librsvg
, wayland
, wayland-protocols
}:

stdenv.mkDerivation rec {
  pname = "lavalauncher";
  version = "2.0.0";

  src = fetchgit {
    url = "https://git.sr.ht/~leon_plickat/lavalauncher";
    rev = "v${version}";
    sha256 = "MXREycR4ZetTe71ZwEqyozMJN9OLTDvU0W4J8qkTQAs=";
  };

  nativeBuildInputs = [ meson ninja pkg-config scdoc ];
  buildInputs = [
    cairo
    librsvg
    wayland
    wayland-protocols
  ];

  meta = with lib; {
    homepage = "https://git.sr.ht/~leon_plickat/lavalauncher";
    description = "A simple launcher panel for Wayland desktops";
    longDescription = ''
      LavaLauncher is a simple launcher panel for Wayland desktops.

      It displays a dynamically sized bar with user defined buttons. Buttons
      consist of an image, which is displayed as the button icon on the bar, and
      at least one shell command, which is executed when the user activates the
      button.

      Buttons can be activated with pointer and touch events.

      A single LavaLauncher instance can provide multiple such bars, across
      multiple outputs.

      The Wayland compositor must implement the Layer-Shell and XDG-Output for
      LavaLauncher to work.
    '';
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ AndersonTorres ];
    platforms = with platforms; unix;
  };
}
