BeginPackage["DiffGeo`"];
Begin["`Private`"];

brank[_TangentBundle] := {1, 0};

brank[_CotangentBundle] := {0, 1};

brank[x_ExtPowBundle] := brank[x[[1]]] * x[[2]];

brank[x_SymPowBundle] := brank[x[[1]]] * x[[2]];

brank[x_TensPowBundle] := brank[x[[1]]] * x[[2]];

brank[x_TensProdBundle] := Plus @@ (brank /@ (List @@ x));

Rank::notens = "`1` is not a tensor field.";

Rank[x_ /; Not[FormQ[x]]] := Message[Rank::notens, x];

Rank[x_ /; And[FormQ[x], Not[ScalQ[x]]]] := brank[Bundle[x]];

Rank[x_ /; ScalQ[x]] := {0, 0};

End[];
EndPackage[];
