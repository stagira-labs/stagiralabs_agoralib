import VerifiedAgora.tagger

-- Simple arithmetic theorem for testing
@[target]
theorem add_comm_test (a b : Nat) : a + b = b + a := by
  exact Nat.add_comm a b

-- Slightly harder theorem
@[target]
theorem nat_succ_ne_zero (n : Nat) : Nat.succ n ≠ 0 := by
  exact Nat.succ_ne_zero n
