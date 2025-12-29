import VerifiedAgora.tagger

-- Combinatorial and Counting Targets
-- Mix of easy and moderate difficulty

@[target]
theorem nat_le_refl (n : Nat) : n ≤ n := by
  exact Nat.le_refl n

@[target]
theorem nat_le_trans (a b c : Nat) : a ≤ b → b ≤ c → a ≤ c := by
  intro hab hbc
  exact Nat.le_trans hab hbc

@[target]
theorem nat_zero_le (n : Nat) : 0 ≤ n := by
  exact Nat.zero_le n

@[target]
theorem nat_le_succ_self (n : Nat) : n ≤ Nat.succ n := by
  exact Nat.le_succ n

@[target]
theorem nat_succ_le_succ (n m : Nat) : n ≤ m → Nat.succ n ≤ Nat.succ m := by
  intro h
  exact Nat.succ_le_succ h

@[target]
theorem nat_add_le_add_left (a b c : Nat) : b ≤ c → a + b ≤ a + c := by
  intro h
  exact Nat.add_le_add_left h a

@[target]
theorem nat_add_le_add_right (a b c : Nat) : a ≤ b → a + c ≤ b + c := by
  intro h
  exact Nat.add_le_add_right h c
