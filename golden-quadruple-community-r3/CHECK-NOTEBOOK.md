# Actual graphical notebook check — R3
Author: Michał Przybylski. Working graphical Wolfram access is not established.

1. Unzip the whole package with .nb, .wl and Tests/ sidecars together in the
   same project directory. Use a suitable licensed Mathematica installation.
2. Open the saved GoldenQuadruple.nb in Mathematica (not merely Get of input
   strings). Start a fresh kernel. In a separate scratch cell record
   {$Version,$SystemID}, and evaluate NotebookDirectory[] from this actual
   notebook. Confirm the returned directory contains the WL and Tests files.
3. Evaluate ALL six supplied Input cells in order in the real notebook.
   Inspect every message/result, the runner's real TestReport (12 tests),
   and generated cosine-illustration.png. Review any failure independently;
   no assumed pass based on earlier kernel reports.
4. Start a new fresh kernel, then set u=2;t=0 in a scratch cell BEFORE running
   supplied cells. Do not restart/reinitialize the kernel afterward (that
   would erase contamination). Evaluate all six cells in order. Confirm
   symbolicChecks[] recomputes {0,0} and {u,t} still equals {2,0}. Check actual
   notebook directory, runner, TestReport and plot again.
5. Record version, SystemID, report counts, messages, exact cells evaluated
   and any blockers. Keep evaluated review copies/results separately.
   No automatic edits or publishing. A front-end blocker must remain explicit;
   headless NotebookDirectory[] failure is not proof of GUI behavior.
