module
/-
Licensed under the Apache License, Version 2.0. See LICENSE.
-/
public import Mathlib.NumberTheory.Primorial
public import Mathlib.Data.Nat.ChineseRemainder
public import Mathlib.Data.Int.Basic
public import Mathlib.Tactic.Ring

/-!
# Finite covering and coprimality: research draft

These independent elementary proofs have NOT been compiled. They do not prove
the quadratic Jacobsthal theorem or a new solution of Erdős problem 687.
The covering definition matches `Green46.IsCoveredByResidues` upstream.
-/

@[expose] public section

namespace Erdos687

def Covered (x y : ℕ) : Prop :=
  ∃ a : ℕ → ℕ, ∀ m ∈ Finset.Icc 1 y,
    ∃ p ≤ x, p.Prime ∧ m ≡ a p [MOD p]

/-- The complete residue vector may be represented by one common CRT shift. -/
theorem covered_iff_shift (x y : ℕ) :
    Covered x y ↔ ∃ t < primorial x,
      ∀ m ∈ Finset.Icc 1 y,
        ¬ Nat.Coprime ((m : ℤ) - (t : ℤ)).natAbs (primorial x) := by
  constructor
  · rintro ⟨a, ha⟩
    have hs : ∀ p ∈ Nat.primesLE x, (fun p : ℕ ↦ p) p ≠ 0 :=
      fun p hp ↦ (Nat.prime_of_mem_primesLE hp).ne_zero
    have hpair : Set.Pairwise (Nat.primesLE x : Set ℕ)
        (Function.onFun Nat.Coprime fun p : ℕ ↦ p) := by
      intro p hp q hq hpq
      exact (Nat.coprime_primes (Nat.prime_of_mem_primesLE hp)
        (Nat.prime_of_mem_primesLE hq)).mpr hpq
    let t := Nat.chineseRemainderOfFinset a (fun p ↦ p) (Nat.primesLE x) hs hpair
    refine ⟨t, ?_, ?_⟩
    · simpa only [primorial_eq_prod_primesLE] using
        (Nat.chineseRemainderOfFinset_lt_prod a (fun p ↦ p) hs hpair)
    · intro m hm
      obtain ⟨p, hpx, hp, hma⟩ := ha m hm
      have htp : (t : ℕ) ≡ a p [MOD p] :=
        t.property p (Nat.mem_primesLE.mpr ⟨hpx, hp⟩)
      have hdiv : p ∣ ((m : ℤ) - (t : ℤ)).natAbs :=
        Int.natCast_dvd.mp (Nat.modEq_iff_dvd.mp (htp.trans hma.symm))
      exact Nat.Prime.not_coprime_iff_dvd.mpr
        ⟨p, hp, hdiv, hp.dvd_primorial_iff.mpr hpx⟩
  · rintro ⟨t, _, ht⟩
    refine ⟨fun _ ↦ t, ?_⟩
    intro m hm
    obtain ⟨p, hp, hpm, hpx⟩ := Nat.Prime.not_coprime_iff_dvd.mp (ht m hm)
    refine ⟨p, hp.dvd_primorial_iff.mp hpx, hp, ?_⟩
    exact (Nat.modEq_iff_dvd.mpr (Int.natCast_dvd.mpr hpm)).symm

/-- A coprime integer in every interval of length `M` prevents a cover of
length `M`. This has no asymptotic or Jacobsthal-bound hypothesis. -/
theorem cover_lt_interval_bound {x y M : ℕ} (hc : Covered x y)
    (hM : ∀ a : ℤ, ∃ i : ℕ, i < M ∧
      Nat.Coprime (a + i).natAbs (primorial x)) : y < M := by
  obtain ⟨t, _, ht⟩ := (covered_iff_shift x y).mp hc
  by_contra h
  have hMy : M ≤ y := Nat.le_of_not_gt h
  obtain ⟨i, hi, hcop⟩ := hM (1 - (t : ℤ))
  have hi' : i + 1 ∈ Finset.Icc 1 y :=
    Finset.mem_Icc.mpr ⟨Nat.succ_pos _, (Nat.succ_le_of_lt hi).trans hMy⟩
  have hbad := ht (i + 1) hi'
  apply hbad
  have heq : ((i + 1 : ℕ) : ℤ) - (t : ℤ) = 1 - (t : ℤ) + (i : ℤ) := by
    push_cast
    ring
  simpa only [heq] using hcop

end Erdos687
