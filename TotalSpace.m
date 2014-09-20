BeginPackage["DiffGeo`"];
Begin["`Private`"];

Format[TotalSpace[TangentBundle[x_]]] := Prefix[{x}, "\[DoubleStruckCapitalT]"];

Format[TotalSpace[CotangentBundle[x_]]] := Prefix[{x}, "\!\(\[DoubleStruckCapitalT]\^\(*\)\)"];

Format[TotalSpace[ExtPowBundle[b_, n_]]] := Prefix[{TotalSpace[b]}, Superscript["\[CapitalLambda]", n]];

Format[TotalSpace[ExtPowBundle[TangentBundle[m_], n_]]] := Prefix[{m}, Prefix[{"\[DoubleStruckCapitalT]"}, Superscript["\[CapitalLambda]", n]]];

Format[TotalSpace[ExtPowBundle[CotangentBundle[m_], n_]]] := Prefix[{m}, Prefix[{Superscript["\[DoubleStruckCapitalT]", "*"]}, Superscript["\[CapitalLambda]", n]]];

Format[TotalSpace[TensPowBundle[b_, n_]]] := Prefix[{TotalSpace[b]}, Superscript["\[CircleTimes]", n]];

Format[TotalSpace[TensPowBundle[TangentBundle[m_], n_]]] := Prefix[{m}, Prefix[{"\[DoubleStruckCapitalT]"}, Superscript["\[CircleTimes]", n]]];

Format[TotalSpace[TensPowBundle[CotangentBundle[m_], n_]]] := Prefix[{m}, Prefix[{Superscript["\[DoubleStruckCapitalT]", "*"]}, Superscript["\[CircleTimes]", n]]];

End[];
EndPackage[];
