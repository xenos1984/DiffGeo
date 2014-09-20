BeginPackage["DiffGeo`"];
Begin["`Private`"];

Format[LieDer[x_, y__]] := Fold[Prefix[{#1}, Subscript["\[ScriptCapitalL]", #2]]&, x, {y}];

LieDer::notens = "The first argument of LieDer must be a tensor, `1` is not a tensor.";

LieDer::novect = "All but the first argument of LieDer must be vector fields, `1` are not vector fields.";

LieDer[x_ /; Not[TensQ[x]], y__] := Message[LieDer::notens, x];

LieDer[x_, y__ /; Nand @@ (VectQ /@ {y})] := Message[LieDer::novect, Select[{y}, Not[VectQ[#]]&]];

LieDer[LieDer[x_, y__], z__/; And @@ (VectQ /@ {z})] := LieDer[x, y, z];

LieDer[x_ /; TensQ[x]] := x;

LieDer[x_Plus /; TensQ[x], y__ /; And @@ (VectQ /@ {y})] := LieDer[#, y]& /@ x;

LieDer[Times[x_ /; ScalQ[x], y_ /; TensQ[y]], z__ /; And @@ (VectQ /@ {z})] := LieDer[x, z] * y + x * LieDer[y, z];

LieDer[a_ /; TensQ[a], b___ /; And @@ (VectQ /@ {b}), c_Plus /; VectQ[c], d___ /; And @@ (VectQ /@ {d})] := LieDer[a, b, #, d]& /@ c;

LieDer[fkt:(ExtProd|TensProd)[x__], y__ /; And @@ (VectQ /@ {y})] := Module[{i, j, a, b, c, l, f, r},
	l = Length[{x}];
	f = First[{y}];
	r = Drop[{y}, 1];
	Sum[
		a = Take[{x}, i - 1];
		b = {x}[[i]];
		c = Drop[{x}, i];
		LieDer[fkt @@ Join[a, {LieDer[b, f]}, c], Sequence @@ r],
	{i, l}]
];

LieDer[x_ /; ScalQ[x], y__ /; And @@ (VectQ /@ {y})] := LieDer[IntProd[ExtDer[x], First[{y}]], Sequence @@ Drop[{y}, 1]];

End[];
EndPackage[];
