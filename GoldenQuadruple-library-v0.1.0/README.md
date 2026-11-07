# GoldenQuadruple library v0.1.0
Author: Michał Przybylski. Library release v0.1.0.

Keep all files together. Open saved Start.nb in Mathematica and evaluate its
six Input cells in order. NotebookDirectory[] requires the actual notebook
context. For manual loading, use Get["/absolute/path/GoldenQuadruple.wl"].
RunTests.wl loads the package and returns TestReport; no package-load runner
or export is embedded in GoldenQuadruple.wl.

Public API (context GoldenQuadruple`): GoldenQuadruple[F,u],
GoldenDifferences[u], GoldenMultiplicities[u], FibonacciClosureResiduals[n,u],
GoldenCosineSum[u,t], GoldenCosineClosedForm[u,t]. Domains: real u>0;
F>phi^3 u; integer n>=2; real t. Domains are documented, not runtime-validated.
Classical configuration; finite tests do not substitute for mathematical proof.

Sources: https://arxiv.org/abs/2611.00973v2
https://zenodo.org/records/23919863

See RELEASE-NOTES.md and STATUS.txt for attributed plugin/desktop reports.
Original WYNIKI-SPRAWDZENIA.txt predates the author's later desktop report.
Historical stage-1 comments inside the preserved WL file are not current
validation claims. No new execution was performed during packaging.

Author-approved MIT covers new library code, Tests/*.wlt, RunTests.wl and executable Start.nb cells. Paper, third-party material and prose are excluded; see LICENSE.
