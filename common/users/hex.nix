{ pkgs, config, lib, ... }: {
  users.users.hex = {
    isNormalUser = true;
    home = "/home/hex";
    extraGroups = [ "wheel" ]
      ++ lib.optional config.programs.wireshark.enable "wireshark"
      ++ lib.optional config.virtualisation.libvirtd.enable "libvirt"
      ++ lib.optional config.virtualisation.docker.enable "docker";
    shell = pkgs.fish;
  };
  home-manager.users.hex = import ./home/hex.nix;
}
