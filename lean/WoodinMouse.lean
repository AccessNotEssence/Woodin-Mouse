/-!
# Woodin-Mouse: 2LTT Strict Layer Root Module
Entry point for the discrete combinatorial scaffolding of the minimal toy-mouse
runtime. Coordinates elementary embeddings, extender proposals, and the finite
co-iteration comparison state machine.

* `WoodinMouse.CriticalPoint`    : Locks critical point κ and Kunen's boundary.
* `WoodinMouse.Extender`         : Encodes self-modifications as extender proposals.
* `WoodinMouse.ComparisonKernel` : Executes state transitions and branch pruning.
-/

import WoodinMouse.CriticalPoint
import WoodinMouse.Extender
import WoodinMouse.ComparisonKernel
