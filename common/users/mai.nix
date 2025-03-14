{ unstable, config, lib, ... }: {
  users.users.mai = {
    isNormalUser = true;
    home = "/home/mai";
    extraGroups = [ "wheel" ]
      ++ lib.optional config.programs.wireshark.enable "wireshark"
      ++ lib.optional config.virtualisation.libvirtd.enable "libvirt"
      ++ lib.optional config.virtualisation.docker.enable "docker";
    shell = unstable.nushell;
  };
  home-manager.users.mai = import ./home/mai.nix;
}
