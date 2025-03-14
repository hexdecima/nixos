{ rustPlatform, fetchFromGitHub, ... }: {
  file = rustPlatform.buildRustPackage rec {
    pname = "nu_plugin_file";
    version = "0.102.0";
    src = fetchFromGitHub {
      owner = "fdncred";
      repo = pname;
      rev = "eeb7d1ca95b9162fd990031d492e57381620a8ca";
      hash = "sha256-cMDkhNPIfkJb01fBSt2fCCdg/acdzak66qMRp0zuJzc=";
    };

    useFetchCargoVendor = true;
    cargoHash = "sha256-s2Sw8NDVJZoZsnNeGGCXb64WFb3ivO9TxBYFcjLVOZI=";
  };
}
