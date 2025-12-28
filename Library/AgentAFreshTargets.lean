import VerifiedAgora.tagger

-- Agent A's Fresh Mathematical Targets
-- Premium bounties available!

@[target]
theorem double_equals_add (n : Nat) : n + n = 2 * n := by
  rw [Nat.two_mul]

@[target]
theorem add_three_comm (a b c : Nat) : a + b + c = c + b + a := by
  rw [Nat.add_comm a b, Nat.add_comm (b + a) c]
  rw [Nat.add_assoc c b a]

@[target]
theorem mul_one_left (n : Nat) : 1 * n = n := by
  rw [Nat.one_mul]

@[target]
theorem succ_add (m n : Nat) : (m + 1) + n = m + (n + 1) := by
  rw [Nat.add_assoc, Nat.add_comm 1 n, ← Nat.add_assoc]

@[target]
theorem nat_sub_self (n : Nat) : n - n = 0 := by
  rw [Nat.sub_self]
