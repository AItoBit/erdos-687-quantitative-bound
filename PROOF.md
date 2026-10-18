# Known quantitative bound: mathematical argument

Let P(x) be the product of the primes p <= x. A residue covering of [1,y] consists of one class a_p modulo each such prime, with every integer in [1,y] in at least one selected class. Let Y(x) be the largest such y. The near-linear question in Erdos 687 remains open; the argument below proves the known upper bound only.

## Proved analytic input

The closed quadratic Jacobsthal theorem of OpenAI states that there is an absolute C>0 such that, for every integer k>0, some natural M<=C k^2 has the following property: for every positive integer n with at most k distinct prime factors and every integer a, there is i in {0,...,M-1} with gcd(|a+i|,n)=1. This input is a substantial proved theorem, not an elementary assumption that this project has independently established. Its source is *A quadratic bound for Jacobsthal's function*, September 25, 2026, theorem 1.1; its formal target is `OAI.Erdos970.Erdos970Final.erdos_970_quadratic`.

Source: https://github.com/openai/math/tree/1581d4cbdd69a0faf34b2089614fe2a814316a6a . The dependency port must compile before the external Lean development can claim a closed instance of this input.

## The finite CRT bridge

For a covering, the Chinese remainder theorem gives t modulo P(x) with t congruent to a_p modulo p for every prime p<=x. For each covered m, a prime p<=x divides m-t, so gcd(|m-t|,P(x))>1. Conversely, if this noncoprimality holds for every m in [1,y], a common prime divisor p of |m-t| and P(x) is at most x and shows that m belongs to the selected class t modulo p. This proves the exact equivalence formalized by `covered_iff_shift`, including negative differences and y=0.

Suppose every integer interval of lengthM contains an integer coprime toP(x). If a covering had y>=M, apply this property at the integer a=1-t. It gives 0<=i<M with |1-t+i| coprime toP(x). The integer m=i+1 lies in [1,M] and hence in [1,y], contradicting the covering property. Thus every cover length is <M, and its natural supremum Y(x) is <=M. This is `cover_lt_interval_bound` followed by `Y_le_interval_bound`.

## Prime counting and the quantitative estimate

For x>=2 set k=pi(x)>0. The positive integer P(x) has exactly pi(x) distinct prime factors. Applying the quadratic input to this k and n=P(x), then the finite bridge, gives

    Y(x) <= M <= C*pi(x)^2.

Chebyshev's estimate gives an absolute A>0 with pi(x)<=A*x/log x for all sufficiently large natural x. The implementation uses A=log4+1 and Mathlib's eventual upper bound. Squaring this nonnegative inequality yields

    Y(x) <= C*A^2*(x/log x)^2.

The constants are independent of the residue classes and x. This is the asserted Big-O bound. As log x tends to infinity, it also implies Y(x)=o(x^2). It does not give Y(x)=O(x^(1+epsilon)) for every positive epsilon, nor an asymptotically matching lower bound.

The generic Lean transfer has an explicit hypothesis for the quadratic input; until it is instantiated with the actual closed imported theorem, it must be described as conditional. Compiler status and axiom checks are separate from this mathematical argument.
