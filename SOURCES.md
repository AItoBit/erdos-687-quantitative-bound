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

The local corpus audit records 7 discovered works, 6 screened, 4 reviewed in full text and 1 mathematical proof input; the arXiv subset has 0 in all four counts. The requested Studio's default 100-paper literature quota is not met. Reading records are separate from proof verification, and the research campaign is not claimed complete.

The bound formalized by the transfer is known mathematics. The stronger near-linear upper bound, exact order of Y(x), and an asymptotically matching lower bound are not proved here. A still-unverified dependency port does not establish the final unconditional Lean theorem.

The official publisher preview of Er96b was screened, but the complete three-page text was not obtained. Its displayed inequality direction is unresolved without the full scan; it is not used as a proof input.

Paul Erdos, On the integers relatively prime to n and on a number-theoretic function considered by Jacobsthal, Math. Scand. 10 (1962),163–170, DOI10.7146/math.scand.a-10523, was also read completely (all eight scanned pages). Its almost-all estimates do not discharge the uniform Jacobsthal hypothesis, and it explicitly omits one intermediate proof. It is background rather than a proof input here.

## Dependency source provenance

The compatibility port reuses OpenAI's actual theorem, not a replacement axiom.
Its supporting proof sources are preserved in separately pinned Git packages:

- `AItoBit/jacobsthal-pnt-lean435`, at `4698982c635e019c83b6216cbd9777e0a7f89198`;
- `AItoBit/jacobsthal-absorption-lean435`, at `4cab242c97bd91d5452af8e5f5f25cf23810fa97`;
- `AItoBit/jacobsthal-strongpnt-lean435`, at `b96d1670fb7fabf7ea55d67cc3bb69ce1f054953`.

The seven StrongPNT files are complete new-file additions in OpenAI's patch
at release `1581d4cbdd69a0faf34b2089614fe2a814316a6a`. Two agents independently
reconstructed these additions and compared their complete bodies byte for byte,
after normalizing line endings. The package preserves OpenAI's Apache license
and the MathInc/Gauss and PNT adaptation credits. It contains no unchanged files
from the underlying StrongPNT repository, which has no explicit license.
This is a factual source-provenance record, not a claim of original authorship
or a legal certification. The package notices record the detailed source pins.

The earlier candidate used inherited paths below `.lake` and a runtime source
bootstrap. That layout is ineligible for the selected Palomar verifier. The
Git-only layout must pass complete compilation and exact-commit preflight;
source provenance alone does not establish either result.

Iwaniec's 1978 article was screened through the available publisher-provided
transcription. The primary eight-page PDF was not obtained, and the transcription
omits critical displayed formulas. No full-paper reading or independent audit of
its complete proof is claimed; it is not an input to the formal proof here.
