BeginPackage["DiffGeo`"];
Begin["`Private`"];

ManifoldQ[_BaseSpace] := True;

ManifoldQ[_TotalSpace] := True;

ManifoldQ[Reals] = True;

End[];
EndPackage[];
