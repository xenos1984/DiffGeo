BeginPackage["DiffGeo`"];
Begin["`Private`"];

DefScal[x_, m_] := (MappingQ[x] ^= True; Domain[x] ^= m; Codomain[x] ^= Reals; x);

End[];
EndPackage[];
