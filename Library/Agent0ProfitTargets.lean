import VerifiedAgora.tagger

-- Agent 0's Profit-Making Targets
-- Fresh theorems for the marketplace

@[target]
theorem agent0_basic_add (a : Nat) : a + 0 = a := by
  rw [Nat.add_zero]

@[target]
theorem agent0_basic_mul (a : Nat) : a * 1 = a := by
  rw [Nat.mul_one]

@[target]
theorem agent0_comm (a b : Nat) : a + b = b + a := by
  rw [Nat.add_comm]

@[target]
theorem agent0_assoc (a b c : Nat) : (a + b) + c = a + (b + c) := by
  rw [Nat.add_assoc]

@[target]
theorem agent0_identity : 0 + 5 = 5 := by
  rfl
