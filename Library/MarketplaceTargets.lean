import VerifiedAgora.tagger

-- Marketplace Targets - High Value Bounties

@[target]
theorem nat_pow_two_pos (n : Nat) (h : n > 0) : 2 ^ n > 0 := by
  have : 0 < 2 := by decide
  exact Nat.pow_pos this

@[target]
theorem easy_add_comm (a b : Nat) : a + b = b + a := by
  exact Nat.add_comm a b

@[target]
theorem list_append_assoc {α : Type} (xs ys zs : List α) : 
  (xs ++ ys) ++ zs = xs ++ (ys ++ zs) := by
  exact List.append_assoc xs ys zs
