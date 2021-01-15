{
  lib, stdenv, makeWrapper, fetchFromGitHub, writeShellScriptBin,
  imagemagick, i3lock-color, xdpyinfo, xrandr, bc, feh, procps, xrdb, xset,
  gnused, gnugrep, coreutils
}:
let
  i3lock = writeShellScriptBin "i3lock" ''
    ${i3lock-color}/bin/i3lock-color "$@"
  '';
  binPath = stdenv.lib.makeBinPath [
    imagemagick i3lock
    xdpyinfo xrandr xset
    bc feh procps xrdb
    gnused gnugrep coreutils
  ];
in
stdenv.mkDerivation rec {
  pname = "multilockscreen";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "jeffmhubbard";
    repo = pname;
    rev = "v${version}";
    sha256 = "0gmnrq7ibbhiwsn7mfi2r71fwm6nvhiwf4wsyz44cscm474z83p0";
  };

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    mkdir -p $out/bin
    cp multilockscreen $out/bin/multilockscreen
    wrapProgram "$out/bin/multilockscreen" --prefix PATH : "${binPath}"
  '';

  meta = with lib; {
    description = "Wrapper script for i3lock-color";
    longDescription = ''
      multilockscreen is a wrapper script for i3lock-color.
      It allows you to cache background images for i3lock-color with a variety of different effects and adds a stylish indicator.
    '';
    homepage = "https://github.com/jeffmhubbard/multilockscreen";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = with maintainers; [ kylesferrazza ];
  };
}
