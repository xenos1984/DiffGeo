BeginPackage["DiffGeo`"];
Begin["`Private`"];

DefVect[x_, m_] := (
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
