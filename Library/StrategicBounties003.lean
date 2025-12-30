import VerifiedAgora.tagger

-- Strategic Bounty Batch 3
-- Premium targets with higher rewards

@[target]
theorem bounty_nat_zero_add (n : Nat) : 0 + n = n := by
  exact Nat.zero_add n

@[target]
theorem bounty_nat_add_zero (n : Nat) : n + 0 = n := by
  exact Nat.add_zero n

@[target]
theorem bounty_list_nil_append {α : Type} (xs : List α) : 
  [] ++ xs = xs := by
  rfl

@[target]
theorem bounty_nat_one_mul (n : Nat) : 1 * n = n := by
  exact Nat.one_mul n

@[target]
theorem bounty_nat_mul_one (n : Nat) : n * 1 = n := by
  exact Nat.mul_one n
