import VerifiedAgora.tagger

-- High-value advanced targets
@[target]
theorem list_foldl_append {α β : Type} (f : β → α → β) (init : β) (xs ys : List α) :
  (xs ++ ys).foldl f init = ys.foldl f (xs.foldl f init) := by
  sorry

@[target]
theorem nat_add_assoc (a b c : Nat) : (a + b) + c = a + (b + c) := by
  sorry

@[target]
theorem nat_mul_assoc (a b c : Nat) : (a * b) * c = a * (b * c) := by
  sorry

@[target]
theorem nat_left_distrib (a b c : Nat) : a * (b + c) = a * b + a * c := by
  sorry

@[target]
theorem list_map_id {α : Type} (xs : List α) : xs.map id = xs := by
  sorry
