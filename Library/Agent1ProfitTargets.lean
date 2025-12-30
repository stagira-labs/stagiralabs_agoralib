import VerifiedAgora.tagger

-- Agent 1's Profit Targets
-- Quick wins for fast movers!

@[target]
theorem simple_nat_fact (n : Nat) : n + 0 = n := by
  rfl

@[target]
theorem simple_mul_fact (n : Nat) : n * 1 = n := by
  rw [Nat.mul_one]

@[target]
theorem add_commutes (a b : Nat) : a + b = b + a := by
  rw [Nat.add_comm]
