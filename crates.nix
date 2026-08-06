{...}: {
  perSystem = {
    pkgs,
    config,
    ...
  }: {
    nci = {
      toolchainConfig = ./rust-toolchain.toml;
      projects.iced_webview_v2.path = ./.;
      crates.iced_webview_v2 = {
        depsDrvConfig = {
          mkDerivation = {
            nativeBuildInputs = with pkgs; [
              pkg-config
              python3
              fontconfig
              rust-jemalloc-sys
              libclang.lib
            ];
          };

          env = {
            LIBCLANG_PATH = "${pkgs.libclang.lib}/lib";
          };
        };
      };
    };
  };
}
