import VerifiedAgora.tagger

-- Intermediate difficulty targets

@[target]
theorem nat_le_antisymm (a b : Nat) : a ≤ b → b ≤ a → a = b := by
  sorry

@[target]
theorem nat_lt_succ (n : Nat) : n < n + 1 := by
  sorry

@[target]
theorem nat_sub_add_cancel (n m : Nat) (h : m ≤ n) : (n - m) + m = n := by
  sorry

@[target]
theorem nat_div_self (n : Nat) (h : n > 0) : n / n = 1 := by
  sorry
