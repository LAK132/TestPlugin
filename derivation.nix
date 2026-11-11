{
	stdenv,
	lib,
  buildDotnetModule,
	dotnetCorePackages,
	dalamudLibPath,
}:

buildDotnetModule rec {
	pname = "SamplePlugin";
	version = "v0.1";

	src = ./.;
	projectFile = "${pname}/${pname}.csproj";

	buildType = "Debug";
	# buildType = "Release";

	runtimeId = "win-x64";
	executables = [];
	dotnetFlags = [ "-p:DalamudLibPath=${dalamudLibPath}" ];

	dotnet-sdk = dotnetCorePackages.sdk_10_0;
	nugetDeps = ./deps.json;

	postFixup = ''
		cp ${pname}/bin/${buildType}/${runtimeId}/${pname}.json $out/lib/${pname}/
	'';
}
