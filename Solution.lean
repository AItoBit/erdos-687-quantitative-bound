/-
Licensed under the Apache License, Version 2.0. See LICENSE.
-/
module

public import Erdos687.Analytic
public import OAI.NumberTheory.Jacobsthal.Main

/-!
# Known quantitative covering bound for Erdos problem 687

The analytic input is OpenAI's closed quadratic Jacobsthal theorem. This
module combines that theorem with an independent CRT and Chebyshev transfer.
The near-linear question remains open.
-/
@[expose] public section
open Filter
namespace Erdos687

/-- The quadratic Jacobsthal theorem and prime counting give the known bound. -/
theorem quadratic_log :
    Asymptotics.IsBigO atTop (fun x : ℕ ↦ (Y x : ℝ))
      (fun x : ℕ ↦ ((x : ℝ) / Real.log (x : ℝ)) ^ 2) := by
  exact quadratic_transfer OAI.Erdos970.Erdos970Final.erdos_970_quadratic

end Erdos687
