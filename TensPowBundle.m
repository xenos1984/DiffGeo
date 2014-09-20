BeginPackage["DiffGeo`"];
Begin["`Private`"];

Format[TensPowBundle[b_, n_]] := Prefix[{b}, Superscript["\[CircleTimes]", n]];

Format[TensPowBundle[TangentBundle[m_], n_]] := Prefix[{m}, Prefix[{"\[DoubleStruckCapitalT]"}, Superscript["\[CircleTimes]", n]]];

Format[TensPowBundle[CotangentBundle[m_], n_]] := Prefix[{m}, Prefix[{Superscript["\[DoubleStruckCapitalT]", "*"]}, Superscript["\[CircleTimes]", n]]];

TensPowBundle[b_ /; VectBundleQ[b], 1] := b;

End[];
EndPackage[];
