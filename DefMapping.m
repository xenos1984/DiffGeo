BeginPackage["DiffGeo`"];
Begin["`Private`"];

DefMapping[x_Symbol, a_ /; ManifoldQ[a], b_ /; ManifoldQ[b]] := (MappingQ[x] ^= True; Domain[x] ^= a; Codomain[x] ^= b; x);

End[];
EndPackage[];
