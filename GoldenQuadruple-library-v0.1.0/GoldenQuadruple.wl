(* Author: Michał Przybylski. MIT: see LICENSE.
   Stage 1 refactoring draft; not executed in Wolfram Language.
   Domains below are caller assumptions, not runtime argument validation. *)
BeginPackage["GoldenQuadruple`"];
GoldenQuadruple::usage="GoldenQuadruple[F,u] returns the ordered quadruple {F,F-phi u,F-phi^2 u,F-phi^3 u}, phi=(1+Sqrt[5])/2. Domain: real u>0 and real F>phi^3 u.";
GoldenDifferences::usage="GoldenDifferences[u] returns the six positive pair differences in exact increasing order, retaining repetitions. Domain: real u>0; independent of translation F.";
GoldenMultiplicities::usage="GoldenMultiplicities[u] returns {{difference,multiplicity},...} for the four exact difference values. Domain: real u>0.";
FibonacciClosureResiduals::usage="FibonacciClosureResiduals[n,u] returns {rhoMinus,rhoPlus} evaluated exactly at x=Fibonacci[n+1]/Fibonacci[n]. Domain: integer n>=2 and real u>0.";
GoldenCosineSum::usage="GoldenCosineSum[u,t] returns the six-pair cosine sum with multiplicities 1,2,2,1. Domain: real u>0 and real t.";
GoldenCosineClosedForm::usage="GoldenCosineClosedForm[u,t] returns 8 Cos[Pi phi u t]^2 Cos[Pi phi^2 u t]^2-2. Domain: real u>0 and real t.";
Begin["`Private`"];
phi=(1+Sqrt[5])/2;
GoldenQuadruple[ff_,scale_]:={ff,ff-phi scale,ff-phi^2 scale,ff-(phi+phi^2)scale};
(* Sort coefficients exactly first, then multiply by positive scale.
   This also handles symbolic scale without assuming a global value for u. *)
GoldenDifferences[scale_]:=Module[{q,ds},
 q={0,phi,phi^2,phi+phi^2};
 ds=FullSimplify[Abs[Subtract@@#]]& /@ Subsets[q,{2}];
 scale Sort[ds,TrueQ[FullSimplify[#1<#2]]&]
];
GoldenMultiplicities[scale_]:=Module[{ds,values,z,v},
 ds=GoldenDifferences[1];values={1,phi,phi^2,phi^3};
 Table[{scale v,Count[ds,z_ /; TrueQ[FullSimplify[z-v]==0]]},{v,values}]
];
FibonacciClosureResiduals[index_,scale_]:=Module[{xx},
 xx=Fibonacci[index+1]/Fibonacci[index];
 {FullSimplify[(xx^2-xx-1)scale],FullSimplify[xx (xx^2-xx-1)scale]}
];
GoldenCosineSum[scale_,time_]:=Total[Cos[2 Pi # time]& /@ GoldenDifferences[scale]];
GoldenCosineClosedForm[scale_,time_]:=8 Cos[Pi phi scale time]^2 Cos[Pi phi^2 scale time]^2-2;
End[];
EndPackage[];
