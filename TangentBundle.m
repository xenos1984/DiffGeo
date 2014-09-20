BeginPackage["DiffGeo`"];
Begin["`Private`"];

Format[TangentBundle[x_]] := Infix[{Prefix[{x}, "\[DoubleStruckCapitalT]"], x}, "\[RightArrow]"];

TangentBundle::nomf = "";

TangentBundle[x_ /; Not[ManifoldQ[x]]] := Message[TangentBundle::nomf, x];

End[];
EndPackage[];
