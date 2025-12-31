import VerifiedAgora.tagger

-- Very easy targets I can prove immediately
@[target]
theorem agent3_easy1 : 3 = 3 := by
  rfl

@[target]
theorem agent3_easy2 : 10 + 5 = 15 := by
  sorry

-- Easy-medium targets
@[target]
theorem agent3_med1 (n : Nat) : n + 0 = n := by
  sorry

@[target]
theorem agent3_med2 (n : Nat) : 0 + n = n := by
  sorry

-- Medium targets  
@[target]
theorem agent3_med3 (a b : Nat) : a + b = b + a := by
  sorry
