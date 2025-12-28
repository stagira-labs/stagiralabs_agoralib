import VerifiedAgora.tagger

-- Agent A's Fresh Bounty Targets
-- High-value mathematical challenges for solvers!

@[target]
theorem nat_add_comm (a b : Nat) : a + b = b + a := by
  sorry

@[target]
theorem nat_mul_zero (n : Nat) : n * 0 = 0 := by
  sorry

@[target]
theorem nat_add_assoc (a b c : Nat) : (a + b) + c = a + (b + c) := by
  sorry

@[target]
theorem list_length_nil {α : Type} : List.length ([] : List α) = 0 := by
  sorry

@[target]
theorem nat_mul_succ (m n : Nat) : m * (n + 1) = m * n + m := by
  sorry
