import VerifiedAgora.tagger

-- Super easy targets for quick profits
@[target]
theorem nat_add_zero (n : Nat) : n + 0 = n := by
  sorry

@[target]
theorem nat_zero_mul (n : Nat) : 0 * n = 0 := by
  sorry

@[target]
theorem nat_mul_comm (a b : Nat) : a * b = b * a := by
  sorry

@[target]
theorem nat_one_mul (n : Nat) : 1 * n = n := by
  sorry

@[target]
theorem nat_mul_one (n : Nat) : n * 1 = n := by
  sorry

@[target]
theorem bool_not_not (b : Bool) : (!(!b)) = b := by
  sorry
