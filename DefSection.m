BeginPackage["DiffGeo`"];
Begin["`Private`"];

DefSection[x_, b_ /; BundleQ[b]] := (SectionQ[x] ^= True; Bundle[x] ^= b; x);

End[];
EndPackage[];
