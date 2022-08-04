{
  description = "Nim Emscripten Environment";

  inputs.nixpkgs.url  = "github:nixos/nixpkgs/22.05";
  inputs.dsf.url      = "github:cruel-intentions/devshell-files";
  inputs.dsf.inputs.nixpkgs.follows = "nixpkgs";

  outputs = inputs: inputs.dsf.lib.shell inputs [
    ./project.nix  # import nix module
  ];
}
