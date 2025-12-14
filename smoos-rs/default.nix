{
  fetchpatch2,
  lib,
  rustPlatform,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "smoos-rs";
  version = "1.3.5";

  src = ./rust-server;
  cargoLock.lockFile = "${finalAttrs.src}/Cargo.lock";

  prePatches = [
    (fetchpatch2 {
      url = "https://github.com/speyejack/smo-multi-rs/pull/5.patch?full_index=1";
      hash = "sha256-HojEQy+c6u15GJ8ITh9EaZKTcLz5KBWARPodmeJYUl0=";
    })
  ];

  doCheck = false;

  postInstall = "cp ${./settings.nix} $out/settings.nix";

  meta = {
    description = "Super Mario Odyssey: Online Server - Rust";
    homepage = "https://github.com/SchweGELBin/smoos";
    changelog = "https://github.com/SchweGELBin/smoos/blob/v${finalAttrs.version}/docs/CHANGELOG.md";
    license = lib.licenses.mit;
    mainProgram = "smo-rs";
    maintainers = with lib.maintainers; [ SchweGELBin ];
  };
})
