(* Author: Michał Przybylski. AI-assisted R2 draft: this revision UNEXECUTED in Wolfram Language.
 Sources: https://arxiv.org/abs/2611.00973v2 ; https://zenodo.org/records/23919863
 Classical configuration, not claimed as a new discovery. *)
ClearAll[phi, positiveDifferences, rhoMinus, rhoPlus, cSum, cClosed,
 u0,f0,points,differences,expected,multiplicities,residualTable,pairCheck,
 identityCheck,illustration,numericalError,symbolicChecks,fibonacciShiftCheck,
 root,report,s,z,v,x,n,uu,tt,k];
(* u and t deliberately remain untouched: all symbolic checks localize their variables. *)
phi=(1+Sqrt[5])/2;
(* Real u>0, F>(phi+phi^2)u. Concrete example u=1, F=phi^4. *)
u0=1; f0=phi^4;
points=FullSimplify[{f0,f0-phi,f0-phi^2,f0-phi-phi^2}];
(* One entry per unordered pair: do not remove duplicates. *)
positiveDifferences[s_List]:=FullSimplify[Abs[Subtract@@#]]& /@ Subsets[s,{2}];
differences=Sort[positiveDifferences[points], TrueQ[FullSimplify[#1 < #2]] &];
expected={1,phi,phi,phi^2,phi^2,phi^3};
multiplicities=Table[Count[differences,z_ /; TrueQ[FullSimplify[z-v] == 0]],{v,{1,phi,phi^2,phi^3}}];
{points,differences,multiplicities};

(* Real x>1, u>0; integer n>=2, Fib[0]=0, Fib[1]=1. *)
rhoMinus[x_,u_]:=(x^2-x-1)u;
rhoPlus[x_,u_]:=x (x^2-x-1)u;
residualTable=Table[With[{x=Fibonacci[n+1]/Fibonacci[n]},
 {n,x,rhoMinus[x,1],rhoPlus[x,1]}],{n,2,12}];
(* Exact claimed values: (-1)^n u/Fibonacci[n]^2 and
 (-1)^n Fibonacci[n+1]u/Fibonacci[n]^3. Finite checks are not proofs. *)
residualTable;

(* Real t; real u>0. Each of the SIX positive pair differences contributes. *)
cSum[uu_,tt_]:=Cos[2 Pi uu tt]+2 Cos[2 Pi phi uu tt]+
 2 Cos[2 Pi phi^2 uu tt]+Cos[2 Pi phi^3 uu tt];
cClosed[uu_,tt_]:=8 Cos[Pi phi uu tt]^2 Cos[Pi phi^2 uu tt]^2-2;
symbolicChecks[]:=Module[{uu,tt}, {
 FullSimplify[Total[Cos[2 Pi # tt]& /@ differences]-cSum[1,tt],
   Assumptions->Element[tt,Reals]],
 FullSimplify[TrigExpand[cSum[uu,tt]-cClosed[uu,tt]],
   Assumptions->Element[{uu,tt},Reals]&&uu>0]}];
{pairCheck,identityCheck}=symbolicChecks[];
(* tau_8=Fib[8]/u; for u=1, tau_8=21 and 21 phi=34-phi^-8.
   This follows from Fib[n+1]-phi Fib[n]=(-phi^-1)^n. *)
fibonacciShiftCheck=FullSimplify[21 phi-(34-phi^-8)];
(* Finite illustration only: not a proof of almost periodicity or a supremum. *)
illustration=Module[{tt}, Plot[Evaluate[{cSum[1,tt],cSum[1,tt+Fibonacci[8]]}],{tt,-10,10},
 WorkingPrecision->40,PlotPoints->120,MaxRecursion->4,PlotRange->{-2,6},
 PlotLegends->{"C_S(t)","C_S(t+21)"},AxesLabel->{"t","C_S"}]];
(* Evaluate arguments numerically first: independent floating-point evaluation. *)
numericalError=Max[Table[With[{tt=N[k/20,50]},
 Abs[cSum[1,tt]-cClosed[1,tt]]],{k,-200,200}]];
{pairCheck,identityCheck,numericalError};

If[!TrueQ[$GoldenQuadrupleDefinitionsOnly],
 root=DirectoryName[$InputFileName];
 Print["Exact points, differences, multiplicities: ",{points,differences,multiplicities}];
 Print["Fibonacci residuals (n,x,rhoMinus,rhoPlus): ",residualTable];
 Print["Pair identity, closed-form identity, numerical error: ",{pairCheck,identityCheck,numericalError}];
 report=TestReport[FileNameJoin[{root,"Tests","GoldenQuadruple.wlt"}]];
 Print[report];
 Export[FileNameJoin[{root,"cosine-illustration.png"}],illustration];
];
