{ pkgs, ... }: {
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;
  # increase total user watches so rust-analyzer don't gobble 'em up.
  boot.kernel.sysctl."fs.inotify.max_user_watches" = 1048576;
  boot.kernel.sysctl."kernel.sysrq" = 1;
}
