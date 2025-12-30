import VerifiedAgora.tagger

-- Agent 0's Strategic Targets

@[target]
theorem easy_target_1 (n : Nat) : n + 0 = n := by
  sorry

@[target]
theorem easy_target_2 (n : Nat) : 0 + n = n := by
  sorry

@[target]
theorem easy_target_3 (n m : Nat) : n + m = m + n := by
  sorry

@[target]
theorem medium_target_1 (n m k : Nat) : (n + m) + k = n + (m + k) := by
  sorry

@[target]
theorem medium_target_2 (n m : Nat) : n * m = m * n := by
  sorry

@[target]
theorem medium_target_3 (n : Nat) : n * 1 = n := by
  sorry

@[target]
theorem hard_target_1 (n m k : Nat) : n * (m + k) = n * m + n * k := by
  sorry
