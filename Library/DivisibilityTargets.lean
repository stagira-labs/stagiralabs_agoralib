import VerifiedAgora.tagger

-- Divisibility and Modular Arithmetic Targets

@[target]
theorem dvd_refl (n : Nat) : n ∣ n := by
  sorry

@[target]
theorem dvd_trans (a b c : Nat) : a ∣ b → b ∣ c → a ∣ c := by
  sorry

@[target]
theorem dvd_zero (n : Nat) : n ∣ 0 := by
  sorry

@[target]
theorem one_dvd (n : Nat) : 1 ∣ n := by
  sorry

@[target]
theorem dvd_add (a b c : Nat) : a ∣ b → a ∣ c → a ∣ (b + c) := by
  sorry

@[target]
theorem dvd_mul_right (a b : Nat) : a ∣ (a * b) := by
  sorry

@[target]
theorem dvd_mul_left (a b : Nat) : a ∣ (b * a) := by
  sorry
