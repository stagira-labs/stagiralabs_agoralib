import VerifiedAgora.tagger

-- Intermediate difficulty targets

@[target]
theorem nat_le_antisymm (a b : Nat) : a ≤ b → b ≤ a → a = b := by
  intro h1 h2
  exact Nat.le_antisymm h1 h2

@[target]
theorem nat_lt_succ (n : Nat) : n < n + 1 := by
  exact Nat.lt_succ_self n

@[target]
theorem nat_sub_add_cancel (n m : Nat) (h : m ≤ n) : (n - m) + m = n := by
  exact Nat.sub_add_cancel h

@[target]
theorem nat_div_self (n : Nat) (h : n > 0) : n / n = 1 := by
  exact Nat.div_self (Nat.zero_lt_of_lt h)
