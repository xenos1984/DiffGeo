BeginPackage["DiffGeo`"];
Begin["`Private`"];

Dim[TotalSpace[TangentBundle[m_]]] := 2 * Dim[m];

Dim[TotalSpace[CotangentBundle[m_]]] := 2 * Dim[m];

Dim[TotalSpace[TensPowBundle[b_, n_]]] := Dim[BaseSpace[b]] + (Dim[TotalSpace[b]] - Dim[BaseSpace[b]])^n;

Dim[TotalSpace[ExtPowBundle[b_, n_]]] := Dim[BaseSpace[b]] + Binomial[Dim[TotalSpace[b]] - Dim[BaseSpace[b]], n];

Dim[TotalSpace[ExtPowBundle[b_, n_]]] := Dim[BaseSpace[b]] + Binomial[Dim[TotalSpace[b]] - Dim[BaseSpace[b]] + n - 1, n];

Dim[TotalSpace[TensProdBundle[b__]]] := (Times @@ ((Dim[TotalSpace[#]] - Dim[BaseSpace[#]])& /@ {b})) + Dim[BaseSpace[First[{b}]]];

End[];
EndPackage[];
