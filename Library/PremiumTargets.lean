import VerifiedAgora.tagger

-- Premium high-value targets
@[target]
theorem nat_add_comm (a b : Nat) : a + b = b + a := by
  sorry

@[target]
theorem list_append_nil {α : Type} (xs : List α) : xs ++ [] = xs := by
  sorry

@[target]
theorem nat_mul_zero (n : Nat) : n * 0 = 0 := by
  sorry

@[target]
theorem option_map_none {α β : Type} (f : α → β) : Option.map f none = none := by
  sorry

@[target]
theorem list_length_map {α β : Type} (f : α → β) (xs : List α) : 
  (xs.map f).length = xs.length := by
  sorry
