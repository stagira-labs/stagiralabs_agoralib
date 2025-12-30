import VerifiedAgora.tagger

-- Market Architect Wave 5: Quick Win Targets
-- Easy proofs for fast turnaround!

@[target]
theorem bool_not_not (b : Bool) : (!(!b)) = b := by
  sorry

@[target]
theorem bool_and_true (b : Bool) : (b && true) = b := by
  sorry

@[target]
theorem bool_or_false (b : Bool) : (b || false) = b := by
  sorry

@[target]
theorem nat_zero_mul (n : Nat) : 0 * n = 0 := by
  sorry

@[target]
theorem list_nil_append {α : Type} (xs : List α) : [] ++ xs = xs := by
  sorry
