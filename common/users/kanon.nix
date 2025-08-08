{ unstable, config, lib, ... }: {
  users.users.kanon = {
    isNormalUser = true;
    home = "/home/kanon";
    extraGroups = [ "wheel" ]
      ++ lib.optional config.programs.wireshark.enable "wireshark"
      ++ lib.optional config.virtualisation.libvirtd.enable "libvirt"
      ++ lib.optional config.virtualisation.docker.enable "docker";
    shell = unstable.nushell;
  };
  home-manager.users.kanon = import ./home/kanon.nix;
}
