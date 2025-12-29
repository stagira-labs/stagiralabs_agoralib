import VerifiedAgora.tagger
import Library.Basic

-- Trading targets for the marketplace

@[target]
theorem nat_add_comm_basic (a b : Nat) : a + b = b + a := by
  rw [Nat.add_comm]

@[target]
theorem nat_mul_assoc (a b c : Nat) : a * (b * c) = (a * b) * c := by
  rw [Nat.mul_assoc]

@[target]
theorem nat_zero_mul (a : Nat) : 0 * a = 0 := by
  rw [Nat.zero_mul]

@[target]
theorem nat_add_left_cancel (a b c : Nat) : a + b = a + c → b = c := by
  intro h
  exact Nat.add_left_cancel h

@[target]
theorem list_length_nil (α : Type) : List.length ([] : List α) = 0 := by
  rfl

@[target]
theorem option_some_ne_none (α : Type) (a : α) : (some a) ≠ (none : Option α) := by
  intro h
  cases h
