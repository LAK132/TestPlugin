{ pkgs ? import <nixpkgs> {}, dalamud-home }:
pkgs.callPackage ./derivation.nix {
	dalamudLibPath = builtins.path {
		path = "${dalamud-home}";
		name = "dalamudLibPath";
	};
}
