# The Golden Quadruple: Exact Differences and a Cosine Identity in Wolfram Language

**Author: Michał Przybylski**

**Private R3 review draft — not publication-ready: R3 has not been newly executed; user-provided Codex reports validate R2 kernel checks but not the full graphical notebook.**

I present a small computational companion to my preprint *The Golden Quadruple: Four Reals Whose Differences Form a Geometric Progression, Rigidity of the Golden Ratio, and a Bohr Almost Periodic Cosine Sum*:

- [arXiv, version 2](https://arxiv.org/abs/2611.00973v2)
- [Zenodo, version 2, DOI 10.5281/zenodo.23919863](https://zenodo.org/records/23919863) — CC BY 4.0 record, including paper and source archives.

The four-point configuration and its difference multiset are classical; I do not claim them as a new discovery. This companion covers three elementary computations, not the entire preprint.

## 1. Six differences, four distinct values

Let φ=(1+√5)/2, u>0, a=φu, b=φ²u and F>a+b. For S=(F,F−a,F−b,F−a−b), the six positive pair differences are u,φu,φu,φ²u,φ²u,φ³u, with multiplicities 1,2,2,1 (Theorem 1). I use the exact example u=1 and F=φ⁴ (Example 7.1):

```wl
phi = (1 + Sqrt[5])/2;
s = FullSimplify[{phi^4, phi^4-phi, phi^4-phi^2,
                  phi^4-phi-phi^2}];
d = Sort[FullSimplify[Abs[Subtract @@ #]] & /@ Subsets[s, {2}],
         TrueQ[FullSimplify[#1 < #2]] &];
counts = Table[Count[d, z_ /; TrueQ[FullSimplify[z-v] == 0]],
               {v, {1, phi, phi^2, phi^3}}];
```

## 2. Fibonacci closure residuals

For real x>1 and u>0, let ρ₋(x)=(x²−x−1)u and ρ₊(x)=xρ₋(x). For integer n≥2, xₙ=Fibₙ₊₁/Fibₙ satisfies

ρ₋(xₙ)=(-1)ⁿu/Fibₙ²,  ρ₊(xₙ)=(-1)ⁿFibₙ₊₁u/Fibₙ³.

The companion computes an exact rational table and finite checks of Proposition 5.3. These checks are not a proof for all n or of the full rigidity theorem.

## 3. A cosine identity

For real t, define C_S(t)=Σ_{i<j}cos(2π(s_i−s_j)t), retaining all six pair differences. Proposition 6.2 gives

C_S(t)=cos(2πut)+2cos(2πφut)+2cos(2πφ²ut)+cos(2πφ³ut)
=8cos²(πat)cos²(πbt)−2.

The companion requests a symbolic identity check and illustrates C_S(t) and C_S(t+21) for u=1 on a finite interval. Here tau₈=Fib₈/u=21 and 21φ=34−φ⁻⁸, fixing the sign and index of the shift. A plot does not prove almost periodicity or a global supremum.

## Companion and validation

Attachments: `GoldenQuadruple.nb`, `GoldenQuadruple.wl`, and `Tests/GoldenQuadruple.wlt`. This is a small standalone companion, not a full paclet. Tests do not replace mathematical proofs or Lean verification. No independent verification by this preparer, full graphical notebook validation, repository acceptance, or Wolfram endorsement is claimed.

**AI disclosure:** Grok Bot assisted with this draft and code using the brief “exact golden quadruple example; Fibonacci closure residuals for n≥2; cosine identity and a numerical illustration; explicit assumptions; no fabricated output.” Sources are linked above. Selected algebraic identities were independently checked in Python/SymPy, not Wolfram Language. R2 kernel test results are attributed below solely to the user-provided Codex report. The full saved notebook still requires review in a working licensed graphical Wolfram front end before submission. The author must approve the final text and update this validation statement accurately.

### Revision, license and validation provenance
I approved MIT for the new companion code on 2026-11-07 (Europe/Warsaw): the
.wl/.wlt files and executable notebook code only, as scoped in LICENSE.
This does not relicense my paper/preprint (its own CC BY 4.0), third-party
material, or this package's prose. R3 changes only licensing/documentation.

## User-provided second Codex report — 2026-11-07 (Europe/Warsaw)
These are reported results, NOT independently reproduced by this preparer.
R2 actual kernel reported: Wolfram 15.0.1, Linux x86 64bit, July 2 2026;
$SystemID: Linux-x86-64. Runner via Get: 12/12; independent TestReport: 12/12,
both fresh and with u=2;t=0, with no ActualMessages. symbolicChecks[] returned
{0,0}, preserving u,t. Negative controls (mutated differences and phi=2)
returned nonzero results. Runner PNG reported as 928x475.
Of six notebook Input cells evaluated directly in the kernel, 1–4 and 6
passed; cell 5 failed because NotebookDirectory[] returned $Failed outside an
evaluation-notebook context, followed by Get::stream. This is not full
notebook success. NotebookEvaluate remained unresolved; NotebookOpen returned
$Failed; UsingFrontEnd returned an internal-service error. Full graphical
front-end notebook validation has NOT passed.

R3 is documentation/licensing only. Its executable bytes are identical to R2,
but R3 itself has NOT been newly executed. No independent Wolfram execution
was performed here. Access to a working graphical Wolfram front end is not
established.
