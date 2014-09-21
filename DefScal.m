BeginPackage["DiffGeo`"];
Begin["`Private`"];

DefScal[x_, m_] := (
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
