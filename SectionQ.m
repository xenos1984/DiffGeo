BeginPackage["DiffGeo`"];
Begin["`Private`"];

SectionQ[Times[x_ /; ConstQ[x], y_ /; And[SectionQ[y], VectBundleQ[Bundle[y]]]]] := True;

SectionQ[Times[x_ /; ScalQ[x], y_ /; And[SectionQ[y], VectBundleQ[Bundle[y]]]]] := (Domain[x] === Domain[y]);

SectionQ[x_Plus] := And[And @@ (SectionQ /@ (List @@ x)), Length[Union[Bundle /@ (List @@ x)]] === 1, VectBundleQ[Bundle[First[(List @@ x)]]]];

SectionQ[_TensProd] := True;

SectionQ[_IntProd] := True;

SectionQ[_ExtProd] := True;

SectionQ[_ExtDer] := True;

SectionQ[_LieDer] := True;

SectionQ[_LieBr] := True;

End[];
EndPackage[];
