BeginPackage["DiffGeo`"];
Begin["`Private`"];

SectionQ[Times[x_ /; ConstQ[x], y_ /; And[SectionQ[y], VectBundleQ[Bundle[y]]]]] := True;

SectionQ[Times[x_ /; ScalQ[x], y_ /; And[SectionQ[y], VectBundleQ[Bundle[y]]]]] := (Domain[x] === Domain[y]);

SectionQ[x_Plus] := And[And @@ (SectionQ /@ (List @@ x)), Length[Union[Bundle /@ (List @@ x)]] === 1, VectBundleQ[Bundle[First[(List @@ x)]]]];

SectionQ[x_TensProd] := True;

SectionQ[x_IntProd] := True;

SectionQ[x_ExtProd] := True;

SectionQ[x_ExtDer] := True;

SectionQ[x_LieDer] := True;

SectionQ[x_LieBr] := True;

End[];
EndPackage[];
