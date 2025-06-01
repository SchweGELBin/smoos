{
  buildDotnetModule,
  lib,
}:

# https://github.com/SchweGELBin/nur-packages/blob/main/smoos/smoos-cs.nix

buildDotnetModule (finalAttrs: {
  pname = "smoos-cs";
  version = "0.1.1";

  src = ./csharp-server;
  projectFile = ./csharp-server/Server/Server.csproj;

  meta = {
    description = "Super Mario Odyssey: Online Server - C#";
    homepage = "https://github.com/SchweGELBin/smoos";
    changelog = "https://github.com/SchweGELBin/smoos/blob/v${finalAttrs.version}/docs/CHANGELOG.md";
    license = lib.licenses.agpl3Only;
    mainProgram = finalAttrs.pname;
    maintainers = with lib.maintainers; [ SchweGELBin ];
  };
})
