BeginPackage["DiffGeo`"];
Begin["`Private`"];

DefTens[x_Symbol, r_ /; ConstQ[r], s_ /; ConstQ[s], m_ /; ManifoldQ[m]] := DefSection[x, TensProdBundle[TensPowBundle[TangentBundle[m], r], TensPowBundle[CotangentBundle[m], s]]];

End[];
EndPackage[];
