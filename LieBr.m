BeginPackage["DiffGeo`"];
Begin["`Private`"];

Format[LieBr[x_, y_]] := "\[Null]"[x, y];

LieBr::novect = "LieBr works only on vector fields, `1` is not a vector field.";

LieBr[] := Message[General::argrx, LieBr, 0, 2];

LieBr[_] := Message[General::argr, LieBr, 2];

LieBr[_, _, x__] := Message[General::argrx, LieBr, Length[{x}] + 2, 2];

LieBr[x_ /; Not[VectQ[x]], y_] := Message[LieBr::novect, x];

LieBr[x_, y_ /; Not[VectQ[y]]] := Message[LieBr::novect, y];

LieBr[x_ /; VectQ[x], y_ /; VectQ[y]] /; (Domain[x] =!= Domain[y]) := Message[DiffGeo::diffmf, LieBr];

LieBr[x_ /; VectQ[x], y_ /; VectQ[y]] /; Not[OrderedQ[{x, y}]] := -LieBr[y, x];

LieBr[x_, x_] /; VectQ[x] := 0;

LieBr[Times[x_ /; ConstQ[x], y_ /; VectQ[y]], z_ /; VectQ[z]] := x * LieBr[y, z];

LieBr[z_ /; VectQ[z], Times[x_ /; ConstQ[x], y_ /; VectQ[y]]] := x * LieBr[z, y];

LieBr[x_Plus /; VectQ[x], y_ /; VectQ[y]] := LieBr[#, y]& /@ x;

LieBr[x_ /; VectQ[x], y_Plus /; VectQ[y]] := LieBr[x, #]& /@ y;

LieBr[Times[x_ /; ScalQ[x], y_ /; VectQ[y]], z_ /; VectQ[z]] := -LieDer[x, z] * y + x * LieBr[y, z];

LieBr[z_ /; VectQ[z], Times[x_ /; ScalQ[x], y_ /; VectQ[y]]] := LieDer[x, z] * y + x * LieBr[z, y];

End[];
EndPackage[];
