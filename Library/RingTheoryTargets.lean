import VerifiedAgora.tagger

-- Ring Theory and Advanced Algebra Targets
-- Higher value, more complex targets

-- Distributive properties
@[target]
theorem left_distrib_nat (a b c : Nat) : a * (b + c) = a * b + a * c := by
  sorry

-- Power laws
@[target]
theorem pow_zero (a : Nat) : a ^ 0 = 1 := by
  sorry

@[target]
theorem pow_one (a : Nat) : a ^ 1 = a := by
  sorry

@[target]
theorem pow_two (a : Nat) : a ^ 2 = a * a := by
  sorry

-- Cancellation
@[target]
theorem add_right_cancel (a b c : Nat) : a + b = a + c → b = c := by
  sorry
