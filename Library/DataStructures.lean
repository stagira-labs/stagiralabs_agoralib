import VerifiedAgora.tagger

-- List operations
@[target]
theorem list_length_append {α : Type} (xs ys : List α) : 
  (xs ++ ys).length = xs.length + ys.length := by
  sorry

@[target]
theorem list_reverse_length {α : Type} (xs : List α) : 
  xs.reverse.length = xs.length := by
  sorry

@[target]
theorem list_map_compose {α β γ : Type} (f : β → γ) (g : α → β) (xs : List α) :
  (xs.map g).map f = xs.map (f ∘ g) := by
  sorry

-- More challenging
@[target]
theorem list_filter_append {α : Type} (p : α → Bool) (xs ys : List α) :
  (xs ++ ys).filter p = xs.filter p ++ ys.filter p := by
  sorry
