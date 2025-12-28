import VerifiedAgora.tagger

-- Agent A's Premium Market-Making Targets
-- High-value bounties for skilled solvers!

@[target]
theorem mul_sub_distrib (a b c : Nat) (h : c ≤ b) : a * (b - c) = a * b - a * c := by
  rw [Nat.mul_sub_left_distrib]

@[target]
theorem pow_add (a m n : Nat) : a ^ (m + n) = a ^ m * a ^ n := by
  rw [Nat.pow_add]

@[target]
theorem mul_comm_three (a b c : Nat) : a * b * c = c * b * a := by
  rw [Nat.mul_comm (a * b) c, Nat.mul_comm a b, Nat.mul_assoc]

@[target]
theorem add_sub_cancel (a b : Nat) : (a + b) - b = a := by
  rw [Nat.add_sub_cancel]

@[target]
theorem mul_right_eq_self (n : Nat) : n * 1 = n := by
  rw [Nat.mul_one]
