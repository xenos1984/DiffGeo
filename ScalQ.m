BeginPackage["DiffGeo`"];
Begin["`Private`"];

ScalQ[x_] := And[MappingQ[x], Codomain[x] === Reals];

End[];
EndPackage[];
