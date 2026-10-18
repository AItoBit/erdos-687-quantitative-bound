module
/-
Licensed under the Apache License, Version 2.0. See LICENSE.
-/
public import Erdos687.Finite
public import Mathlib.NumberTheory.Chebyshev
public import Mathlib.Tactic.Ring
public import Mathlib.Tactic.Positivity
public import Lean.Elab.Tactic.Omega

/-!
# A quantitative transfer from Jacobsthal to residue coverings

This module proves a conditional transfer using an explicit uniform quadratic
Jacobsthal bound and Mathlib's Chebyshev estimate. The quadratic bound is the
mathematical input of OpenAI's September 2026 Jacobsthal proof. A separate
solution module must instantiate this transfer with that actual proved theorem.
No theorem from the statement repository is used as a premise.

Research draft: not yet compiled.
-/

open Filter

@[expose] public section

namespace Erdos687

/-- The maximum cover length, with exactly the natural supremum definition
used for `Erdos687.Y` in the statement repository. -/
noncomputable def Y (x : ℕ) : ℕ :=
  sSup {y : ℕ | Covered x y}

/-- Any uniform coprimality interval bound also bounds the natural supremum
of all cover lengths. -/
theorem Y_le_interval_bound {x M : ℕ}
    (hM : ∀ a : ℤ, ∃ i : ℕ, i < M ∧
      Nat.Coprime (a + i).natAbs (primorial x)) : Y x ≤ M := by
  unfold Y
  apply csSup_le'
  intro y hy
  exact (cover_lt_interval_bound hy hM).le

/-- The uniform quadratic Jacobsthal bound implies the sharper covering
estimate `Y(x) = O((x / log x)^2)`, using the actual number of primes up to
`x` rather than the number of available indices. -/
theorem quadratic_transfer
    (H : ∃ C : ℝ, 0 < C ∧ ∀ k : ℕ, 0 < k → ∃ M : ℕ,
      (∀ n : ℕ, 0 < n → n.primeFactors.card ≤ k →
        ∀ a : ℤ, ∃ i : ℕ, i < M ∧ (a + i).natAbs.Coprime n) ∧
      (M : ℝ) ≤ C * (k : ℝ) ^ 2) :
    Asymptotics.IsBigO atTop (fun x : ℕ ↦ (Y x : ℝ))
      (fun x : ℕ ↦ ((x : ℝ) / Real.log (x : ℝ)) ^ 2) := by
  obtain ⟨C, hC, hJ⟩ := H
  have hpi : ∀ᶠ x : ℕ in atTop,
      (x.primeCounting : ℝ) ≤ (Real.log 4 + 1) * (x : ℝ) / Real.log (x : ℝ) := by
    have h := (tendsto_natCast_atTop_atTop :
        Tendsto (fun x : ℕ ↦ (x : ℝ)) atTop atTop).eventually
      (Chebyshev.eventually_primeCounting_le (by norm_num : (0 : ℝ) < 1))
    simpa only [Function.comp_apply, Nat.floor_natCast] using h
  refine Asymptotics.IsBigO.of_bound (C * (Real.log 4 + 1) ^ 2) ?_
  filter_upwards [hpi, eventually_ge_atTop (2 : ℕ)] with x hx hx2
  have hk : 0 < x.primeCounting := by
    by_contra h
    have heq : x.primeCounting = 0 := Nat.eq_zero_of_not_pos h
    have hle : x ≤ 1 := Nat.primeCounting_eq_zero_iff.mp heq
    omega
  obtain ⟨M, hM, hMC⟩ := hJ x.primeCounting hk
  have hcard : (primorial x).primeFactors.card ≤ x.primeCounting := by
    rw [primeFactors_primorial, Nat.primesLE_card_eq_primeCounting]
  have hYM : Y x ≤ M :=
    Y_le_interval_bound (hM (primorial x) (primorial_pos x) hcard)
  have hsq : (x.primeCounting : ℝ) ^ 2 ≤
      ((Real.log 4 + 1) * ((x : ℝ) / Real.log (x : ℝ))) ^ 2 := by
    have hbase : (x.primeCounting : ℝ) ≤
        (Real.log 4 + 1) * ((x : ℝ) / Real.log (x : ℝ)) := by
      simpa only [mul_div_assoc] using hx
    exact pow_le_pow_left₀ (Nat.cast_nonneg _) hbase 2
  rw [Real.norm_of_nonneg (Nat.cast_nonneg _), Real.norm_of_nonneg (sq_nonneg _)]
  calc
    (Y x : ℝ) ≤ (M : ℝ) := by exact_mod_cast hYM
    _ ≤ C * (x.primeCounting : ℝ) ^ 2 := hMC
    _ ≤ C * ((Real.log 4 + 1) * ((x : ℝ) / Real.log (x : ℝ))) ^ 2 :=
      mul_le_mul_of_nonneg_left hsq hC.le
    _ = (C * (Real.log 4 + 1) ^ 2) * ((x : ℝ) / Real.log (x : ℝ)) ^ 2 := by ring

end Erdos687
