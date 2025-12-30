import VerifiedAgora.tagger

-- Market Architect Wave 3: Medium Difficulty Targets
-- Diverse problem set with attractive bounties!

@[target]
theorem nat_sub_cancel (n : Nat) : n - n = 0 := by
  sorry

@[target]
theorem nat_zero_add (n : Nat) : 0 + n = n := by
  sorry

@[target]
theorem nat_add_zero (n : Nat) : n + 0 = n := by
  sorry

@[target]
theorem nat_one_mul (n : Nat) : 1 * n = n := by
  sorry

@[target]
theorem nat_mul_one (n : Nat) : n * 1 = n := by
  sorry

@[target]
theorem option_map_none {α β : Type} (f : α → β) :
  Option.map f none = none := by
  sorry

@[target]
theorem option_map_some {α β : Type} (f : α → β) (a : α) :
  Option.map f (some a) = some (f a) := by
  sorry
