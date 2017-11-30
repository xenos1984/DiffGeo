(*
	DiffGeo/Kernel/init.m
	Package DiffGeo
	Functions for dealing with tensors, forms, vector fields
*)

BeginPackage["DiffGeo`"];

DefManifold::usage = "DefManifold[M] declares a manifold M.";
DefBundle::usage = "";
DefMapping::usage = "DefMapping[f, M, N] declares a mapping f: M \[RightArrow] N with domain M and codomain N.";
DefSection::usage = "DefSection[f, B] declares a section f of a fiber bundle B.";
DefConst::usage = "DefConst[c] declares a constant c.";

DefTens::usage = "";
DefVect::usage = "";
DefForm::usage = "";
DefScal::usage = "";

ManifoldQ::usage = "";
BundleQ::usage = "";
VectBundleQ::usage = "";
MappingQ::usage = "";
SectionQ::usage = "";

TensQ::usage = "";
VectQ::usage = "";
FormQ::usage = "";
ScalQ::usage = "";
ConstQ::usage = "";

Bundle::usage = "Bundle[f] returns the bundle of a section f.";
Domain::usage = "Domain[f] returns the domain M of a mapping f: M \[RightArrow] N.";
Codomain::usage = "Codomain[f] returns the codomain N of a mapping f: M \[RightArrow] N.";
BaseSpace::usage = "BaseSpace[B] returns the base space of a bundle B.";
TotalSpace::usage = "TotalSpace[B] returns the total space of a bundle B.";

TangentBundle::usage = "TangentBundle[M] returns the tangent bundle \[DoubleStruckCapitalT]M of a manifold M.";
CotangentBundle::usage = "CotangentBundle[M] returns the cotangent bundle \!\(\[DoubleStruckCapitalT]\^\(*\)M\) of a manifold M.";
ExtPowBundle::usage = "";
SymPowBundle::usage = "";
TensPowBundle::usage = "";
TensProdBundle::usage = "";

Rank::usage = "";
Dim::usage = "";

LieBr::usage = "LieBr[X, Y] calculates the Lie bracket \!\([X, Y]\) of two vector fields \!\(X, Y\).";
LieDer::usage = "LieDer[T, X, \[Ellipsis]] calculates the Lie derivative \!\(\[ScriptCapitalL]\_\(\[Ellipsis]\) \[ScriptCapitalL]\_X T\) of the Tensor \!\(T\) with respect to the vector fields \!\(X, \[Ellipsis]\).";
ExtDer::usage = "ExtDer[\[Omega]] calculates the exterior derivative \!\(d\[Omega]\) of a differential form \!\(\[Omega]\).";
ExtProd::usage = "ExtProd[\[Sigma], \[Omega], \[Ellipsis]] calculates the exterior product \!\(\[Sigma] \[Wedge] \[Omega] \[Wedge] \[Ellipsis]\) of differential forms \!\(\[Sigma], \[Omega], \[Ellipsis]\).";
IntProd::usage = "IntProd[\[Omega], X, \[Ellipsis]] calculates the interior product \!\(\[Iota]\_\(\[Ellipsis]\) \[Iota]\_X \[Omega]\) of a differential form \!\(\[Omega]\) and vector fields \!\(X, \[Ellipsis]\).";
TensProd::usage = "TensProd[S, T, \[Ellipsis]] calculates the tensor product \!\(S \[CircleTimes] T \[CircleTimes] \[Ellipsis]\) of tensors \!\(S, T, \[Ellipsis]\).";

$IntProdAsHook::usage = "Set $IntProdAsHook to true to display interior products using the hook (\:2a3c) notation, otherwise \[ScriptI] is used.";

DiffGeo::diffmf = "Arguments of `1` are not defined on the same manifold.";
DiffGeo::novb = "`1` works only on vector bundles, `2` is not a vector bundle.";

EndPackage[];

Get["DiffGeo`DefManifold`"];
Get["DiffGeo`DefMapping`"];
Get["DiffGeo`DefSection`"];
Get["DiffGeo`DefConst`"];
Get["DiffGeo`DefScal`"];
Get["DiffGeo`DefVect`"];
Get["DiffGeo`DefForm`"];
Get["DiffGeo`ManifoldQ`"];
Get["DiffGeo`BundleQ`"];
Get["DiffGeo`VectBundleQ`"];
Get["DiffGeo`MappingQ`"];
Get["DiffGeo`SectionQ`"];
Get["DiffGeo`TensQ`"];
Get["DiffGeo`VectQ`"];
Get["DiffGeo`FormQ`"];
Get["DiffGeo`ConstQ`"];
Get["DiffGeo`ScalQ`"];
Get["DiffGeo`Rank`"];
Get["DiffGeo`Dim`"];
Get["DiffGeo`Bundle`"];
Get["DiffGeo`Domain`"];
Get["DiffGeo`Codomain`"];
Get["DiffGeo`BaseSpace`"];
Get["DiffGeo`TotalSpace`"];
Get["DiffGeo`TangentBundle`"];
Get["DiffGeo`CotangentBundle`"];
Get["DiffGeo`ExtPowBundle`"];
Get["DiffGeo`SymPowBundle`"];
Get["DiffGeo`TensPowBundle`"];
Get["DiffGeo`TensProdBundle`"];
Get["DiffGeo`TensProd`"];
Get["DiffGeo`IntProd`"];
Get["DiffGeo`ExtProd`"];
Get["DiffGeo`ExtDer`"];
Get["DiffGeo`LieDer`"];
Get["DiffGeo`LieBr`"];
