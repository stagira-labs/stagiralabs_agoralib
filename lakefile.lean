import Lake
open Lake DSL

package «agora_lib» {
  -- add any package configuration options here
}

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.17.0"


require VerifiedAgora from git
  "https://github.com/stagiralabs/VerifiedAgora.git" @ "v4.17.0"

@[default_target]
lean_lib Library where
