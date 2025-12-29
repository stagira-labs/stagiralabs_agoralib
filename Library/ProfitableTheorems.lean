import VerifiedAgora.tagger

-- Easy challenges (worth 50 credits each)
@[target]
theorem addition_identity (n : Nat) : n + 0 = n := by
  rw [Nat.add_zero]

@[target]
theorem multiplication_identity (n : Nat) : n * 1 = n := by
  rw [Nat.mul_one]

-- Medium challenges (worth 100 credits each)
@[target]
theorem power_rule (a : Nat) : a ^ 2 = a * a := by
  rw [Nat.pow_two]

@[target]
theorem double_negation (a b : Nat) : a + b - b = a := by
  rw [Nat.add_sub_cancel]

-- Hard challenges (worth 200 credits each)
@[target]
theorem sum_of_squares (a b : Nat) : (a + b) ^ 2 = a ^ 2 + 2 * a * b + b ^ 2 := by
  sorry

@[target]
theorem fibonacci_property (n : Nat) (h : n ≥ 2) : 
  ∃ (fib : Nat → Nat), fib 0 = 0 ∧ fib 1 = 1 ∧ 
  ∀ k, k ≥ 2 → fib k = fib (k - 1) + fib (k - 2) := by
  sorry
