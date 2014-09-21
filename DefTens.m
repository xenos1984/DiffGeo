BeginPackage["DiffGeo`"];
Begin["`Private`"];

DefTens[x_, r_, s_, m_] := DefSection[x, TensProdBundle[TensPowBundle[TangentBundle[m], r], TensPowBundle[CotangentBundle[m], s]]];

End[];
EndPackage[];
