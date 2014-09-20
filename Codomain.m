BeginPackage["DiffGeo`"];
Begin["`Private`"];

Codomain[x_BundleMap] := BaseSpace[First[x]];

Codomain[x_ /; SectionQ[x]] := TotalSpace[Bundle[x]];

End[];
EndPackage[];
