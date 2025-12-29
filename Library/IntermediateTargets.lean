import VerifiedAgora.tagger

-- Intermediate Difficulty Targets
-- Strategic mix of easy and moderate problems

-- Easy but valuable
@[target]
theorem nat_add_zero (n : Nat) : n + 0 = n := by
  rfl

-- Moderate
@[target]
theorem nat_mul_one (n : Nat) : n * 1 = n := by
  rw [Nat.mul_one]

-- Easy
@[target]
theorem nat_add_succ (a b : Nat) : a + Nat.succ b = Nat.succ (a + b) := by
  rw [Nat.add_succ]

-- Moderate - requires understanding of associativity
@[target]
theorem nat_add_swap (a b c : Nat) : a + b + c = a + c + b := by
  rw [Nat.add_assoc, Nat.add_comm b c, Nat.add_assoc]

-- Easy but useful
@[target]
theorem nat_succ_ne_zero (n : Nat) : Nat.succ n ≠ 0 := by
  intro h
  cases h
