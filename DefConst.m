BeginPackage["DiffGeo`"];
Begin["`Private`"];

DefConst[x_] := (
	TensQ[x] ^= False;
	VectQ[x] ^= False;
	FormQ[x] ^= False;
	ScalQ[x] ^= False;
	ConstQ[x] ^= True;
	x
);

End[];
EndPackage[];
