# Golden Quadruple — R3 documentation/licensing review draft
Author: Michał Przybylski. Small computational companion, not a paclet.
Sources: https://arxiv.org/abs/2611.00973v2 ; https://zenodo.org/records/23919863

## Status and license
Author-approved MIT applies ONLY to new .wl/.wlt and notebook executable code;
see LICENSE and LICENSE-STATUS.txt (2026-11-07, Europe/Warsaw). Paper remains
under its own CC BY 4.0; prose and third-party material are not relicensed.
R3 executable code is unchanged from R2; R3 has not been newly executed.
See CODE-UNCHANGED.txt, CODEX_REVIEW.md and CHECK-NOTEBOOK.md. No publication
is authorized by this working-package update.

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

## Run from the project directory
Open a terminal in the extracted project folder (Windows PowerShell or Linux shell). Confirm a REAL kernel starts, not just that an executable exists:

    wolframscript -code 'Print[{$Version,$SystemID}]; Print[1+1]'

Expected arithmetic is 2, but no result is claimed here. If startup/licensing fails, stop and report it; do not bypass licensing. Requires wolframscript on PATH and a suitable licensed environment.

Both Windows PowerShell and Linux, from the project folder:

    wolframscript -file ./GoldenQuadruple.wl

This prints tables, symbolic checks and TestReport; exports cosine-illustration.png into the project folder. Inspect all messages, report and plot. A zero process status alone is insufficient.

For just definitions followed by tests, in a Wolfram kernel/notebook whose Directory[] is the project folder:

    Block[{$GoldenQuadrupleDefinitionsOnly=True}, Get["GoldenQuadruple.wl"]];
    TestReport[FileNameJoin[{Directory[],"Tests","GoldenQuadruple.wlt"}]]

The WLT expects definitions already loaded; it does not load itself or run the script recursively. Definitions-only still constructs the plot/numerical illustration.

Save/open GoldenQuadruple.nb next to the WL and Tests folder; evaluate all cells in order. Input cells contain ToExpression of literal source strings, also available readably in WL. No output cells are provided. Notebook runner reloads the same WL file.

For remaining graphical notebook verification, follow CHECK-NOTEBOOK.md.
Do not treat direct kernel evaluation of notebook code as a full front-end
pass. If a usable licensed graphical front end is unavailable, report that
blocker rather than retrying headless front-end operations.

## Mathematical scope
T1 / Example 7.1: exact points, numerical-order comparator on exact differences, multiplicities. Prop.5.3: finite exact checks n=2..40, not a universal proof. Definition2.10/Prop6.2: six-pair sum and symbolic identity. Numerical-only: finite 50-digit grid. No Lean coverage or full general proof claim.
For u=1, tau8=Fib[8]=21 and 21 phi=34-phi^-8; a finite shifted plot is not proof of almost periodicity or a global supremum.
