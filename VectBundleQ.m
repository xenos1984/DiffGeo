BeginPackage["DiffGeo`"];
Begin["`Private`"];

VectBundleQ[_TangentBundle] := True;

VectBundleQ[_CotangentBundle] := True;

VectBundleQ[_ExtPowBundle] := True;

VectBundleQ[_TensPowBundle] := True;

VectBundleQ[_TensProdBundle] := True;

End[];
EndPackage[];
