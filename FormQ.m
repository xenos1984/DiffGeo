BeginPackage["DiffGeo`"];
Begin["`Private`"];

FormQ[x_] := Or[x === 0, ScalQ[x], And[SectionQ[x], Or[Bundle[x] === CotangentBundle[Domain[x]], MatchQ[Bundle[x], ExtPowBundle[CotangentBundle[Domain[x]], _]]]]];

End[];
EndPackage[];
