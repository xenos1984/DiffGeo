BeginPackage["DiffGeo`"];
Begin["`Private`"];

DefManifold[x_] := (ManifoldQ[x] ^= True; x);

End[];
EndPackage[];
