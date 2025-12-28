import VerifiedAgora.tagger

-- My Profit-Making Targets
-- Simple yet valuable theorems

@[target]
theorem simple_addition (n : Nat) : n + 0 = n := by
  rw [Nat.add_zero]

@[target]
theorem zero_addition (n : Nat) : 0 + n = n := by
  rw [Nat.zero_add]

@[target]
theorem mul_zero_right (n : Nat) : n * 0 = 0 := by
  rw [Nat.mul_zero]

@[target]
theorem one_mul (n : Nat) : 1 * n = n := by
  rw [Nat.one_mul]
