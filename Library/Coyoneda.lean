/-
Copyright (c) 2017 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Kim Morrison
-/
import Mathlib.CategoryTheory.Functor.Hom
import Mathlib.CategoryTheory.Products.Basic
import Mathlib.Data.ULift
import Mathlib.Logic.Function.ULift
import VerifiedAgora.tagger
import Library.Yoneda


namespace CategoryTheory

open Opposite Opposite CategoryTheory.Yoneda

namespace YonedaLemma

universe v v₁ v₂ u₁ u₂

variable (C : Type u₁) [Category.{v₁} C]

/- Porting note: this used to be two calls to `tidy` -/
/-- The curried version of yoneda lemma when `C` is small. -/
def curriedYonedaLemma {C : Type u₁} [SmallCategory C] :
    (yoneda.op ⋙ coyoneda : Cᵒᵖ ⥤ (Cᵒᵖ ⥤ Type u₁) ⥤ Type u₁) ≅ evaluation Cᵒᵖ (Type u₁) :=
  NatIso.ofComponents (fun X ↦ NatIso.ofComponents (fun _ ↦ Equiv.toIso yonedaEquiv)) (by
    intro X Y f
    ext a b
    dsimp [yonedaEquiv]
    simp [← FunctorToTypes.naturality])

/-- The curried version of the Yoneda lemma. -/
def largeCurriedYonedaLemma {C : Type u₁} [Category.{v₁} C] :
    yoneda.op ⋙ coyoneda ≅
      evaluation Cᵒᵖ (Type v₁) ⋙ (whiskeringRight _ _ _).obj uliftFunctor.{u₁} :=
  NatIso.ofComponents
    (fun X => NatIso.ofComponents
      (fun _ => Equiv.toIso <| yonedaEquiv.trans Equiv.ulift.symm)
      (by
        intros Y Z f
        ext g
        rw [← ULift.down_inj]
        simpa using yonedaEquiv_comp _ _))
    (by
      intros Y Z f
      ext F g
      rw [← ULift.down_inj]
      simpa using (yonedaEquiv_naturality _ _).symm)

/-- Version of the Yoneda lemma where the presheaf is fixed but the argument varies. -/
def yonedaOpCompYonedaObj {C : Type u₁} [Category.{v₁} C] (P : Cᵒᵖ ⥤ Type v₁) :
    yoneda.op ⋙ yoneda.obj P ≅ P ⋙ uliftFunctor.{u₁} :=
  isoWhiskerRight largeCurriedYonedaLemma ((evaluation _ _).obj P)

/-- The curried version of yoneda lemma when `C` is small. -/
def curriedYonedaLemma' {C : Type u₁} [SmallCategory C] :
    yoneda ⋙ (whiskeringLeft Cᵒᵖ (Cᵒᵖ ⥤ Type u₁)ᵒᵖ (Type u₁)).obj yoneda.op
      ≅ 𝟭 (Cᵒᵖ ⥤ Type u₁) :=
  NatIso.ofComponents (fun F ↦ NatIso.ofComponents (fun _ ↦ Equiv.toIso yonedaEquiv) (by
    intro X Y f
    ext a
    dsimp [yonedaEquiv]
    simp [← FunctorToTypes.naturality]))

@[target]
lemma isIso_of_yoneda_map_bijective {X Y : C} (f : X ⟶ Y)
    (hf : ∀ (T : C), Function.Bijective (fun (x : T ⟶ X) => x ≫ f)) :
    IsIso f := by
  sorry

@[target]
lemma isIso_iff_yoneda_map_bijective {X Y : C} (f : X ⟶ Y) :
    IsIso f ↔ (∀ (T : C), Function.Bijective (fun (x : T ⟶ X) => x ≫ f)) := by
  sorry

@[target]
lemma isIso_iff_isIso_yoneda_map {X Y : C} (f : X ⟶ Y) :
    IsIso f ↔ ∀ c : C, IsIso ((yoneda.map f).app ⟨c⟩) := by
  sorry

end YonedaLemma

section CoyonedaLemma



open Opposite Opposite CategoryTheory.Yoneda

universe v v₁ v₂ u₁ u₂

variable {C : Type u₁} [Category.{v₁} C]
/-- We have a type-level equivalence between natural transformations from the coyoneda embedding
and elements of `F.obj X.unop`, without any universe switching.
-/
def coyonedaEquiv {X : C} {F : C ⥤ Type v₁} : (coyoneda.obj (op X) ⟶ F) ≃ F.obj X where
  toFun η := η.app X (𝟙 X)
  invFun ξ := { app := fun _ x ↦ F.map x ξ }
  left_inv := fun η ↦ by
    ext Y (x : X ⟶ Y)
    dsimp
    rw [← FunctorToTypes.naturality]
    simp
  right_inv := by intro ξ; simp

theorem coyonedaEquiv_apply {X : C} {F : C ⥤ Type v₁} (f : coyoneda.obj (op X) ⟶ F) :
    coyonedaEquiv f = f.app X (𝟙 X) :=
  rfl

@[simp]
theorem coyonedaEquiv_symm_app_apply {X : C} {F : C ⥤ Type v₁} (x : F.obj X) (Y : C)
    (f : X ⟶ Y) : (coyonedaEquiv.symm x).app Y f = F.map f x :=
  rfl

@[target]
lemma coyonedaEquiv_naturality {X Y : C} {F : C ⥤ Type v₁} (f : coyoneda.obj (op X) ⟶ F)
    (g : X ⟶ Y) : F.map g (coyonedaEquiv f) = coyonedaEquiv (coyoneda.map g.op ≫ f) := by
  sorry

@[target]
lemma coyonedaEquiv_comp {X : C} {F G : C ⥤ Type v₁} (α : coyoneda.obj (op X) ⟶ F) (β : F ⟶ G) :
    coyonedaEquiv (α ≫ β) = β.app _ (coyonedaEquiv α) := by
  sorry

@[target]
lemma coyonedaEquiv_coyoneda_map {X Y : C} (f : X ⟶ Y) :
    coyonedaEquiv (coyoneda.map f.op) = f := by
  sorry


@[target]
lemma map_coyonedaEquiv {X Y : C} {F : C ⥤ Type v₁} (f : coyoneda.obj (op X) ⟶ F)
    (g : X ⟶ Y) : F.map g (coyonedaEquiv f) = f.app Y g := by
  sorry

@[target]
lemma coyonedaEquiv_symm_map {X Y : C} (f : X ⟶ Y) {F : C ⥤ Type v₁} (t : F.obj X) :
    coyonedaEquiv.symm (F.map f t) = coyoneda.map f.op ≫ coyonedaEquiv.symm t := by
  sorry

variable (C)

/-- The "Coyoneda evaluation" functor, which sends `X : C` and `F : C ⥤ Type`
to `F.obj X`, functorially in both `X` and `F`.
-/
def coyonedaEvaluation : C × (C ⥤ Type v₁) ⥤ Type max u₁ v₁ :=
  evaluationUncurried C (Type v₁) ⋙ uliftFunctor

@[simp]
theorem coyonedaEvaluation_map_down (P Q : C × (C ⥤ Type v₁)) (α : P ⟶ Q)
    (x : (coyonedaEvaluation C).obj P) :
    ((coyonedaEvaluation C).map α x).down = α.2.app Q.1 (P.2.map α.1 x.down) :=
  rfl

/-- The "Coyoneda pairing" functor, which sends `X : C` and `F : C ⥤ Type`
to `coyoneda.rightOp.obj X ⟶ F`, functorially in both `X` and `F`.
-/
def coyonedaPairing : C × (C ⥤ Type v₁) ⥤ Type max u₁ v₁ :=
  Functor.prod coyoneda.rightOp (𝟭 (C ⥤ Type v₁)) ⋙ Functor.hom (C ⥤ Type v₁)

@[ext]
lemma coyonedaPairingExt {X : C × (C ⥤ Type v₁)} {x y : (coyonedaPairing C).obj X}
    (w : ∀ Y, x.app Y = y.app Y) : x = y :=
  NatTrans.ext (funext w)

@[simp]
theorem coyonedaPairing_map (P Q : C × (C ⥤ Type v₁)) (α : P ⟶ Q) (β : (coyonedaPairing C).obj P) :
    (coyonedaPairing C).map α β = coyoneda.map α.1.op ≫ β ≫ α.2 :=
  rfl

universe w in
variable {C} in
/-- A bijection `(coyoneda.obj X ⋙ uliftFunctor ⟶ F) ≃ F.obj (unop X)` which is a variant
of `coyonedaEquiv` with heterogeneous universes. -/
def coyonedaCompUliftFunctorEquiv (F : C ⥤ Type max v₁ w) (X : Cᵒᵖ) :
    (coyoneda.obj X ⋙ uliftFunctor ⟶ F) ≃ F.obj X.unop where
  toFun φ := φ.app X.unop (ULift.up (𝟙 _))
  invFun f :=
    { app := fun _ x => F.map (ULift.down x) f }
  left_inv φ := by
    ext Y f
    dsimp
    rw [← FunctorToTypes.naturality]
    dsimp
    rw [Category.id_comp]
    rfl
  right_inv f := by simp

/-- The Coyoneda lemma asserts that the Coyoneda pairing
`(X : C, F : C ⥤ Type) ↦ (coyoneda.obj X ⟶ F)`
is naturally isomorphic to the evaluation `(X, F) ↦ F.obj X`. -/
@[stacks 001P]
def coyonedaLemma : coyonedaPairing C ≅ coyonedaEvaluation C :=
  NatIso.ofComponents
    (fun _ ↦ Equiv.toIso (coyonedaEquiv.trans Equiv.ulift.symm))
    (by intro (X, F) (Y, G) f
        ext (a : coyoneda.obj (op X) ⟶ F)
        apply ULift.ext
        simp only [Functor.prod_obj, Functor.id_obj, types_comp_apply, coyonedaEvaluation_map_down]
        erw [Equiv.ulift_symm_down, Equiv.ulift_symm_down]
        simp [coyonedaEquiv, ← FunctorToTypes.naturality])


end CoyonedaLemma
end CategoryTheory
