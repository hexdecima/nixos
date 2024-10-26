
{ pkgs, config, lib, ... }: {
  users.users.ichi = {
    isNormalUser = true;
    home = "/home/ichi";
    extraGroups = [ "wheel" ]
      ++ lib.optional config.programs.wireshark.enable "wireshark"
      ++ lib.optional config.virtualisation.libvirtd.enable "libvirt"
      ++ lib.optional config.virtualisation.docker.enable "docker";
    shell = pkgs.fish;
  };
  home-manager.users.ichi = import ./home/ichi.nix;
}
