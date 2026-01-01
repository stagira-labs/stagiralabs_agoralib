import Mathlib.CategoryTheory.Functor.Hom
import Mathlib.CategoryTheory.Products.Basic
import Mathlib.Data.ULift
import Mathlib.Logic.Function.ULift
import VerifiedAgora.tagger

/-!
# The Yoneda embedding

The Yoneda embedding as a functor `yoneda : C ⥤ (Cᵒᵖ ⥤ Type v₁)`,
along with an instance that it is `FullyFaithful`.

Also the Yoneda lemma, `yonedaLemma : (yoneda_pairing C) ≅ (yoneda_evaluation C)`.

## References
* [Stacks: Opposite Categories and the Yoneda Lemma](https://stacks.math.columbia.edu/tag/001L)
-/

namespace CategoryTheory

open Opposite

universe v v₁ v₂ u₁ u₂

-- morphism levels before object levels. See note [CategoryTheory universes].
variable {C : Type u₁} [Category.{v₁} C]

/-- The Yoneda embedding, as a functor from `C` into presheaves on `C`. -/
@[simps, stacks 001O]
def yoneda : C ⥤ Cᵒᵖ ⥤ Type v₁ where
  obj X :=
    { obj := fun Y => unop Y ⟶ X
      map := fun f g => f.unop ≫ g }
  map f :=
    { app := fun _ g => g ≫ f }

/-- The co-Yoneda embedding, as a functor from `Cᵒᵖ` into co-presheaves on `C`.
-/
@[simps]
def coyoneda : Cᵒᵖ ⥤ C ⥤ Type v₁ where
  obj X :=
    { obj := fun Y => unop X ⟶ Y
      map := fun f g => g ≫ f }
  map f :=
    { app := fun _ g => f.unop ≫ g }

namespace Yoneda

theorem obj_map_id {X Y : C} (f : op X ⟶ op Y) :
    (yoneda.obj X).map f (𝟙 X) = (yoneda.map f.unop).app (op Y) (𝟙 Y) := by
  dsimp
  simp

@[simp]
theorem naturality {X Y : C} (α : yoneda.obj X ⟶ yoneda.obj Y) {Z Z' : C} (f : Z ⟶ Z')
    (h : Z' ⟶ X) : f ≫ α.app (op Z') h = α.app (op Z) (f ≫ h) :=
  (FunctorToTypes.naturality _ _ α f.op h).symm

/-- The Yoneda embedding is fully faithful. -/
def fullyFaithful : (yoneda (C := C)).FullyFaithful where
  preimage f := f.app _ (𝟙 _)

lemma fullyFaithful_preimage {X Y : C} (f : yoneda.obj X ⟶ yoneda.obj Y) :
    fullyFaithful.preimage f = f.app (op X) (𝟙 X) := rfl

/-- The Yoneda embedding is full. -/
@[stacks 001P]
instance yoneda_full : (yoneda : C ⥤ Cᵒᵖ ⥤ Type v₁).Full :=
  fullyFaithful.full

/-- The Yoneda embedding is faithful. -/
@[stacks 001P]
instance yoneda_faithful : (yoneda : C ⥤ Cᵒᵖ ⥤ Type v₁).Faithful :=
  fullyFaithful.faithful

/-- Extensionality via Yoneda. The typical usage would be
```
-- Goal is `X ≅ Y`
apply yoneda.ext,
-- Goals are now functions `(Z ⟶ X) → (Z ⟶ Y)`, `(Z ⟶ Y) → (Z ⟶ X)`, and the fact that these
-- functions are inverses and natural in `Z`.
```
-/
def ext (X Y : C) (p : ∀ {Z : C}, (Z ⟶ X) → (Z ⟶ Y))
    (q : ∀ {Z : C}, (Z ⟶ Y) → (Z ⟶ X))
    (h₁ : ∀ {Z : C} (f : Z ⟶ X), q (p f) = f) (h₂ : ∀ {Z : C} (f : Z ⟶ Y), p (q f) = f)
    (n : ∀ {Z Z' : C} (f : Z' ⟶ Z) (g : Z ⟶ X), p (f ≫ g) = f ≫ p g) : X ≅ Y :=
  fullyFaithful.preimageIso
    (NatIso.ofComponents fun Z =>
      { hom := p
        inv := q })

/-- If `yoneda.map f` is an isomorphism, so was `f`.
-/
theorem isIso {X Y : C} (f : X ⟶ Y) [IsIso (yoneda.map f)] : IsIso f :=
  isIso_of_fully_faithful yoneda f

end Yoneda

namespace Coyoneda

@[simp]
theorem naturality {X Y : Cᵒᵖ} (α : coyoneda.obj X ⟶ coyoneda.obj Y) {Z Z' : C} (f : Z' ⟶ Z)
    (h : unop X ⟶ Z') : α.app Z' h ≫ f = α.app Z (h ≫ f) :=
  (FunctorToTypes.naturality _ _ α f h).symm

/-- The co-Yoneda embedding is fully faithful. -/
def fullyFaithful : (coyoneda (C := C)).FullyFaithful where
  preimage f := (f.app _ (𝟙 _)).op

lemma fullyFaithful_preimage {X Y : Cᵒᵖ} (f : coyoneda.obj X ⟶ coyoneda.obj Y) :
    fullyFaithful.preimage f = (f.app X.unop (𝟙 X.unop)).op := rfl

/-- The morphism `X ⟶ Y` corresponding to a natural transformation
`coyoneda.obj X ⟶ coyoneda.obj Y`. -/
def preimage {X Y : Cᵒᵖ} (f : coyoneda.obj X ⟶ coyoneda.obj Y) : X ⟶ Y :=
  (f.app _ (𝟙 X.unop)).op

instance coyoneda_full : (coyoneda : Cᵒᵖ ⥤ C ⥤ Type v₁).Full :=
  fullyFaithful.full

instance coyoneda_faithful : (coyoneda : Cᵒᵖ ⥤ C ⥤ Type v₁).Faithful :=
  fullyFaithful.faithful

/-- If `coyoneda.map f` is an isomorphism, so was `f`.
-/
theorem isIso {X Y : Cᵒᵖ} (f : X ⟶ Y) [IsIso (coyoneda.map f)] : IsIso f :=
  isIso_of_fully_faithful coyoneda f

/-- The identity functor on `Type` is isomorphic to the coyoneda functor coming from `PUnit`. -/
def punitIso : coyoneda.obj (Opposite.op PUnit) ≅ 𝟭 (Type v₁) :=
  NatIso.ofComponents fun X =>
    { hom := fun f => f ⟨⟩
      inv := fun x _ => x }

/-- Taking the `unop` of morphisms is a natural isomorphism. -/
@[simps!]
def objOpOp (X : C) : coyoneda.obj (op (op X)) ≅ yoneda.obj X :=
  NatIso.ofComponents fun _ => (opEquiv _ _).toIso

end Coyoneda

namespace Functor

/-- The data which expresses that a functor `F : Cᵒᵖ ⥤ Type v` is representable by `Y : C`. -/
structure RepresentableBy (F : Cᵒᵖ ⥤ Type v) (Y : C) where
  /-- the natural bijection `(X ⟶ Y) ≃ F.obj (op X)`. -/
  homEquiv {X : C} : (X ⟶ Y) ≃ F.obj (op X)
  homEquiv_comp {X X' : C} (f : X ⟶ X') (g : X' ⟶ Y) :
    homEquiv (f ≫ g) = F.map f.op (homEquiv g)

lemma RepresentableBy.comp_homEquiv_symm {F : Cᵒᵖ ⥤ Type v} {Y : C}
    (e : F.RepresentableBy Y) {X X' : C} (x : F.obj (op X')) (f : X ⟶ X') :
    f ≫ e.homEquiv.symm x = e.homEquiv.symm (F.map f.op x) :=
  e.homEquiv.injective (by simp [homEquiv_comp])

/-- If `F ≅ F'`, and `F` is representable, then `F'` is representable. -/
def RepresentableBy.ofIso {F F' : Cᵒᵖ ⥤ Type v} {Y : C} (e : F.RepresentableBy Y) (e' : F ≅ F') :
    F'.RepresentableBy Y where
  homEquiv {X} := e.homEquiv.trans (e'.app _).toEquiv
  homEquiv_comp {X X'} f g := by
    dsimp
    rw [e.homEquiv_comp]
    apply congr_fun (e'.hom.naturality f.op)

/-- The data which expresses that a functor `F : C ⥤ Type v` is corepresentable by `X : C`. -/
structure CorepresentableBy (F : C ⥤ Type v) (X : C) where
  /-- the natural bijection `(X ⟶ Y) ≃ F.obj Y`. -/
  homEquiv {Y : C} : (X ⟶ Y) ≃ F.obj Y
  homEquiv_comp {Y Y' : C} (g : Y ⟶ Y') (f : X ⟶ Y) :
    homEquiv (f ≫ g) = F.map g (homEquiv f)

lemma CorepresentableBy.homEquiv_symm_comp {F : C ⥤ Type v} {X : C}
    (e : F.CorepresentableBy X) {Y Y' : C} (y : F.obj Y) (g : Y ⟶ Y') :
    e.homEquiv.symm y ≫ g = e.homEquiv.symm (F.map g y) :=
  e.homEquiv.injective (by simp [homEquiv_comp])

/-- If `F ≅ F'`, and `F` is corepresentable, then `F'` is corepresentable. -/
def CorepresentableBy.ofIso {F F' : C ⥤ Type v} {X : C} (e : F.CorepresentableBy X)
    (e' : F ≅ F') :
    F'.CorepresentableBy X where
  homEquiv {X} := e.homEquiv.trans (e'.app _).toEquiv
  homEquiv_comp {Y Y'} g f := by
    dsimp
    rw [e.homEquiv_comp]
    apply congr_fun (e'.hom.naturality g)

lemma RepresentableBy.homEquiv_eq {F : Cᵒᵖ ⥤ Type v} {Y : C} (e : F.RepresentableBy Y)
    {X : C} (f : X ⟶ Y) :
    e.homEquiv f = F.map f.op (e.homEquiv (𝟙 Y)) := by
  conv_lhs => rw [← Category.comp_id f, e.homEquiv_comp]

lemma CorepresentableBy.homEquiv_eq {F : C ⥤ Type v} {X : C} (e : F.CorepresentableBy X)
    {Y : C} (f : X ⟶ Y) :
    e.homEquiv f = F.map f (e.homEquiv (𝟙 X)) := by
  conv_lhs => rw [← Category.id_comp f, e.homEquiv_comp]

@[ext]
lemma RepresentableBy.ext {F : Cᵒᵖ ⥤ Type v} {Y : C} {e e' : F.RepresentableBy Y}
    (h : e.homEquiv (𝟙 Y) = e'.homEquiv (𝟙 Y)) : e = e' := by
  have : ∀ {X : C} (f : X ⟶ Y), e.homEquiv f = e'.homEquiv f := fun {X} f ↦ by
    rw [e.homEquiv_eq, e'.homEquiv_eq, h]
  obtain ⟨e, he⟩ := e
  obtain ⟨e', he'⟩ := e'
  obtain rfl : @e = @e' := by ext; apply this
  rfl

@[ext]
lemma CorepresentableBy.ext {F : C ⥤ Type v} {X : C} {e e' : F.CorepresentableBy X}
    (h : e.homEquiv (𝟙 X) = e'.homEquiv (𝟙 X)) : e = e' := by
  have : ∀ {Y : C} (f : X ⟶ Y), e.homEquiv f = e'.homEquiv f := fun {X} f ↦ by
    rw [e.homEquiv_eq, e'.homEquiv_eq, h]
  obtain ⟨e, he⟩ := e
  obtain ⟨e', he'⟩ := e'
  obtain rfl : @e = @e' := by ext; apply this
  rfl

/-- The obvious bijection `F.RepresentableBy Y ≃ (yoneda.obj Y ≅ F)`
when `F : Cᵒᵖ ⥤ Type v₁` and `[Category.{v₁} C]`. -/
def representableByEquiv {F : Cᵒᵖ ⥤ Type v₁} {Y : C} :
    F.RepresentableBy Y ≃ (yoneda.obj Y ≅ F) where
  toFun r := NatIso.ofComponents (fun _ ↦ r.homEquiv.toIso) (fun {X X'} f ↦ by
    ext g
    simp [r.homEquiv_comp])
  invFun e :=
    { homEquiv := (e.app _).toEquiv
      homEquiv_comp := fun {X X'} f g ↦ congr_fun (e.hom.naturality f.op) g }
  left_inv _ := rfl
  right_inv _ := rfl

/-- The isomorphism `yoneda.obj Y ≅ F` induced by `e : F.RepresentableBy Y`. -/
def RepresentableBy.toIso {F : Cᵒᵖ ⥤ Type v₁} {Y : C} (e : F.RepresentableBy Y) :
    yoneda.obj Y ≅ F :=
  representableByEquiv e

/-- The obvious bijection `F.CorepresentableBy X ≃ (yoneda.obj Y ≅ F)`
when `F : C ⥤ Type v₁` and `[Category.{v₁} C]`. -/
def corepresentableByEquiv {F : C ⥤ Type v₁} {X : C} :
    F.CorepresentableBy X ≃ (coyoneda.obj (op X) ≅ F) where
  toFun r := NatIso.ofComponents (fun _ ↦ r.homEquiv.toIso) (fun {X X'} f ↦ by
    ext g
    simp [r.homEquiv_comp])
  invFun e :=
    { homEquiv := (e.app _).toEquiv
      homEquiv_comp := fun {X X'} f g ↦ congr_fun (e.hom.naturality f) g }
  left_inv _ := rfl
  right_inv _ := rfl

/-- The isomorphism `coyoneda.obj (op X) ≅ F` induced by `e : F.CorepresentableBy X`. -/
def CorepresentableBy.toIso {F : C ⥤ Type v₁} {X : C} (e : F.CorepresentableBy X) :
    coyoneda.obj (op X) ≅ F :=
  corepresentableByEquiv e

/-- A functor `F : Cᵒᵖ ⥤ Type v` is representable if there is an object `Y` with a structure
`F.RepresentableBy Y`, i.e. there is a natural bijection `(X ⟶ Y) ≃ F.obj (op X)`,
which may also be rephrased as a natural isomorphism `yoneda.obj X ≅ F` when `Category.{v} C`. -/
@[stacks 001Q]
class IsRepresentable (F : Cᵒᵖ ⥤ Type v) : Prop where
  has_representation : ∃ (Y : C), Nonempty (F.RepresentableBy Y)

@[deprecated (since := "2024-10-03")] alias Representable := IsRepresentable

lemma RepresentableBy.isRepresentable {F : Cᵒᵖ ⥤ Type v} {Y : C} (e : F.RepresentableBy Y) :
    F.IsRepresentable where
  has_representation := ⟨Y, ⟨e⟩⟩

/-- Alternative constructor for `F.IsRepresentable`, which takes as an input an
isomorphism `yoneda.obj X ≅ F`. -/
lemma IsRepresentable.mk' {F : Cᵒᵖ ⥤ Type v₁} {X : C} (e : yoneda.obj X ≅ F) :
    F.IsRepresentable :=
  (representableByEquiv.symm e).isRepresentable

instance {X : C} : IsRepresentable (yoneda.obj X) :=
  IsRepresentable.mk' (Iso.refl _)

/-- A functor `F : C ⥤ Type v₁` is corepresentable if there is object `X` so `F ≅ coyoneda.obj X`.
-/
@[stacks 001Q]
class IsCorepresentable (F : C ⥤ Type v) : Prop where
  has_corepresentation : ∃ (X : C), Nonempty (F.CorepresentableBy X)

@[deprecated (since := "2024-10-03")] alias Corepresentable := IsCorepresentable

lemma CorepresentableBy.isCorepresentable {F : C ⥤ Type v} {X : C} (e : F.CorepresentableBy X) :
    F.IsCorepresentable where
  has_corepresentation := ⟨X, ⟨e⟩⟩

/-- Alternative constructor for `F.IsCorepresentable`, which takes as an input an
isomorphism `coyoneda.obj (op X) ≅ F`. -/
lemma IsCorepresentable.mk' {F : C ⥤ Type v₁} {X : C} (e : coyoneda.obj (op X) ≅ F) :
    F.IsCorepresentable :=
  (corepresentableByEquiv.symm e).isCorepresentable

instance {X : Cᵒᵖ} : IsCorepresentable (coyoneda.obj X) :=
  IsCorepresentable.mk' (Iso.refl _)

-- instance : corepresentable (𝟭 (Type v₁)) :=
-- corepresentable_of_nat_iso (op punit) coyoneda.punit_iso
section Representable

variable (F : Cᵒᵖ ⥤ Type v) [hF : F.IsRepresentable]

/-- The representing object for the representable functor `F`. -/
noncomputable def reprX : C :=
  hF.has_representation.choose

/-- A chosen term in `F.RepresentableBy (reprX F)` when `F.IsRepresentable` holds. -/
noncomputable def representableBy : F.RepresentableBy F.reprX :=
  hF.has_representation.choose_spec.some

/-- The representing element for the representable functor `F`, sometimes called the universal
element of the functor.
-/
noncomputable def reprx : F.obj (op F.reprX) :=
  F.representableBy.homEquiv (𝟙 _)

/-- An isomorphism between a representable `F` and a functor of the
form `C(-, F.reprX)`.  Note the components `F.reprW.app X`
definitionally have type `(X.unop ⟶ F.reprX) ≅ F.obj X`.
-/
noncomputable def reprW (F : Cᵒᵖ ⥤ Type v₁) [F.IsRepresentable] :
    yoneda.obj F.reprX ≅ F := F.representableBy.toIso

theorem reprW_hom_app (F : Cᵒᵖ ⥤ Type v₁) [F.IsRepresentable]
    (X : Cᵒᵖ) (f : unop X ⟶ F.reprX) :
    F.reprW.hom.app X f = F.map f.op F.reprx := by
  apply RepresentableBy.homEquiv_eq

end Representable

section Corepresentable

variable (F : C ⥤ Type v) [hF : F.IsCorepresentable]

/-- The representing object for the corepresentable functor `F`. -/
noncomputable def coreprX : C :=
  hF.has_corepresentation.choose

/-- A chosen term in `F.CorepresentableBy (coreprX F)` when `F.IsCorepresentable` holds. -/
noncomputable def corepresentableBy : F.CorepresentableBy F.coreprX :=
  hF.has_corepresentation.choose_spec.some

/-- The representing element for the corepresentable functor `F`, sometimes called the universal
element of the functor.
-/
noncomputable def coreprx : F.obj F.coreprX :=
  F.corepresentableBy.homEquiv (𝟙 _)

/-- An isomorphism between a corepresentable `F` and a functor of the form
`C(F.corepr X, -)`. Note the components `F.coreprW.app X`
definitionally have type `F.corepr_X ⟶ X ≅ F.obj X`.
-/
noncomputable def coreprW (F : C ⥤ Type v₁) [F.IsCorepresentable] :
    coyoneda.obj (op F.coreprX) ≅ F :=
  F.corepresentableBy.toIso

theorem coreprW_hom_app (F : C ⥤ Type v₁) [F.IsCorepresentable] (X : C) (f : F.coreprX ⟶ X) :
    F.coreprW.hom.app X f = F.map f F.coreprx := by
  apply CorepresentableBy.homEquiv_eq

end Corepresentable

end Functor

theorem isRepresentable_of_natIso (F : Cᵒᵖ ⥤ Type v₁) {G} (i : F ≅ G) [F.IsRepresentable] :
    G.IsRepresentable :=
  (F.representableBy.ofIso i).isRepresentable

theorem corepresentable_of_natIso (F : C ⥤ Type v₁) {G} (i : F ≅ G) [F.IsCorepresentable] :
    G.IsCorepresentable :=
  (F.corepresentableBy.ofIso i).isCorepresentable

instance : Functor.IsCorepresentable (𝟭 (Type v₁)) :=
  corepresentable_of_natIso (coyoneda.obj (op PUnit)) Coyoneda.punitIso

open Opposite

variable (C)

-- We need to help typeclass inference with some awkward universe levels here.
instance prodCategoryInstance1 : Category ((Cᵒᵖ ⥤ Type v₁) × Cᵒᵖ) :=
  CategoryTheory.prod.{max u₁ v₁, v₁} (Cᵒᵖ ⥤ Type v₁) Cᵒᵖ

instance prodCategoryInstance2 : Category (Cᵒᵖ × (Cᵒᵖ ⥤ Type v₁)) :=
  CategoryTheory.prod.{v₁, max u₁ v₁} Cᵒᵖ (Cᵒᵖ ⥤ Type v₁)

open Yoneda

section YonedaLemma

variable {C}

/-- We have a type-level equivalence between natural transformations from the yoneda embedding
and elements of `F.obj X`, without any universe switching.
-/
def yonedaEquiv {X : C} {F : Cᵒᵖ ⥤ Type v₁} : (yoneda.obj X ⟶ F) ≃ F.obj (op X) where
  toFun η := η.app (op X) (𝟙 X)
  invFun ξ := { app := fun _ f ↦ F.map f.op ξ }
  left_inv := by
    intro η
    ext Y f
    dsimp
    rw [← FunctorToTypes.naturality]
    simp
  right_inv := by intro ξ; simp

theorem yonedaEquiv_apply {X : C} {F : Cᵒᵖ ⥤ Type v₁} (f : yoneda.obj X ⟶ F) :
    yonedaEquiv f = f.app (op X) (𝟙 X) :=
  rfl

@[simp]
theorem yonedaEquiv_symm_app_apply {X : C} {F : Cᵒᵖ ⥤ Type v₁} (x : F.obj (op X)) (Y : Cᵒᵖ)
    (f : Y.unop ⟶ X) : (yonedaEquiv.symm x).app Y f = F.map f.op x :=
  rfl

/-- See also `yonedaEquiv_naturality'` for a more general version. -/
lemma yonedaEquiv_naturality {X Y : C} {F : Cᵒᵖ ⥤ Type v₁} (f : yoneda.obj X ⟶ F)
    (g : Y ⟶ X) : F.map g.op (yonedaEquiv f) = yonedaEquiv (yoneda.map g ≫ f) := by
  change (f.app (op X) ≫ F.map g.op) (𝟙 X) = f.app (op Y) (𝟙 Y ≫ g)
  rw [← f.naturality]
  dsimp
  simp

/-- Variant of `yonedaEquiv_naturality` with general `g`. This is technically strictly more general
    than `yonedaEquiv_naturality`, but `yonedaEquiv_naturality` is sometimes preferable because it
    can avoid the "motive is not type correct" error. -/
lemma yonedaEquiv_naturality' {X Y : Cᵒᵖ} {F : Cᵒᵖ ⥤ Type v₁} (f : yoneda.obj (unop X) ⟶ F)
    (g : X ⟶ Y) : F.map g (yonedaEquiv f) = yonedaEquiv (yoneda.map g.unop ≫ f) :=
  yonedaEquiv_naturality _ _

lemma yonedaEquiv_comp {X : C} {F G : Cᵒᵖ ⥤ Type v₁} (α : yoneda.obj X ⟶ F) (β : F ⟶ G) :
    yonedaEquiv (α ≫ β) = β.app _ (yonedaEquiv α) :=
  rfl

lemma yonedaEquiv_yoneda_map {X Y : C} (f : X ⟶ Y) : yonedaEquiv (yoneda.map f) = f := by
  rw [yonedaEquiv_apply]
  simp

lemma yonedaEquiv_symm_naturality_left {X X' : C} (f : X' ⟶ X) (F : Cᵒᵖ ⥤ Type v₁)
    (x : F.obj ⟨X⟩) : yoneda.map f ≫ yonedaEquiv.symm x = yonedaEquiv.symm ((F.map f.op) x) := by
  apply yonedaEquiv.injective
  simp only [yonedaEquiv_comp, yoneda_obj_obj, yonedaEquiv_symm_app_apply, Equiv.apply_symm_apply]
  erw [yonedaEquiv_yoneda_map]

lemma yonedaEquiv_symm_naturality_right (X : C) {F F' : Cᵒᵖ ⥤ Type v₁} (f : F ⟶ F')
    (x : F.obj ⟨X⟩) : yonedaEquiv.symm x ≫ f = yonedaEquiv.symm (f.app ⟨X⟩ x) := by
  apply yonedaEquiv.injective
  simp [yonedaEquiv_comp]

/-- See also `map_yonedaEquiv'` for a more general version. -/
lemma map_yonedaEquiv {X Y : C} {F : Cᵒᵖ ⥤ Type v₁} (f : yoneda.obj X ⟶ F)
    (g : Y ⟶ X) : F.map g.op (yonedaEquiv f) = f.app (op Y) g := by
  rw [yonedaEquiv_naturality, yonedaEquiv_comp, yonedaEquiv_yoneda_map]

/-- Variant of `map_yonedaEquiv` with general `g`. This is technically strictly more general
    than `map_yonedaEquiv`, but `map_yonedaEquiv` is sometimes preferable because it
    can avoid the "motive is not type correct" error. -/
lemma map_yonedaEquiv' {X Y : Cᵒᵖ} {F : Cᵒᵖ ⥤ Type v₁} (f : yoneda.obj (unop X) ⟶ F)
    (g : X ⟶ Y) : F.map g (yonedaEquiv f) = f.app Y g.unop := by
  rw [yonedaEquiv_naturality', yonedaEquiv_comp, yonedaEquiv_yoneda_map]

lemma yonedaEquiv_symm_map {X Y : Cᵒᵖ} (f : X ⟶ Y) {F : Cᵒᵖ ⥤ Type v₁} (t : F.obj X) :
    yonedaEquiv.symm (F.map f t) = yoneda.map f.unop ≫ yonedaEquiv.symm t := by
  obtain ⟨u, rfl⟩ := yonedaEquiv.surjective t
  rw [yonedaEquiv_naturality', Equiv.symm_apply_apply, Equiv.symm_apply_apply]

/-- Two morphisms of presheaves of types `P ⟶ Q` coincide if the precompositions
with morphisms `yoneda.obj X ⟶ P` agree. -/
lemma hom_ext_yoneda {P Q : Cᵒᵖ ⥤ Type v₁} {f g : P ⟶ Q}
    (h : ∀ (X : C) (p : yoneda.obj X ⟶ P), p ≫ f = p ≫ g) :
    f = g := by
  ext X x
  simpa only [yonedaEquiv_comp, Equiv.apply_symm_apply]
    using congr_arg (yonedaEquiv) (h _ (yonedaEquiv.symm x))

variable (C)

/-- The "Yoneda evaluation" functor, which sends `X : Cᵒᵖ` and `F : Cᵒᵖ ⥤ Type`
to `F.obj X`, functorially in both `X` and `F`.
-/
def yonedaEvaluation : Cᵒᵖ × (Cᵒᵖ ⥤ Type v₁) ⥤ Type max u₁ v₁ :=
  evaluationUncurried Cᵒᵖ (Type v₁) ⋙ uliftFunctor

@[simp]
theorem yonedaEvaluation_map_down (P Q : Cᵒᵖ × (Cᵒᵖ ⥤ Type v₁)) (α : P ⟶ Q)
    (x : (yonedaEvaluation C).obj P) :
    ((yonedaEvaluation C).map α x).down = α.2.app Q.1 (P.2.map α.1 x.down) :=
  rfl

/-- The "Yoneda pairing" functor, which sends `X : Cᵒᵖ` and `F : Cᵒᵖ ⥤ Type`
to `yoneda.op.obj X ⟶ F`, functorially in both `X` and `F`.
-/
def yonedaPairing : Cᵒᵖ × (Cᵒᵖ ⥤ Type v₁) ⥤ Type max u₁ v₁ :=
  Functor.prod yoneda.op (𝟭 (Cᵒᵖ ⥤ Type v₁)) ⋙ Functor.hom (Cᵒᵖ ⥤ Type v₁)

@[ext]
lemma yonedaPairingExt {X : Cᵒᵖ × (Cᵒᵖ ⥤ Type v₁)} {x y : (yonedaPairing C).obj X}
    (w : ∀ Y, x.app Y = y.app Y) : x = y :=
  NatTrans.ext (funext w)

@[simp]
theorem yonedaPairing_map (P Q : Cᵒᵖ × (Cᵒᵖ ⥤ Type v₁)) (α : P ⟶ Q) (β : (yonedaPairing C).obj P) :
    (yonedaPairing C).map α β = yoneda.map α.1.unop ≫ β ≫ α.2 :=
  rfl

universe w in
variable {C} in
/-- A bijection `(yoneda.obj X ⋙ uliftFunctor ⟶ F) ≃ F.obj (op X)` which is a variant
of `yonedaEquiv` with heterogeneous universes. -/
def yonedaCompUliftFunctorEquiv (F : Cᵒᵖ ⥤ Type max v₁ w) (X : C) :
    (yoneda.obj X ⋙ uliftFunctor ⟶ F) ≃ F.obj (op X) where
  toFun φ := φ.app (op X) (ULift.up (𝟙 _))
  invFun f :=
    { app := fun _ x => F.map (ULift.down x).op f }
  left_inv φ := by
    ext Y f
    dsimp
    rw [← FunctorToTypes.naturality]
    dsimp
    rw [Category.comp_id]
    rfl
  right_inv f := by simp

/-- The Yoneda lemma asserts that the Yoneda pairing
`(X : Cᵒᵖ, F : Cᵒᵖ ⥤ Type) ↦ (yoneda.obj (unop X) ⟶ F)`
is naturally isomorphic to the evaluation `(X, F) ↦ F.obj X`. -/
@[stacks 001P]
def yonedaLemma : yonedaPairing C ≅ yonedaEvaluation C :=
  NatIso.ofComponents
    (fun _ ↦ Equiv.toIso (yonedaEquiv.trans Equiv.ulift.symm))
    (by intro (X, F) (Y, G) f
        ext (a : yoneda.obj X.unop ⟶ F)
        apply ULift.ext
        simp only [Functor.prod_obj, Functor.id_obj, types_comp_apply, yonedaEvaluation_map_down]
        erw [Equiv.ulift_symm_down, Equiv.ulift_symm_down]
        dsimp [yonedaEquiv]
        simp [← FunctorToTypes.naturality])
