{inputs, ...}: final: prev: {
  awesome = prev.awesome.overrideAttrs (oa: {
    src = inputs.awesome-src;

    buildInputs = oa.buildInputs ++ (with prev; [libxcb-errors]);

    patches = [];

    postPatch = ''
      patchShebangs tests/examples/_postprocess.lua
      patchShebangs tests/examples/_postprocess_cleanup.lua
    '';
  });
}
