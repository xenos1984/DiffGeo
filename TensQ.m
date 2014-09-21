BeginPackage["DiffGeo`"];
Begin["`Private`"];

tbundleq[_TangentBundle] := True;

tbundleq[_CotangentBundle] := True;

tbundleq[x_TensProdBundle /; And @@ (tbundleq /@ (List @@ x))] := True;

tbundleq[x_TensPowBundle /; tbundleq[First[x]]] := True;

tbundleq[x_ExtPowBundle /; tbundleq[First[x]]] := True;

tbundleq[x_SymPowBundle /; tbundleq[First[x]]] := True;

TensQ[x_] := Or[x === 0, ScalQ[x], And[SectionQ[x], tbundleq[Bundle[x]]]];

End[];
EndPackage[];
