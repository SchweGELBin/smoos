{
  lib,
  rustPlatform,
}:

# https://github.com/SchweGELBin/nur-packages/blob/main/smoos/smoos-rs.nix

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "smoos-rs";
  version = "0.1.1";

  src = ./rust-server;
  cargoLock.lockFile = ./rust-server/Cargo.lock;

  meta = {
    broken = true;
    description = "Super Mario Odyssey: Online Server - Rust";
    homepage = "https://github.com/SchweGELBin/smoos";
    changelog = "https://github.com/SchweGELBin/smoos/blob/v${finalAttrs.version}/docs/CHANGELOG.md";
    license = lib.licenses.mit;
    mainProgram = finalAttrs.pname;
    maintainers = with lib.maintainers; [ SchweGELBin ];
  };
})
