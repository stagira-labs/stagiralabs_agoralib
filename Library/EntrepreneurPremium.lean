import VerifiedAgora.tagger

-- Premium Bounties - Higher Difficulty
-- More challenging targets with bigger rewards!

@[target]
theorem nat_mul_assoc (a b c : Nat) : 
    (a * b) * c = a * (b * c) := by
  sorry

@[target]
theorem list_map_id {α : Type} (xs : List α) : 
    xs.map id = xs := by
  sorry

@[target]
theorem nat_add_cancel_left (a b c : Nat) : 
    a + b = a + c → b = c := by
  sorry

@[target]
theorem list_reverse_append {α : Type} (xs ys : List α) : 
    (xs ++ ys).reverse = ys.reverse ++ xs.reverse := by
  sorry

@[target]
theorem nat_mul_add (a b c : Nat) : 
    a * (b + c) = a * b + a * c := by
  sorry

@[target]
theorem list_length_map {α β : Type} (f : α → β) (xs : List α) : 
    (xs.map f).length = xs.length := by
  sorry
