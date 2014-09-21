BeginPackage["DiffGeo`"];
Begin["`Private`"];

Format[ExtPowBundle[b_, n_]] := Infix[{Prefix[{TotalSpace[b]}, Superscript["\[CapitalLambda]", n]], BaseSpace[b]}, "\[RightArrow]"];

Format[ExtPowBundle[TangentBundle[m_], n_]] := Infix[{Prefix[{m}, Prefix[{"\[DoubleStruckCapitalT]"}, Superscript["\[CapitalLambda]", n]]], m}, "\[RightArrow]"];

Format[ExtPowBundle[CotangentBundle[m_], n_]] := Infix[{Prefix[{m}, Prefix[{Superscript["\[DoubleStruckCapitalT]", "*"]}, Superscript["\[CapitalLambda]", n]]], m}, "\[RightArrow]"];

ExtPowBundle[b_ /; Not[VectBundleQ[b]], n_] := Throw[Message[DiffGeo::novb, ExtPowBundle, b]];

ExtPowBundle[b_ /; VectBundleQ[b], 1] := b;

End[];
EndPackage[];
