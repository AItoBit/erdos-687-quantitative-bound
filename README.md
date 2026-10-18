# Quantitative transfer for Erdos problem 687

Work in progress: the finite CRT bridge and conditional quantitative transfer await compiler verification. This repository does not yet contain an unconditional solution.

The target is the known bound Y(x) = O((x/log x)^2), using the proved uniform quadratic Jacobsthal theorem as an input. The near-linear bound asked in problem 687 remains open. This is a formalization project, not a claim of new mathematics.

The explicit hypothesis of `Erdos687.quadratic_transfer` must be discharged using the actual closed OpenAI Jacobsthal theorem. A compatible dependency port is being verified separately. The original Jacobsthal proof is credited to OpenAI; the existing little-o bridge of H. J. van Veen in 30k30/scholia is related prior formalization.

Lean 4.35.0-rc2, Mathlib pinned in lakefile.toml. Build: `lake --wfail build Transfer`.
