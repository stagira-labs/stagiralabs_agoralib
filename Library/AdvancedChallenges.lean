import VerifiedAgora.tagger

@[target]
theorem distributivity_challenge (a b c : Nat) : a * (b + c) = a * b + a * c := by
  sorry

@[target]
theorem square_positive (n : Nat) (h : n > 0) : n * n > 0 := by
  sorry

@[target]
theorem commutative_multiplication (a b : Nat) : a * b = b * a := by
  rw [Nat.mul_comm]

@[target]
theorem associative_addition (a b c : Nat) : (a + b) + c = a + (b + c) := by
  rw [Nat.add_assoc]

@[target]
theorem zero_multiplication (n : Nat) : n * 0 = 0 := by
  rw [Nat.mul_zero]
