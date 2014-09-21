BeginPackage["DiffGeo`"];
Begin["`Private`"];

DefManifold[x_Symbol] := (ManifoldQ[x] ^= True; x);

End[];
EndPackage[];
