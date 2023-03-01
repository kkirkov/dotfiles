{
  networking.hostId = "426c4aab";
  system.stateVersion = "22.05";

  services.zfs = {
    trim.enable = true;
    autoScrub.enable = true;
    autoScrub.pools = ["zfs_root"];
  };
}