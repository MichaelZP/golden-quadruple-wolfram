
## Post-R3 notebook display correction — 2026-11-07 (Europe/Warsaw)
Current main removes terminal semicolons in the first three notebook Input
cells, displaying results instead of Null. ToExpression and NotebookDirectory[]
runner dependency remain unchanged. WL/WLT mathematics and LICENSE are unchanged.
Historical R3 tag/release/ZIP remain untouched. User reports GUI success;
complete GUI evaluation both fresh and u=2;t=0 remains unconfirmed.
Supplied 12/12 kernel-test reports are not independent execution here.
This maintenance fix received static review only, no Wolfram/GUI execution.

# R3 — 2026-11-07 (Europe/Warsaw)
Documentation/licensing only. Author approved MIT for new executable code;
paper, third-party material and prose excluded from this grant. Added actual
front-end check instructions and user-provided second Codex review provenance.
WL/WLT bytes and all six notebook Input cells unchanged from R2. No new
Wolfram execution; no full GUI notebook validation; no publication changes.

# R2 — 2026-11-07 (Europe/Warsaw)
Original folder preserved. No publication changed or submitted.
- Sort now compares exact algebraic values using TrueQ[FullSimplify[#1<#2]]&; no SortBy[N].
- Count uses TrueQ[FullSimplify[z-v]==0].
- Symbolic identity recomputation uses Module-local variables; plot variable localized; explicit ClearAll for used companion globals, without clearing user u,t.
- Notebook regenerated from the same three WL sections; expression terminators explicit.
- Added exact tau8 sign/index and contaminated-session recomputation regressions.
- Clarified executable runner/WLT workflow, actual-kernel startup check, Windows/Linux commands, prior Codex provenance, pending new-code license and mandatory full R2 validation.
