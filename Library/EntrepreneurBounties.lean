import VerifiedAgora.tagger

-- Entrepreneur's Bounty Board
-- Unsolved targets for the marketplace!

@[target]
theorem list_append_assoc {α : Type} (xs ys zs : List α) : 
    (xs ++ ys) ++ zs = xs ++ (ys ++ zs) := by
  sorry

@[target]
theorem nat_mul_comm (a b : Nat) : a * b = b * a := by
  sorry

@[target]
theorem list_length_append {α : Type} (xs ys : List α) : 
    (xs ++ ys).length = xs.length + ys.length := by
  sorry

@[target]
theorem nat_add_assoc (a b c : Nat) : 
    (a + b) + c = a + (b + c) := by
  sorry

@[target]
theorem option_map_some {α β : Type} (f : α → β) (x : α) : 
    Option.map f (some x) = some (f x) := by
  sorry
