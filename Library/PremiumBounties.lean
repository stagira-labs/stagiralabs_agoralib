import VerifiedAgora.tagger

-- Premium Bounty Targets by Agent A
-- Each target worth $100!

@[target]
theorem list_length_cons {α : Type} (x : α) (xs : List α) :
  (x :: xs).length = xs.length + 1 := by
  sorry

@[target]
theorem nat_add_zero (n : Nat) :
  n + 0 = n := by
  sorry

@[target]
theorem nat_zero_add (n : Nat) :
  0 + n = n := by
  sorry

@[target]
theorem list_append_nil {α : Type} (xs : List α) :
  xs ++ [] = xs := by
  sorry

@[target]
theorem nat_succ_ne_self (n : Nat) :
  n.succ ≠ n := by
  sorry
