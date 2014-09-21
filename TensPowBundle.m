BeginPackage["DiffGeo`"];
Begin["`Private`"];

Format[TensPowBundle[b_, n_]] := Infix[{Prefix[{TotalSpace[b]}, Superscript["\[CircleTimes]", n]], BaseSpace[b]}, "\[RightArrow]"];

Format[TensPowBundle[TangentBundle[m_], n_]] := Infix[{Prefix[{m}, Prefix[{"\[DoubleStruckCapitalT]"}, Superscript["\[CircleTimes]", n]]], m}, "\[RightArrow]"];

Format[TensPowBundle[CotangentBundle[m_], n_]] := Infix[{Prefix[{m}, Prefix[{Superscript["\[DoubleStruckCapitalT]", "*"]}, Superscript["\[CircleTimes]", n]]], m}, "\[RightArrow]"];

TensPowBundle[b_ /; Not[VectBundleQ[b]], n_] := Throw[Message[DiffGeo::novb, TensPowBundle, b]];

TensPowBundle[b_ /; VectBundleQ[b], 1] := b;

TensPowBundle[b_TensPowBundle, n] := TensPowBundle[b[[1]], n * b[[2]]];

End[];
EndPackage[];
