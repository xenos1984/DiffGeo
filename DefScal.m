BeginPackage["DiffGeo`"];
Begin["`Private`"];

DefScal[x_Symbol, m_ /; ManifoldQ[m]] := (
	VectQ[x] ^= False;
	TensQ[x] ^= True;
	FormQ[x] ^= True;
	ScalQ[x] ^= True;
	ConstQ[x] ^= False;
	Rank[x] ^= {0, 0};
	DefMapping[x, m, Reals]
);

End[];
EndPackage[];
