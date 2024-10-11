{ pkgs, ... }: {
  hardware.firmware = [
    # NOTE: Firmware for macbook to enable wifi
    (pkgs.stdenvNoCC.mkDerivation rec {
      name = "brcm-firmware";
      src = ../../../res/firmware.tar;
      unpackPhase = ''
        mkdir -p $out/lib/firmware/brcm
        tar -xf ${src} -C $out/lib/firmware/brcm
      '';
    })
  ];
}
