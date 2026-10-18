/-
Licensed under the Apache License, Version 2.0. See LICENSE.
-/
module
public import Mathlib.NumberTheory.Primorial
public import Mathlib.NumberTheory.Chebyshev
public import Mathlib.Data.Nat.ModEq

/-!
# Known quantitative upper bound for Erdos problem 687

Independent statement for comparison. The near-linear bound remains open.
-/
@[expose] public section
set_option warn.sorry false
open Filter
namespace Erdos687

/-- One residue class for each prime up to `x` covers every integer in `[1,y]`. -/
def Covered (x y : ℕ) : Prop :=
  ∃ a : ℕ → ℕ, ∀ m ∈ Finset.Icc 1 y,
    ∃ p ≤ x, p.Prime ∧ m ≡ a p [MOD p]

/-- The greatest coverable length, represented by the natural supremum. -/
noncomputable def Y (x : ℕ) : ℕ :=
  sSup {y : ℕ | Covered x y}

/-- The known upper bound obtained from the quadratic Jacobsthal theorem. -/
theorem quadratic_log :
    Asymptotics.IsBigO atTop (fun x : ℕ ↦ (Y x : ℝ))
      (fun x : ℕ ↦ ((x : ℝ) / Real.log (x : ℝ)) ^ 2) := by
  sorry

end Erdos687
