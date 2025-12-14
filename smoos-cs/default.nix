{
  buildDotnetModule,
  lib,
}:

buildDotnetModule (finalAttrs: {
  pname = "smoos-cs";
  version = "1.3.5";

  src = ./csharp-server;
  projectFile = "Server/Server.csproj";

  nugetDeps = ./deps.json;

  patches = [ ./dotnet8.patch ];

  postInstall = "cp ${./settings.nix} $out/settings.nix";

  meta = {
    description = "Super Mario Odyssey: Online Server - C#";
    homepage = "https://github.com/SchweGELBin/smoos";
    changelog = "https://github.com/SchweGELBin/smoos/blob/v${finalAttrs.version}/docs/CHANGELOG.md";
    license = lib.licenses.free;
    mainProgram = "Server";
    maintainers = with lib.maintainers; [ SchweGELBin ];
  };
})
