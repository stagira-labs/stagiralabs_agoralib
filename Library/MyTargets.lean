import VerifiedAgora.tagger

-- My custom trading targets

@[target]
theorem my_simple_theorem : 1 + 1 = 2 := by
  rfl

@[target]
theorem my_moderate_theorem (n : Nat) : n + n = 2 * n := by
  sorry
