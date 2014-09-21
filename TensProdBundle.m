BeginPackage["DiffGeo`"];
Begin["`Private`"];

Format[TensProdBundle[x__]] := Infix[{Infix[TotalSpace /@ {x}, "\[CircleTimes]"], BaseSpace[First[{x}]]}, "\[RightArrow]"];

TensProdBundle::diffbs = "The given vectorbundles have different base spaces.";

TensProdBundle[x__ /; Nand @@ (VectBundleQ /@ {x})] := Throw[Message[DiffGeo::novb, TensProdBundle, Select[{x}, Not[VectBundleQ[#]]&]]];

TensProdBundle[x__ /; And[And @@ (VectBundleQ /@ {x}), Length[Union[BaseSpace /@ {x}]] > 1]] := Throw[Message[TensProdBundle::diffbs]];

TensProdBundle[x_ /; VectBundleQ[x]] := x;

TensProdBundle[a___ /; And @@ (VectBundleQ /@ {a}), b_TensPowBundle, c_TensPowBundle, d___ /; And @@ (VectBundleQ /@ {d})] /; b[[1]] == c[[1]] := TensProdBundle[a, TensPowBundle[b[[1]], b[[2]] + c[[2]]], d];

TensProdBundle[a___ /; And @@ (VectBundleQ /@ {a}), b_ /; VectBundleQ[b], c_TensPowBundle, d___ /; And @@ (VectBundleQ /@ {d})] /; b == c[[1]] := TensProdBundle[a, TensPowBundle[b, 1 + c[[2]]], d];

TensProdBundle[a___ /; And @@ (VectBundleQ /@ {a}), b_TensPowBundle, c_ /; VectBundleQ[c], d___ /; And @@ (VectBundleQ /@ {d})] /; c == b[[1]] := TensProdBundle[a, TensPowBundle[c, 1 + b[[2]]], d];

TensProdBundle[a___ /; And @@ (VectBundleQ /@ {a}), b_, b_, c___ /; And @@ (VectBundleQ /@ {c})] /; VectBundleQ[b] := TensProdBundle[a, TensPowBundle[b, 2], c];

End[];
EndPackage[];
