BeginPackage["DiffGeo`"];
Begin["`Private`"];

Format[TensProd[x__]] := Infix[{x}, "\[CircleTimes]"];

TensProd::notens = "TensProd works only on tensor fields, `1` are not tensor fields.";

TensProd[x__ /; Nand @@ (TensQ /@ {x})] := Throw[Message[TensProd::notens, Select[{x}, Not[TensQ[#]]&]]];

TensProd[x__ /; And[And @@ (TensQ /@ {x}), Length[Union[Domain /@ {x}]] > 1]] := Throw[Message[DiffGeo::diffmf, TensProd]];

TensProd[x_ /; TensQ[x]] := x;

TensProd[x___ /; And @@ (TensQ /@ {x}), y_TensProd, z___ /; And @@ (TensQ /@ {z})] := TensProd[x, Sequence @@ y, z];

TensProd[x___ /; And @@ (TensQ /@ {x}), y_ /; ConstQ[y], z___ /; And @@ (TensQ /@ {z})] := y * TensProd[x, z];

TensProd[a___ /; And @@ (TensQ /@ {a}), Times[b_ /; ConstQ[b], c_ /; TensQ[c]], d___ /; And @@ (TensQ /@ {d})] := b * TensProd[a, c, d];

TensProd[x___ /; And @@ (TensQ /@ {x}), y_ /; ScalQ[y], z___ /; And @@ (TensQ /@ {z})] := y * TensProd[x, z];

TensProd[a___ /; And @@ (TensQ /@ {a}), Times[b_ /; ScalQ[b], c_ /; TensQ[c]], d___ /; And @@ (TensQ /@ {d})] := b * TensProd[a, c, d];

TensProd[x___ /; And @@ (TensQ /@ {x}), y_Plus /; TensQ[y], z___ /; And @@ (TensQ /@ {z})] := TensProd[x, #, z]& /@ y;

End[];
EndPackage[];
