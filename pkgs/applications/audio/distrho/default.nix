{ lib, stdenv
, alsaLib
, fetchFromGitHub
, fftwFloat
, freetype
, libGL
, libX11
, libXcursor
, libXext
, libXrender
, meson
, ninja
, pkg-config
}:

stdenv.mkDerivation rec {
  pname = "distrho-ports";
  version = "2021-03-15";

  src = fetchFromGitHub {
    owner = "DISTRHO";
    repo = "DISTRHO-Ports";
    rev = version;
    sha256 = "00fgqwayd20akww3n2imyqscmyrjyc9jj0ar13k9dhpaxqk2jxbf";
  };

  nativeBuildInputs = [ pkg-config meson ninja ];

  buildInputs = [
    alsaLib
    fftwFloat
    freetype
    libGL
    libX11
    libXcursor
    libXext
    libXrender
  ];

  meta = with lib; {
    homepage = "http://distrho.sourceforge.net/ports";
    description = "Linux audio plugins and LV2 ports";
    longDescription = ''
      Includes:
        arctican-function
        arctican-pilgrim
        CHOW
        dexed
        drowaudio-distortion
        drowaudio-distortionshaper
        drowaudio-flanger
        drowaudio-reverb
        drowaudio-tremolo
        drumsynth
        easySSP
        eqinox
        HiReSam
        juce-opl
        klangfalter
        LUFSMeter
        LUFSMeter-Multi
        luftikus
        obxd
        pitchedDelay
        refine
        stereosourceseparation
        Swanky Amp
        tal-dub-3
        tal-filter
        tal-filter-2
        tal-noisemaker
        tal-reverb
        tal-reverb-2
        tal-reverb-3
        tal-vocoder-2
        temper
        vex
        vitalium
        wolpertinger
    '';
    license = with licenses; [ gpl2 gpl3 gpl2Plus lgpl3 mit ];
    maintainers = [ maintainers.goibhniu ];
    platforms = [ "x86_64-linux" ];
  };
}
