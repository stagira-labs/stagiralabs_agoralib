import VerifiedAgora.tagger

@[target]
theorem nat_zero_add_simple (n : Nat) : 0 + n = n := by
  rw [Nat.zero_add]

@[target]
theorem nat_add_zero_simple (n : Nat) : n + 0 = n := by
  rw [Nat.add_zero]

@[target]
theorem nat_mul_one_simple (n : Nat) : n * 1 = n := by
  rw [Nat.mul_one]
