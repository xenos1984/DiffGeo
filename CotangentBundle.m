BeginPackage["DiffGeo`"];
Begin["`Private`"];

Format[CotangentBundle[x_]] := Infix[{Prefix[{x}, "\!\(\[DoubleStruckCapitalT]\^\(*\)\)"], x}, "\[RightArrow]"];

CotangentBundle::nomf = "";

CotangentBundle[x_ /; Not[ManifoldQ[x]]] := Message[CotangentBundle::nomf, x];

End[];
EndPackage[];
