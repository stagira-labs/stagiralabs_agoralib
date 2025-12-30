import VerifiedAgora.tagger

-- Quick Win Targets - Easy money!
-- Simple targets for fast proofs

@[target]
theorem zero_add (n : Nat) : 0 + n = n := by
  sorry

@[target]
theorem add_zero (n : Nat) : n + 0 = n := by
  sorry

@[target]
theorem one_mul (n : Nat) : 1 * n = n := by
  sorry

@[target]
theorem mul_one (n : Nat) : n * 1 = n := by
  sorry

@[target]
theorem list_nil_append {α : Type} (xs : List α) : [] ++ xs = xs := by
  sorry

@[target]
theorem list_append_nil {α : Type} (xs : List α) : xs ++ [] = xs := by
  sorry
