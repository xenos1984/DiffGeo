BeginPackage["DiffGeo`"];
Begin["`Private`"];

FormQ[x_] := Or[ScalQ[x], And[SectionQ[x], Or[Bundle[x] === CotangentBundle[Domain[x]], MatchQ[Bundle[x], ExtPowBundle[CotangentBundle[Domain[x]], _]]]]];

End[];
EndPackage[];
