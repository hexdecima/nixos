{ pkgs, inputs, system, ... }: {
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    corefonts
    vistafonts

    # Japanese fonts.
    ipafont
    kochi-substitute

    # Nerd fonts.
    # (nerdfonts.override {
    #   fonts = [ "Ubuntu" "UbuntuMono" "Terminus" ];
    # })
    (inputs.nixprs.packages.${system}.departure-mono-nerd-font)
  ];
}
