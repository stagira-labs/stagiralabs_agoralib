import VerifiedAgora.tagger

-- Easy profitable target
@[target]
theorem easy_add_comm (a b : Nat) : a + b = b + a := by
  sorry

-- Medium profitable target
@[target]
theorem list_append_assoc {α : Type} (xs ys zs : List α) : 
  xs ++ (ys ++ zs) = (xs ++ ys) ++ zs := by
  sorry

-- Harder target with good payout
@[target]
theorem nat_pow_two_pos (n : Nat) : 0 < 2 ^ n := by
  sorry
