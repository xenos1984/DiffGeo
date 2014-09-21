BeginPackage["DiffGeo`"];
Begin["`Private`"];

ScalQ[x_] := Or[x === 0, And[MappingQ[x], Codomain[x] === Reals]];

End[];
EndPackage[];
