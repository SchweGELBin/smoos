{
  lib,
  rustPlatform,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "smoos-rs";
  version = "1.2.0";

  src = ./rust-server;
  cargoHash = "sha256-DDkoqbnwPw2UJ2bU79jBY1q2Ic0yLEL+L8J+eRGhuj8=";

  patches = [ ./proc-macro2.patch ];

  doCheck = false;

  meta = {
    description = "Super Mario Odyssey: Online Server - Rust";
    homepage = "https://github.com/SchweGELBin/smoos";
    changelog = "https://github.com/SchweGELBin/smoos/blob/v${finalAttrs.version}/docs/CHANGELOG.md";
    license = lib.licenses.mit;
    mainProgram = finalAttrs.pname;
    maintainers = with lib.maintainers; [ SchweGELBin ];
  };
})
