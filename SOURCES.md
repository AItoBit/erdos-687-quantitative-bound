# Sources and scope

## Mathematical input

OpenAI, *A quadratic bound for Jacobsthal's function*, September 25, 2026, theorem 1.1. The 83-page paper was reviewed in full across two agents; this source reading does not replace checking the formal dependency. Exact release pin: `1581d4cbdd69a0faf34b2089614fe2a814316a6a`.

https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/A-quadratic-bound-for-Jacobsthals-function-September-25-2026/paper.pdf

Mathlib's Chebyshev upper bound is used through `Chebyshev.eventually_primeCounting_le` at Mathlib pin `065356127b1dc0016f66b7283ce0ce2c4055aa55`.

https://github.com/leanprover-community/mathlib4/blob/065356127b1dc0016f66b7283ce0ce2c4055aa55/Mathlib/NumberTheory/Chebyshev.lean

## Original problem and related formalization

- Paul Erdos, *Some unconventional problems in number theory* (1979), pp 71–80, especially p79. Full-paper reading reused from the preceding campaign, with the relevant page visually checked again.
- Paul Erdos, *A survey of problems in combinatorial number theory* (1980), pp 89–115, especially p106. All 27 pages read in this campaign.
- Current problem statement: https://www.erdosproblems.com/687
- Exact previous little-o bridge: https://github.com/30k30/scholia/blob/b072c89c3edac06521868e32cc15b2bc91bd8533/erdos-687/glue/JacobsthalTo687.lean

The supplied two-page 687.pdf was read completely. It is a forum printout, not a full proof manuscript; its SHA256 is `c5df8548221609206c0150ca383b337e6a7cb1ede54b2b06f120c1e1c9bd74e2`.

## Research limits

The local corpus audit records 6 discovered works, 4 screened, 3 reviewed in full text and 1 mathematical proof input; the arXiv subset has 0 in all four counts. The requested Studio's default 100-paper literature quota is not met. Reading records are separate from proof verification, and the research campaign is not claimed complete.

The bound formalized by the transfer is known mathematics. The stronger near-linear upper bound, exact order of Y(x), and an asymptotically matching lower bound are not proved here. A still-unverified dependency port does not establish the final unconditional Lean theorem.

The official publisher preview of Er96b was screened, but the complete three-page text was not obtained. Its displayed inequality direction is unresolved without the full scan; it is not used as a proof input.
