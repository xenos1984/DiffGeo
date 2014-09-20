BeginPackage["DiffGeo`"];
Begin["`Private`"];

DefMapping[x_, a_, b_] := (MappingQ[x] ^= True; Domain[x] ^= a; Codomain[x] ^= b; x);

End[];
EndPackage[];
