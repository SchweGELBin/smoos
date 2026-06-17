{
  buildDotnetModule,
  lib,
  dotnet-sdk_10,
}:

buildDotnetModule (finalAttrs: {
  pname = "smoos-cs";
  version = "1.4.2";

  src = ./csharp-server;
  projectFile = "Server/Server.csproj";

  dotnet-sdk = dotnet-sdk_10;
  nugetDeps = ./deps.json;

  postInstall = "cp ${./settings.nix} $out/settings.nix";

  meta = {
    description = "Super Mario Odyssey: Online Server - C#";
    homepage = "https://github.com/SchweGELBin/smoos";
    changelog = "https://github.com/SchweGELBin/smoos/blob/v${finalAttrs.version}/docs/CHANGELOG.md";
    license = lib.licenses.free;
    mainProgram = "Server";
    maintainers = [ lib.maintainers.SchweGELBin ];
  };
})
