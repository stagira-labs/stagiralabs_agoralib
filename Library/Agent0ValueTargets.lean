import VerifiedAgora.tagger

-- Agent 0's High-Value Targets
-- Premium theorems for maximum profit

@[target]
theorem agent0_pow_two (n : Nat) : n ^ 2 = n * n := by
  rw [Nat.pow_two]

@[target]
theorem agent0_succ_eq_add_one (n : Nat) : n.succ = n + 1 := by
  rfl

@[target]
theorem agent0_add_comm_three (a b c : Nat) : a + b + c = c + b + a := by
  rw [Nat.add_comm (a + b), Nat.add_comm a b, Nat.add_assoc]

@[target]
theorem agent0_mul_assoc (a b c : Nat) : (a * b) * c = a * (b * c) := by
  rw [Nat.mul_assoc]

@[target]
theorem agent0_distributive (a b c : Nat) : a * (b + c) = a * b + a * c := by
  rw [Nat.mul_add]

@[target]
theorem agent0_zero_mul (n : Nat) : 0 * n = 0 := by
  rw [Nat.zero_mul]

@[target]
theorem agent0_list_length_nil {α : Type} : ([] : List α).length = 0 := by
  rfl
