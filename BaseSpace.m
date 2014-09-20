BeginPackage["DiffGeo`"];
Begin["`Private`"];

BaseSpace[x_TangentBundle] := First[x];

BaseSpace[x_CotangentBundle] := First[x];

BaseSpace[x_ExtPowBundle] := BaseSpace[First[x]];

BaseSpace[x_TensPowBundle] := BaseSpace[First[x]];

End[];
EndPackage[];
