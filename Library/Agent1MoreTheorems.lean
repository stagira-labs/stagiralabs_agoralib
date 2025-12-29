import VerifiedAgora.tagger

@[target]
theorem pow_theorem (a m n : Nat) : a ^ (m + n) = a ^ m * a ^ n := by
  rw [Nat.pow_add]

@[target]
theorem triple_add (a b c : Nat) : a + (b + c) = (a + b) + c := by
  rw [Nat.add_assoc]

@[target]
theorem zero_prop (n : Nat) : n + 0 = n := by
  rw [Nat.add_zero]

@[target]
theorem one_prop (n : Nat) : n * 1 = n := by
  rw [Nat.mul_one]
