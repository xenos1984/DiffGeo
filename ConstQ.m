BeginPackage["DiffGeo`"];
Begin["`Private`"];

ConstQ[x_ /; NumericQ[x]] := True;

ConstQ[x_[y___ /; And @@ (ConstQ /@ {y})]] /; MemberQ[Attributes[x], NumericFunction] := True;

End[];
EndPackage[];
