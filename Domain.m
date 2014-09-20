BeginPackage["DiffGeo`"];
Begin["`Private`"];

Domain[x_BundleMap] := TotalSpace[First[x]];

Domain[x_ /; SectionQ[x]] := BaseSpace[Bundle[x]];

End[];
EndPackage[];
