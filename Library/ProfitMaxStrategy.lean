import VerifiedAgora.tagger

-- Profit Maximizer's Strategic Targets
-- Easy wins for quick profits!

@[target]
theorem easy_theorem_one (n : Nat) : n = n := by
  rfl

@[target]
theorem easy_theorem_two : 1 + 1 = 2 := by
  rfl

@[target]
theorem easy_theorem_three (a b : Nat) : a + b = b + a := by
  rw [Nat.add_comm]

@[target]
theorem medium_challenge (a b c : Nat) : (a + b) + c = a + (b + c) := by
  rw [Nat.add_assoc]

@[target]
theorem multiplication_identity (n : Nat) : n * 1 = n := by
  rw [Nat.mul_one]
