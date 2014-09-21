BeginPackage["DiffGeo`"];
Begin["`Private`"];

Format[ExtProd[x__]] := Infix[{x}, "\[Wedge]"];

ExtProd::noform = "ExtProd works only on differential forms, `1` are not differential forms.";

ExtProd[] := Throw[Message[General::argm, ExtProd, 0, 1]];

ExtProd[x__ /; Nand @@ (FormQ /@ {x})] := Throw[Message[ExtProd::noform, Select[{x}, Not[FormQ[#]]&]]];

ExtProd[x__ /; And[And @@ (FormQ /@ {x}), Length[Union[Domain /@ {x}]] > 1]] := Throw[Message[DiffGeo::diffmf, ExtProd]];

ExtProd[x_ /; FormQ[x]] := x;

ExtProd[x___ /; And @@ (FormQ /@ {x}), y_ExtProd, z___ /; And @@ (FormQ /@ {z})] := ExtProd[x, Sequence @@ y, z];

ExtProd[a___ /; And @@ (FormQ /@ {a}), b_ /; FormQ[b], c_ /; FormQ[c], d___ /; And @@ (FormQ /@ {d})] /; Not[OrderedQ[{b, c}]] := (-1)^(Rank[b][[2]] * Rank[c][[2]]) * ExtProd[a, c, b, d];

ExtProd[a___ /; And @@ (FormQ /@ {a}), b_, c___ /; And @@ (FormQ /@ {c}), b_, d___ /; And @@ (FormQ /@ {d})] /; And[FormQ[b], OddQ[Rank[b][[2]]]] := 0;

ExtProd[x___ /; And @@ (FormQ /@ {x}), y_ /; ConstQ[y], z___ /; And @@ (FormQ /@ {z})] := y * ExtProd[x, z];

ExtProd[a___ /; And @@ (FormQ /@ {a}), Times[b_ /; ConstQ[b], c_ /; FormQ[c]], d___ /; And @@ (FormQ /@ {d})] := b * ExtProd[a, c, d];

ExtProd[x___ /; And @@ (FormQ /@ {x}), y_ /; ScalQ[y], z___ /; And @@ (FormQ /@ {z})] := y * ExtProd[x, z];

ExtProd[a___ /; And @@ (FormQ /@ {a}), Times[b_ /; ScalQ[b], c_ /; FormQ[c]], d___ /; And @@ (FormQ /@ {d})] := b * ExtProd[a, c, d];

ExtProd[x___ /; And @@ (FormQ /@ {x}), y_Plus /; FormQ[y], z___ /; And @@ (FormQ /@ {z})] := ExtProd[x, #, z]& /@ y;

End[];
EndPackage[];
