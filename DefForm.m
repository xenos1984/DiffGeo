BeginPackage["DiffGeo`"];
Begin["`Private`"];

DefForm[x_, m_, p_] := (
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
