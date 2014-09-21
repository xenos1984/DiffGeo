BeginPackage["DiffGeo`"];
Begin["`Private`"];

Bundle::nosect = "Bundle works only on sections, `1` is not a section.";

Bundle[x_ /; Not[SectionQ[x]]] := Message[Bundle::nosect, x];

Bundle[Times[x_ /; ConstQ[x], y_ /; And[SectionQ[y], VectBundleQ[Bundle[y]]]]] := Bundle[y];

Bundle[Times[x_ /; ScalQ[x], y_ /; And[SectionQ[y], VectBundleQ[Bundle[y]]]]] /; (Domain[x] === Domain[y]) := Bundle[y];

Bundle[x_Plus /; SectionQ[x]] := Bundle[First[x]];

Bundle[x_TensProd] := TensProdBundle @@ (Bundle /@ (List @@ x));

Bundle[x_IntProd] := ExtPowBundle[CotangentBundle[Domain[First[x]]], Rank[First[x]][[2]] - Length[x] + 1];

Bundle[x_ExtProd] := ExtPowBundle[CotangentBundle[Domain[First[x]]], Plus @@ (Rank[#][[2]]& /@ (List @@ x))];

Bundle[x_ExtDer] := ExtPowBundle[CotangentBundle[Domain[First[x]]], Rank[First[x]][[2]] + 1];

Bundle[x_LieDer] := Bundle[First[x]];

Bundle[x_LieBr] := Bundle[First[x]];

End[];
EndPackage[];
