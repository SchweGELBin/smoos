{
  buildDotnetModule,
  lib,
}:

buildDotnetModule (finalAttrs: {
  pname = "smoos-cs";
  version = "0.1.2";

  src = ./csharp-server;
  projectFile = "SmoMultiplayerServer.sln";

  postUnpack = ''
    sed -i "s/net6.0/net8.0/g" csharp-server/Server/Server.csproj
    sed -i "s/net6.0/net8.0/g" csharp-server/Shared/Shared.csproj
  '';

  meta = {
    broken = true;
    description = "Super Mario Odyssey: Online Server - C#";
    homepage = "https://github.com/SchweGELBin/smoos";
    changelog = "https://github.com/SchweGELBin/smoos/blob/v${finalAttrs.version}/docs/CHANGELOG.md";
    license = lib.licenses.mit;
    mainProgram = finalAttrs.pname;
    maintainers = with lib.maintainers; [ SchweGELBin ];
  };
})
