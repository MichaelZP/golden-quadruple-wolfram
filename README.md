# Golden Quadruple — Wolfram Language companion

Author: **Michał Przybylski**.

A small mathematical computational companion: exact golden quadruple differences,
Fibonacci closure residuals, and a six-pair cosine identity. The configuration
and its difference multiset are classical.

- [Paper, arXiv v2](https://arxiv.org/abs/2611.00973v2)
- [Paper and source archives, Zenodo v2](https://zenodo.org/records/23919863)
- [R3 release and exact ZIP](https://github.com/MichaelZP/golden-quadruple-wolfram/releases/tag/wolfram-companion-r3)
- [Companion files and instructions](golden-quadruple-community-r3/README.md)

MIT applies only to the new companion executable code, as scoped in the
[LICENSE](golden-quadruple-community-r3/LICENSE). The paper retains its own
CC BY 4.0; prose and third-party material are not relicensed.

R3 is documentation/licensing-only; executable code is unchanged from R2.
According to the user-provided Codex review report, R2 runner and independent
TestReport passed 12/12 both fresh and with u=2;t=0 in Wolfram 15.0.1 on Linux.
These reported results are not new execution or independent reproduction here.
Full graphical .nb validation has not passed; NotebookDirectory[] failed in
headless evaluation without an evaluation-notebook context. See the package
review and notebook-check documents. Tests are not substitutes for proofs.

The archived Community text is a draft, not a claim that a Wolfram Community
post has been published. No Wolfram endorsement is implied.

## Post-R3 notebook display correction — 2026-11-07 (Europe/Warsaw)
Current main removes terminal semicolons in the first three notebook Input
cells, displaying results instead of Null. ToExpression and NotebookDirectory[]
runner dependency remain unchanged. WL/WLT mathematics and LICENSE are unchanged.
Historical R3 tag/release/ZIP remain untouched. User reports GUI success;
complete GUI evaluation both fresh and u=2;t=0 remains unconfirmed.
Supplied 12/12 kernel-test reports are not independent execution here.
This maintenance fix received static review only, no Wolfram/GUI execution.

## R3.1 documentation follow-up: author-reported manual GUI validation
On 2026-11-07 (Europe/Warsaw), the author reported evaluating the complete
saved notebook in the graphical interface in two runs: first after Quit[],
then after Quit[] followed by u=2;t=0;. For the fresh run he reported the
plot and outputs for each evaluation; for the contaminated run he reported
the plot and no red messages. Both full runs were reported successful, with
no reported errors. This is author-reported manual GUI validation, not an
independent GUI execution by the preparer. Raw logs and a kernel-version
screenshot were not supplied. This does not constitute a new 12/12 test run
or change the provenance of earlier Codex kernel results.
This follow-up updates documentation/release notes only. R3 and R3.1 tags,
ZIP assets and executable code remain unchanged. Their bundled documents
retain the earlier validation status as historical records.
