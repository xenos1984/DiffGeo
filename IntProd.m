BeginPackage["DiffGeo`"];
Begin["`Private`"];

Format[IntProd[x_, y__]] := Fold[Prefix[{#1}, Subscript["\[Iota]", #2]]&, x, {y}];

IntProd::noform = "The first argument of IntProd must be a differential form, `1` is not a differential form.";

IntProd::novect = "All but the first argument of IntProd must be vector fields, `1` are not vector fields.";

IntProd[x_ /; Not[FormQ[x]], y___] := Message[IntProd::noform, x];

IntProd[x_, y__ /; Nand @@ (VectQ /@ {y})] := Message[IntProd::novect, Select[{y}, Not[VectQ[#]]&]];

IntProd[x_ /; FormQ[x], y__ /; And @@ (VectQ /@ {y})] /; (Length[Union[Domain /@ {x, y}]] > 1) := Message[DiffGeo::diffmf, IntProd];

IntProd[x_ /; FormQ[x]] := x;

IntProd[x_Plus /; FormQ[x], y__ /; And @@ (VectQ /@ {y})] := IntProd[#, y]& /@ x;

IntProd[Times[x_ /; ConstQ[x], y_ /; FormQ[y]], z__ /; And @@ (VectQ /@ {z})] := x * IntProd[y, z];

IntProd[Times[x_ /; ScalQ[x], y_ /; FormQ[y]], z__ /; And @@ (VectQ /@ {z})] := x * IntProd[y, z];

IntProd[a_ /; FormQ[a], b___ /; And @@ (VectQ /@ {b}), c_Plus /; VectQ[c], d___ /; And @@ (VectQ /@ {d})] := IntProd[a, b, #, d]& /@ c;

IntProd[a_ /; FormQ[a], b___ /; And @@ (VectQ /@ {b}), Times[c_ /; ConstQ[c], d_ /; VectQ[d]], e___ /; And @@ (VectQ /@ {e})] := c * IntProd[a, b, d, e];

IntProd[a_ /; FormQ[a], b___ /; And @@ (VectQ /@ {b}), Times[c_ /; ScalQ[c], d_ /; VectQ[d]], e___ /; And @@ (VectQ /@ {e})] := c * IntProd[a, b, d, e];

IntProd[x_ /; FormQ[x], a___ /; And @@ (VectQ /@ {a}), b_ /; VectQ[b], c_ /; VectQ[c], d___ /; And @@ (VectQ /@ {d})] /; Not[OrderedQ[{b, c}]] := -IntProd[x, a, c, b, d];

IntProd[x_ /; FormQ[x], a___ /; And @@ (VectQ /@ {a}), b_ /; VectQ[b], c___ /; And @@ (VectQ /@ {c}), b_ /; VectQ[b], d___ /; And @@ (VectQ /@ {d})] /; VectQ[b] := 0;

IntProd[a_ /; FormQ[a], b___ /; And @@ (VectQ /@ {b}), 0, c___ /; And @@ (VectQ /@ {c})] := 0;

IntProd[x_IntProd, y__ /; And @@ (VectQ /@ {y})] := IntProd[Sequence @@ x, y];

IntProd[x_ExtProd, y__ /; And @@ (VectQ /@ {y})] := Module[{i, j, a, b, c, l, f, r, x2, y2},
	x2 = List @@ x;
	y2 = {y};
	l = Length[x2];
	f = First[y2];
	r = Drop[y2, 1];
	Sum[
		a = Take[x2, i - 1];
		b = x2[[i]];
		c = Drop[x2, i];
		(Times @@ (((-1)^(Rank[#][[2]]))& /@ a)) * IntProd[ExtProd @@ Join[a, {IntProd[b, f]}, c], Sequence @@ r],
	{i, l}]
];

IntProd[x_ /; ScalQ[x], y__ /; And @@ (VectQ /@ {0})] := 0;

End[];
EndPackage[];
