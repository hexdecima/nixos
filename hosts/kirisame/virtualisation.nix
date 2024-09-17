{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    libvirt
    virt-viewer
    virt-top
    nixos-shell
  ];
  virtualisation.libvirtd.enable = true;
  # virtualisation.docker.enable = true;
  programs.virt-manager.enable = true;
}
