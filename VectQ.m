BeginPackage["DiffGeo`"];
Begin["`Private`"];

VectQ[x_] := Or[x === 0, And[SectionQ[x], Bundle[x] === TangentBundle[Domain[x]]]];

End[];
EndPackage[];
