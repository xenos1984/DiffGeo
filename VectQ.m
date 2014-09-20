BeginPackage["DiffGeo`"];
Begin["`Private`"];

VectQ[x_] := And[SectionQ[x], Bundle[x] === TangentBundle[Domain[x]]];

End[];
EndPackage[];
