BeginPackage["DiffGeo`"];
Begin["`Private`"];

BundleQ[_TangentBundle] := True;

BundleQ[_CotangentBundle] := True;

BundleQ[_ExtPowBundle] := True;

BundleQ[_TensPowBundle] := True;

BundleQ[_TensProdBundle] := True;

End[];
EndPackage[];
