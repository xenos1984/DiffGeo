BeginPackage["DiffGeo`"];
Begin["`Private`"];

DefSection[x_Symbol, b_ /; BundleQ[b]] := (SectionQ[x] ^= True; Bundle[x] ^= b; DefMapping[x, BaseSpace[b], TotalSpace[b]]);

End[];
EndPackage[];
