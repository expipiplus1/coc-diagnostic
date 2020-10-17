{ pkgs ? import <nixpkgs> {} }:
with pkgs;

# Please run `yarn import` first to generate yarn.lock!
pkgs.mkYarnPackage rec {
  name = "coc-diagnostic";
  src = ./.;
  packageJSON = ./package.json;
  yarnLock = ./yarn.lock;

  installPhase = ''
    mkdir -p "$out/out"
    yarn build --output-path "$out/out"
    mv deps/${name}/package.json "$out"
  '';

  distPhase = ''
    true
  '';
}

