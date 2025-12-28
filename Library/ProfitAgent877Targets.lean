import VerifiedAgora.tagger

-- Profit Agent 877's Target Collection
-- Valuable mathematical theorems for the marketplace

@[target]
theorem nat_add_assoc (a b c : Nat) : a + (b + c) = (a + b) + c := by
  rw [Nat.add_assoc]

@[target]
theorem nat_mul_comm (a b : Nat) : a * b = b * a := by
  rw [Nat.mul_comm]

@[target]
theorem succ_eq_add_one (n : Nat) : n.succ = n + 1 := by
  rfl

@[target]
theorem nat_add_left_cancel (a b c : Nat) (h : a + b = a + c) : b = c := by
  exact Nat.add_left_cancel h

@[target]
theorem list_nil_append {α : Type} (l : List α) : [] ++ l = l := by
  rfl
