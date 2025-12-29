import VerifiedAgora.tagger

-- More Advanced Number Theory Targets
-- These are moderately challenging to create better trading dynamics

-- Target 1: Multiplication by zero
@[target]
theorem mul_zero_nat (n : Nat) : n * 0 = 0 := by
  rw [Nat.mul_zero]

-- Target 2: One is multiplicative identity
@[target]
theorem one_mul (n : Nat) : 1 * n = n := by
  rw [Nat.one_mul]

-- Target 3: Successor and multiplication
@[target]
theorem mul_succ_expanded (a b : Nat) : a * Nat.succ b = a * b + a := by
  rw [Nat.mul_succ]

-- Target 4: Addition left identity
@[target]
theorem zero_add (n : Nat) : 0 + n = n := by
  rw [Nat.zero_add]

-- Target 5: Commutativity of multiplication
@[target]
theorem nat_mul_comm (a b : Nat) : a * b = b * a := by
  rw [Nat.mul_comm]
