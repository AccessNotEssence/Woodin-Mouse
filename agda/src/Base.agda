{-# OPTIONS --cubical #-}

--------------------------------------------------------------------------------
-- Base.agda: Fibrant Universe Foundations & Premouse Signatures
-- Part of the 2LTT Fibrant Homotopy Layer (Woodin-Mouse).
--
-- Models the ∞-groupoid reasoning space where elementary embeddings and
-- continuum phase transitions are tracked as continuous homotopy paths.
--------------------------------------------------------------------------------

module Base where

open import Cubical.Core.Everything public
open import Cubical.Foundations.Prelude public

-- Discrete natural numbers used for indexing hierarchy projecta ρ_n(M)
data Nat : Type₀ where
  zero : Nat
  suc  : Nat → Nat

-- Fibrant representation of a Fine-Structural Premouse in the ∞-groupoid layer
record FibrantPremouse : Type₀ where
  constructor mkPremouse
  field
    criticalKappa : Nat
    projectumRank : Nat
