BeginPackage["DiffGeo`"];
Begin["`Private`"];

TensQ[LieBr[_, _]] := True;

TensQ[LieDer[__]] := True;

TensQ[ExtDer[_]] := True;

TensQ[ExtProd[__]] := True;

TensQ[IntProd[__]] := True;

TensQ[TensProd[__]] := True;

TensQ[x_Plus] := And[And @@ (TensQ /@ (List @@ x)), Length[Union[Domain /@ (List @@ x)]] === 1, Length[Union[Codomain /@ (List @@ x)]] === 1];

TensQ[Times[x_ /; ScalQ[x], y_ /; TensQ[y]]] := True;

TensQ[x_Symbol] := True;

TensQ[x_ /; NumericQ[x]] := True;

TensQ[x_[y___ /; And @@ (ScalQ /@ {a})]] /; MemberQ[Attributes[x], NumericFunction] := True;

End[];
EndPackage[];
