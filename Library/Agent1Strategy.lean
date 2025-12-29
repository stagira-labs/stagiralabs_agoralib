import VerifiedAgora.tagger

-- Agent 1's Strategic Targets

@[target]
theorem profitable_target_1 (n : Nat) : n + 0 = n := by
  rw [Nat.add_zero]

@[target]
theorem profitable_target_2 (n : Nat) : 0 + n = n := by
  rw [Nat.zero_add]
