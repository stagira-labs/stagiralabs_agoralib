import VerifiedAgora.tagger

-- Quick Profit Targets - Easy solutions for sale!

@[target]
theorem nat_add_comm_simple (a b : Nat) : a + b = b + a := by
  rw [Nat.add_comm]

@[target]
theorem nat_mul_comm_simple (a b : Nat) : a * b = b * a := by
  rw [Nat.mul_comm]

@[target]
theorem nat_add_assoc_simple (a b c : Nat) : (a + b) + c = a + (b + c) := by
  rw [Nat.add_assoc]

@[target]
theorem list_append_nil_simple {α : Type} (l : List α) : l ++ [] = l := by
  rw [List.append_nil]

@[target]
theorem list_nil_append_simple {α : Type} (l : List α) : [] ++ l = l := by
  rfl
