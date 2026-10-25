import Lake
open Lake DSL

/-!
# Woodin-Mouse Lake Build Configuration
Defines the compilation target for the 2LTT Strict Layer in Lean 4.
Notice: Zero external dependencies required; compiles purely against Lean 4 core
to guarantee permanent CI reproducibility across decades.
-/

package «woodin-mouse» where
  -- Strict verification compiler flags
  moreLeanArgs := #["-DautoImplicit=false"]

@[default_target]
lean_lib «WoodinMouse» where
  -- Points to lean/WoodinMouse.lean and lean/WoodinMouse/*.lean
  roots := #[`WoodinMouse]
