import VerifiedAgora.tagger

@[target]
theorem list_length_cons {α : Type} (x : α) (xs : List α) :
  (x :: xs).length = xs.length + 1 := by
  rfl

@[target]
theorem nat_add_zero (n : Nat) :
  n + 0 = n := by
  rfl

@[target]
theorem nat_zero_add (n : Nat) :
  0 + n = n := by
  simp

@[target]
theorem list_append_nil {α : Type} (xs : List α) :
  xs ++ [] = xs := by
  simp

@[target]
theorem nat_succ_ne_self (n : Nat) :
  n.succ ≠ n := by
  intro h
  cases h
