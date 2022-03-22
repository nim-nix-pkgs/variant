{
  description = ''Variant type and type matching'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-variant-v0_2_6.flake = false;
  inputs.src-variant-v0_2_6.ref   = "refs/tags/v0.2.6";
  inputs.src-variant-v0_2_6.owner = "yglukhov";
  inputs.src-variant-v0_2_6.repo  = "variant.git";
  inputs.src-variant-v0_2_6.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-variant-v0_2_6"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-variant-v0_2_6";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}