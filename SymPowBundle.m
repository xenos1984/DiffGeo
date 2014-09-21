BeginPackage["DiffGeo`"];
Begin["`Private`"];

Format[SymPowBundle[b_, n_]] := Infix[{Prefix[{TotalSpace[b]}, Superscript["\[CircleDot]", n]], BaseSpace[b]}, "\[RightArrow]"];

Format[SymPowBundle[TangentBundle[m_], n_]] := Infix[{Prefix[{m}, Prefix[{"\[DoubleStruckCapitalT]"}, Superscript["\[CircleDot]", n]]], m}, "\[RightArrow]"];

Format[SymPowBundle[CotangentBundle[m_], n_]] := Infix[{Prefix[{m}, Prefix[{Superscript["\[DoubleStruckCapitalT]", "*"]}, Superscript["\[CircleDot]", n]]], m}, "\[RightArrow]"];

SymPowBundle[b_ /; Not[VectBundleQ[b]], n_] := Throw[Message[DiffGeo::novb, SymPowBundle, b]];

SymPowBundle[b_ /; VectBundleQ[b], 1] := b;

End[];
EndPackage[];
