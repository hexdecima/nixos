{ pkgs, inputs, system, ... }: {
  fonts.packages = with pkgs; [
    # some basic fonts.
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    corefonts
    vistafonts

    # CJK fonts.
    ipafont
    kochi-substitute
  ];
}
