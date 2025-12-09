{
  lib,
  rustPlatform,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "smoos-rs";
  version = "1.3.1";

  src = ./rust-server;
  cargoLock.lockFile = "${finalAttrs.src}/Cargo.lock";

  prePatches = [ ./proc-macro2.patch ];

  doCheck = false;

  postInstall = "cp ${./settings.json} $out/settings.json";

  meta = {
    description = "Super Mario Odyssey: Online Server - Rust";
    homepage = "https://github.com/SchweGELBin/smoos";
    changelog = "https://github.com/SchweGELBin/smoos/blob/v${finalAttrs.version}/docs/CHANGELOG.md";
    license = lib.licenses.mit;
    mainProgram = "smo-rs";
    maintainers = with lib.maintainers; [ SchweGELBin ];
  };
})
