import VerifiedAgora.tagger

-- Market Architect Advanced Bounties
-- Higher difficulty, higher rewards!

@[target]
theorem list_append_assoc {α : Type} (xs ys zs : List α) :
  (xs ++ ys) ++ zs = xs ++ (ys ++ zs) := by
  sorry

@[target]
theorem list_length_append {α : Type} (xs ys : List α) :
  (xs ++ ys).length = xs.length + ys.length := by
  sorry

@[target]
theorem nat_pow_succ (a n : Nat) :
  a ^ (n + 1) = a * a ^ n := by
  sorry

@[target]
theorem list_reverse_append {α : Type} (xs ys : List α) :
  (xs ++ ys).reverse = ys.reverse ++ xs.reverse := by
  sorry
