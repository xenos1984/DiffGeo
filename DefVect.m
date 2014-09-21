BeginPackage["DiffGeo`"];
Begin["`Private`"];

DefVect[x_Symbol, m_ /; ManifoldQ[m]] := (
	VectQ[x] ^= True;
	TensQ[x] ^= True;
	FormQ[x] ^= False;
	ScalQ[x] ^= False;
	ConstQ[x] ^= False;
	Rank[x] ^= {1, 0};
	DefSection[x, TangentBundle[m]]
);

End[];
EndPackage[];
