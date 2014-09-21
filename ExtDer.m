BeginPackage["DiffGeo`"];
Begin["`Private`"];

Format[ExtDer[x_]] := Prefix[{x}, "\[DifferentialD]"];

ExtDer::noform = "ExtDer works only on differential forms, `1` is not a differential form.";

ExtDer[x_ /; Not[FormQ[x]]] := Throw[Message[ExtDer::noform, x]];

ExtDer[x_Plus /; FormQ[x]] := ExtDer /@ x;

ExtDer[Times[x_ /; ConstQ[x], y_ /; FormQ[y]]] := x * ExtDer[y];

ExtDer[Times[x_ /; ScalQ[x], y_ /; FormQ[y]]] := ExtProd[ExtDer[x], y] + x * ExtDer[y];

ExtDer[x_ExtProd] := Module[{i, a, b, c, l, x2},
	x2 = List @@ x;
	l = Length[x];
	Sum[
		a = Take[x2, i - 1];
		b = x2[[i]];
		c = Drop[x2, i];
		(Times @@ (((-1)^(Rank[#][[2]]))& /@ a)) * (ExtProd @@ Join[a, {ExtDer[b]}, c]),
	{i, l}]
];

ExtDer[x_ExtDer] := 0;

ExtDer[x_ /; ConstQ[x]] := 0;

End[];
EndPackage[];
