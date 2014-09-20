BeginPackage["DiffGeo`"];
Begin["`Private`"];

DefTens[x_, m_, r_, s_] := DefSection[x, TensProdBundle[TensPowBundle[TangentBundle[m], r], TensPowBundle[CotangentBundle[m], s]]];

End[];
EndPackage[];
