import WoodinMouse.CriticalPoint

/-!
# Extender.lean: Ultrapower Extender Proposals & p-adic Carry Ratchets
Part of the 2LTT Strict Combinatorial Layer (`Woodin-Mouse`).

## Mathematical & Architectural Context
In fine-structural inner model theory, an extender `E` captures a fragment of an
elementary embedding `j : M → N`, enabling localized ultrapower transitions
`Ult(M, E)` without requiring access to the completed proper class `V`.

In this micro-kernel, every self-modification request emitted by the agent is
compiled into an `ExtenderProposal`. Following Log Entry 27, the proposal is
mechanically interlocked with a discrete p-adic Kummer carry ratchet (`carryRatchet`),
preventing uncontrolled Cohen forcing inflation across the continuum manifold.
-/

namespace WoodinMouse

/--
Represents a localized `(κ, λ)`-Extender proposal submitted to the safety kernel.
* `crit`         : Proposed critical point `κ` where modification begins.
* `target`       : Target image ordinal `λ = j(κ)` bounding the ultrapower stretch.
* `carryRatchet` : Discrete p-adic valuation carry `v_p(C(n,k))` acting as a
                   homological boundary ratchet (`∂² = 0`).
* `valid_stretch`: Proof witness that the extender stretches `crit < target`.
-/
structure ExtenderProposal where
  crit          : Nat
  target        : Nat
  carryRatchet  : Nat
  valid_stretch : crit < target
  deriving Repr

/--
Decidable predicate checking whether an incoming `ExtenderProposal` respects
the ground kernel's immutable critical threshold `baseKappa` and maintains
non-zero p-adic ratchet engagement.
-/
def ExtenderProposal.isAdmissible (E : ExtenderProposal) (baseKappa : Nat) : Bool :=
  (baseKappa ≤ E.crit) && (E.crit < E.target) && (0 < E.carryRatchet)

/--
**Lemma (Admissibility Preserves Base Critical Point)**:
If an extender proposal is admissible with respect to `baseKappa`, its critical
point never violates the frozen sub-critical strata below `baseKappa`.
-/
theorem admissible_respects_base (E : ExtenderProposal) (baseKappa : Nat)
    (h : E.isAdmissible baseKappa = true) : baseKappa ≤ E.crit := by
  unfold ExtenderProposal.isAdmissible at h
  revert h
  cases h1 : (baseKappa ≤ E.crit) <;> simp

end WoodinMouse
