BeginPackage["DiffGeo`"];
Begin["`Private`"];

DefForm[x_Symbol, p_ /; ConstQ[p], m_ /; ManifoldQ[m]] := (
	VectQ[x] ^= False;
	TensQ[x] ^= True;
	FormQ[x] ^= True;
	ScalQ[x] ^= False;
	ConstQ[x] ^= False;
	Rank[x] ^= {0, p};
	DefSection[x, ExtPowBundle[CotangentBundle[m], p]]
);

End[];
EndPackage[];
