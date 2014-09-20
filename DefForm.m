BeginPackage["DiffGeo`"];
Begin["`Private`"];

DefForm[x_, m_, p_] := DefSection[x, ExtPowBundle[CotangentBundle[m], p]];

End[];
EndPackage[];
