{ pkgs, config, lib, ... }: {
  users.users.operator = {
    isNormalUser = true;
    home = "/home/operator";
    extraGroups = [ "wheel" ]
      ++ lib.optional config.programs.wireshark.enable "wireshark"
      ++ lib.optional config.virtualisation.libvirtd.enable "libvirt"
      ++ lib.optional config.virtualisation.docker.enable "docker";
    shell = pkgs.fish;
  };
  home-manager.users.operator = import ./home/operator.nix;
}
