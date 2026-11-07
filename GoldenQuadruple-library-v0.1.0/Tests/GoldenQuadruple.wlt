VerificationTest[Length[Names["GoldenQuadruple`*"]],6,TestID->"public-api"]

VerificationTest[Length[GoldenQuadruple`GoldenQuadruple[((1+Sqrt[5])/2)^4,1]],4,TestID->"quadruple-length"]

VerificationTest[And@@(TrueQ[FullSimplify[#>0]]& /@ GoldenQuadruple`GoldenQuadruple[((1+Sqrt[5])/2)^4,1]),True,TestID->"quadruple-positive"]

VerificationTest[Module[{p=(1+Sqrt[5])/2},FullSimplify[GoldenQuadruple`GoldenDifferences[1]-{1,p,p,p^2,p^2,p^3}]],ConstantArray[0,6],TestID->"six-differences"]

VerificationTest[Module[{q=GoldenQuadruple`GoldenQuadruple[10,2],d},d=FullSimplify[Abs[Subtract@@#]]& /@ Subsets[q,{2}];FullSimplify[Sort[d]-Sort[GoldenQuadruple`GoldenDifferences[2]]]],ConstantArray[0,6],TestID->"differences-from-quadruple"]

VerificationTest[Module[{s},FullSimplify[GoldenQuadruple`GoldenDifferences[s]-s GoldenQuadruple`GoldenDifferences[1]]],ConstantArray[0,6],TestID->"symbolic-scaling"]

VerificationTest[Last /@ GoldenQuadruple`GoldenMultiplicities[1],{1,2,2,1},TestID->"multiplicities"]

VerificationTest[FullSimplify[First /@ GoldenQuadruple`GoldenMultiplicities[2]-DeleteDuplicates[GoldenQuadruple`GoldenDifferences[2]]],ConstantArray[0,4],TestID->"multiplicity-values"]

VerificationTest[GoldenQuadruple`FibonacciClosureResiduals[8,1],{1/441,34/9261},TestID->"fibonacci-n8"]

VerificationTest[Module[{s},And@@Table[TrueQ[FullSimplify[GoldenQuadruple`FibonacciClosureResiduals[n,s]-{(-1)^n s/Fibonacci[n]^2,(-1)^n Fibonacci[n+1] s/Fibonacci[n]^3}]=={0,0}],{n,2,40}]],True,TestID->"fibonacci-n2-to40-symbolic-scale"]

VerificationTest[GoldenQuadruple`GoldenCosineSum[1,0],6,TestID->"cosine-origin"]

VerificationTest[Module[{s,tt},FullSimplify[TrigExpand[GoldenQuadruple`GoldenCosineSum[s,tt]-GoldenQuadruple`GoldenCosineClosedForm[s,tt]],Assumptions->Element[{s,tt},Reals]&&s>0]],0,TestID->"cosine-symbolic-identity"]

VerificationTest[Module[{tt,q=GoldenQuadruple`GoldenQuadruple[10,2],d},d=FullSimplify[Abs[Subtract@@#]]& /@ Subsets[q,{2}];FullSimplify[Total[Cos[2 Pi # tt]& /@ d]-GoldenQuadruple`GoldenCosineSum[2,tt],Assumptions->Element[tt,Reals]]],0,TestID->"six-pair-cosine-definition"]

VerificationTest[Module[{err},err=Max[Table[Abs[GoldenQuadruple`GoldenCosineSum[3/2,N[k/20,50]]-GoldenQuadruple`GoldenCosineClosedForm[3/2,N[k/20,50]]],{k,-200,200}]];TrueQ[err<10^-35]],True,TestID->"numerical-grid-401"]

VerificationTest[Module[{s,tt},FullSimplify[GoldenQuadruple`GoldenCosineSum[s,-tt]-GoldenQuadruple`GoldenCosineSum[s,tt]]],0,TestID->"cosine-even"]

VerificationTest[Module[{q1=GoldenQuadruple`GoldenQuadruple[10,2],q2=GoldenQuadruple`GoldenQuadruple[13,2]},FullSimplify[q2-q1]],{3,3,3,3},TestID->"translation"]
