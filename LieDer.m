BeginPackage["DiffGeo`"];
Begin["`Private`"];

Format[LieDer[x_, y__]] := Fold[Prefix[{#1}, Subscript["\[ScriptCapitalL]", #2]]&, x, {y}];

LieDer::notens = "The first argument of LieDer must be a tensor, `1` is not a tensor.";

LieDer::novect = "All but the first argument of LieDer must be vector fields, `1` are not vector fields.";

LieDer[] := Throw[Message[LieDer::argm, LieDer, 0, 1]];

LieDer[x_ /; Not[TensQ[x]], y__] := Throw[Message[LieDer::notens, x]];

LieDer[x_, y__ /; Nand @@ (VectQ /@ {y})] := Throw[Message[LieDer::novect, Select[{y}, Not[VectQ[#]]&]]];

LieDer[x_ /; TensQ[x], y__ /; And @@ (VectQ /@ {y})] /; (Length[Union[Domain /@ {x, y}]] > 1) := Throw[Message[DiffGeo::diffmf, LieDer]];

LieDer[x_ /; TensQ[x]] := x;

LieDer[x_Plus /; TensQ[x], y__ /; And @@ (VectQ /@ {y})] := LieDer[#, y]& /@ x;

LieDer[Times[x_ /; ConstQ[x], y_ /; TensQ[y]], z__ /; And @@ (VectQ /@ {z})] := x * LieDer[y, z];

LieDer[Times[x_ /; ScalQ[x], y_ /; TensQ[y]], z__ /; And @@ (VectQ /@ {z})] := LieDer[x, z] * y + x * LieDer[y, z];

LieDer[a_ /; TensQ[a], b___ /; And @@ (VectQ /@ {b}), c_Plus /; VectQ[c], d___ /; And @@ (VectQ /@ {d})] := LieDer[a, b, #, d]& /@ c;

LieDer[a_ /; TensQ[a], b___ /; And @@ (VectQ /@ {b}), Times[c_ /; ConstQ[c], d_ /; VectQ[d]], e___ /; And @@ (VectQ /@ {e})] := c * LieDer[a, b, d, e];

LieDer[a_ /; TensQ[a], b___ /; And @@ (VectQ /@ {b}), 0, c___ /; And @@ (VectQ /@ {c})] := 0;

LieDer[x_LieDer, y__ /; And @@ (VectQ /@ {y})] := LieDer[Sequence @@ x, y];

LieDer[x:(_ExtProd|_TensProd), y__ /; And @@ (VectQ /@ {y})] := Module[{i, a, b, c, l, f, r, fkt, x2, y2},
	fkt = Head[x];
	x2 = List @@ x;
	y2 = {y};
	l = Length[x2];
	f = First[y2];
	r = Drop[y2, 1];
	Sum[
		a = Take[x2, i - 1];
		b = x2[[i]];
		c = Drop[x2, i];
		LieDer[fkt @@ Join[a, {LieDer[b, f]}, c], Sequence @@ r],
	{i, l}]
];

LieDer[x_ /; ScalQ[x], y_ /; VectQ[y], z___ /; And @@ (VectQ /@ {z})] := LieDer[IntProd[ExtDer[x], y], z];

LieDer[x_ /; VectQ[x], y_ /; VectQ[y], z___ /; And @@ (VectQ /@ {z})] := LieDer[LieBr[y, x], z];

LieDer[x_ /; FormQ[x], Times[f_ /; ScalQ[f], y_ /; VectQ[y]], z___ /; And @@ (VectQ /@ {z})] := LieDer[f * LieDer[x, y] + ExtProd[ExtDer[f], IntProd[x, y]], z];

End[];
EndPackage[];
