# Claim status

| Claim | Status | Evidence and limit |
|---|---|---|
| Finite CRT equivalence and interval obstruction | Lean verified | `covered_iff_shift` and `cover_lt_interval_bound`; strict builds of Transfer pass. |
| Uniform quadratic Jacobsthal hypothesis implies Y(x)=O((x/log x)^2) | Lean verified, explicitly conditional | `quadratic_transfer`; standard three axioms. The hypothesis is an argument to the theorem. |
| Unconditional Y(x)=O((x/log x)^2) | Known mathematics; candidate Lean integration | `Solution.lean` applies OpenAI's proved theorem, but this project's complete dependency closure has not yet been rebuilt and audited. |
| Y(x)=o(x^2) | Existing result and prior formalization | Already recorded upstream using H. J. van Veen's bridge. This project does not claim priority. |
| Near-linear upper bound for every positive epsilon | Open in the inspected sources | Not proved by this development. |
| Exact order of Y(x) | Open in the inspected sources | No matching bound proved here. |
| Palomar intake and registration | Not submitted | Full verification and exact final-commit preflight are pending. |

The main problem's full solution and the Studio's 100-paper literature quota remain incomplete. Earlier successful CI built only Transfer and Challenge. The current workflow attempts Solution too; its complete build and final axiom audit remain pending. No new mathematical discovery, human expert review or source-author endorsement is claimed.
