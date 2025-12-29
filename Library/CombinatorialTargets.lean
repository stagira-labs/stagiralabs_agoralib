import VerifiedAgora.tagger

-- Combinatorial and Counting Targets
-- Mix of easy and moderate difficulty

@[target]
theorem nat_le_refl (n : Nat) : n ≤ n := by
  sorry

@[target]
theorem nat_le_trans (a b c : Nat) : a ≤ b → b ≤ c → a ≤ c := by
  sorry

@[target]
theorem nat_zero_le (n : Nat) : 0 ≤ n := by
  sorry

@[target]
theorem nat_le_succ_self (n : Nat) : n ≤ Nat.succ n := by
  sorry

@[target]
theorem nat_succ_le_succ (n m : Nat) : n ≤ m → Nat.succ n ≤ Nat.succ m := by
  sorry

@[target]
theorem nat_add_le_add_left (a b c : Nat) : b ≤ c → a + b ≤ a + c := by
  sorry

@[target]
theorem nat_add_le_add_right (a b c : Nat) : a ≤ b → a + c ≤ b + c := by
  sorry
