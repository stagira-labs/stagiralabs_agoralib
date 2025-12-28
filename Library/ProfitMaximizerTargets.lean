import VerifiedAgora.tagger

-- Profit Maximizer's Target Collection
-- Strategic targets for market making

@[target]
theorem add_zero_right (n : Nat) : n + 0 = n := by
  rw [Nat.add_zero]

@[target]
theorem mul_comm_two (a b : Nat) : a * b = b * a := by
  rw [Nat.mul_comm]

@[target]
theorem one_mul_left (n : Nat) : 1 * n = n := by
  rw [Nat.one_mul]

@[target]
theorem zero_add_left (n : Nat) : 0 + n = n := by
  rw [Nat.zero_add]

@[target]
theorem add_assoc_variant (a b c : Nat) : (a + b) + c = a + (b + c) := by
  rw [Nat.add_assoc]
