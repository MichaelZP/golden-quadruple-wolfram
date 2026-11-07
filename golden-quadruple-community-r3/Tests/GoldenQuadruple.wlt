(* Author: Michał Przybylski. R2 unexecuted. Load GoldenQuadruple.wl first.
 Tests are not general mathematical or Lean proofs. *)
VerificationTest[FullSimplify[phi^2-phi-1],0,TestID->"phi-definition"]
VerificationTest[TrueQ[FullSimplify[f0>phi+phi^2]],True,TestID->"Example7.1-domain"]
VerificationTest[And@@(TrueQ[FullSimplify[#>0]]& /@ points),True,TestID->"Example7.1-positive"]
VerificationTest[FullSimplify[differences-expected],ConstantArray[0,6],TestID->"T1-six-differences"]
VerificationTest[multiplicities,{1,2,2,1},TestID->"T1-multiplicities"]
VerificationTest[And@@Table[With[{x=Fibonacci[n+1]/Fibonacci[n]},
 rhoMinus[x,1]==(-1)^n/Fibonacci[n]^2 &&
 rhoPlus[x,1]==(-1)^n Fibonacci[n+1]/Fibonacci[n]^3],{n,2,40}],
 True,TestID->"Prop5.3-finite-n2-to40"]
VerificationTest[pairCheck,0,TestID->"Definition2.10-six-pair-sum"]
VerificationTest[identityCheck,0,TestID->"Prop6.2-symbolic-identity"]
VerificationTest[cSum[1,0],6,TestID->"Prop6.2-origin"]
VerificationTest[TrueQ[numericalError<10^-35],True,TestID->"Numerical-only-finite-grid"]

VerificationTest[fibonacciShiftCheck,0,TestID->"tau8-exact-sign"]
(* Recompute, do not test cached zeros. Block deliberately contaminates globals;
 Module inside symbolicChecks must still check general symbolic identities. *)
VerificationTest[Block[{u=2,t=0},symbolicChecks[]],{0,0},
 TestID->"Symbolic-recompute-with-global-u2-t0"]
