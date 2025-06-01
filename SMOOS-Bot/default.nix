{
  lib,
  rustPlatform,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "smoos-bot";
  version = "0.1.0";

  src = ./.;
  cargoLock.lockFile = ./Cargo.lock;

  meta = {
    description = "Super Mario Odyssey: Online Server - Bot";
    homepage = "https://github.com/SchweGELBin/smoos";
    changelog = "https://github.com/SchweGELBin/smoos/blob/v${finalAttrs.version}/docs/CHANGELOG.md";
    license = lib.licenses.agpl3Only;
    mainProgram = finalAttrs.pname;
    maintainers = with lib.maintainers; [ SchweGELBin ];
  };
})
