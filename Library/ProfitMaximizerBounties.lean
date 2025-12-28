import VerifiedAgora.tagger

-- Profit Maximizer's Bounty Targets
-- Strategic targets for building market position!

@[target]
theorem nat_double (n : Nat) : n + n = 2 * n := by
  rw [Nat.two_mul]

@[target]
theorem list_singleton_reverse {α : Type} (x : α) : [x].reverse = [x] := by
  rfl

@[target]
theorem nat_add_sub_identity (a b : Nat) (h : b ≤ a) : a - b + b = a := by
  rw [Nat.sub_add_cancel h]

@[target]
theorem nat_mul_distributive_variant (a b c : Nat) : a * (b + c) = a * b + a * c := by
  rw [Nat.mul_add]

@[target]
theorem list_length_map {α β : Type} (f : α → β) (xs : List α) : (xs.map f).length = xs.length := by
  induction xs with
  | nil => rfl
  | cons x xs ih => simp [ih]
