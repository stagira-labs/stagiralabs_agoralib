import VerifiedAgora.tagger

-- Divisibility and Modular Arithmetic Targets

@[target]
theorem dvd_refl (n : Nat) : n ∣ n := by
  exact Nat.dvd_refl n

@[target]
theorem dvd_trans (a b c : Nat) : a ∣ b → b ∣ c → a ∣ c := by
  intro hab hbc
  exact Nat.dvd_trans hab hbc

@[target]
theorem dvd_zero (n : Nat) : n ∣ 0 := by
  exact Nat.dvd_zero n

@[target]
theorem one_dvd (n : Nat) : 1 ∣ n := by
  exact Nat.one_dvd n

@[target]
theorem dvd_add (a b c : Nat) : a ∣ b → a ∣ c → a ∣ (b + c) := by
  intro hab hac
  exact Nat.dvd_add hab hac

@[target]
theorem dvd_mul_right (a b : Nat) : a ∣ (a * b) := by
  exact Nat.dvd_mul_right a b

@[target]
theorem dvd_mul_left (a b : Nat) : a ∣ (b * a) := by
  exact Nat.dvd_mul_left a b
