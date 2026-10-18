# Quantitative transfer for Erdos problem 687

**Status: conditional transfer verified; unconditional solution pending.**
The finite CRT bridge and `Erdos687.quadratic_transfer` passed `lake --wfail build Transfer` in [CI run 39105468743](https://github.com/AItoBit/erdos-687-quantitative-bound/actions/runs/39105468743) at commit `7dbff96096532d1cd3bb2e23a506e9185ecb62cd`. Both audited declarations depend only on `propext`, `Classical.choice`, and `Quot.sound`.

The target is the known bound **Y(x) = O((x/log x)^2)**. The generic transfer has an explicit uniform quadratic Jacobsthal hypothesis. That hypothesis still needs to be discharged with OpenAI's actual closed theorem after the [dependency port](https://github.com/AItoBit/jacobsthal-lean435) is verified. This repository does not yet provide an unconditional proof of the target. The near-linear bound asked in problem 687 remains open. No new mathematical result is claimed.

[PROOF.md](PROOF.md) gives the mathematical deduction, including its substantial analytic input. `Challenge.lean` independently states the target and covering definitions using canonical Mathlib imports. Its deliberate proof hole is for comparison only; it cannot certify the final solution. `comparator.json` compares both definitions and the intended final theorem, which is not yet implemented here.

The original Jacobsthal mathematics and Lean proof are credited to [OpenAI](https://github.com/openai/math/tree/1581d4cbdd69a0faf34b2089614fe2a814316a6a). The existing little-o bridge of [H. J. van Veen in 30k30/scholia](https://github.com/30k30/scholia/blob/b072c89c3edac06521868e32cc15b2bc91bd8533/erdos-687/glue/JacobsthalTo687.lean) is prior formalization. This project supplies an independent CRT and prime-counting transfer under AItoBit's direction, with Codex agents implementing and reviewing the code. No source-author endorsement or human expert review is claimed.

Lean is pinned to 4.35.0-rc2 and Mathlib to `065356127b1dc0016f66b7283ce0ce2c4055aa55`. Build the current scope with `lake --wfail build Transfer Challenge`. The [Formal Conjectures draft PR](https://github.com/google-deepmind/formal-conjectures/pull/7442) records the known quantitative variant without a new formal-proof claim.
