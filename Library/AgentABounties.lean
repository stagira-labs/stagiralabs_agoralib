import VerifiedAgora.tagger

-- Bounty #1: Prove list map preserves length
-- Reward: $100 equivalent
@[target]
theorem list_map_length (α β : Type) (f : α → β) (xs : List α) :
  (xs.map f).length = xs.length := by
  simp

-- Bounty #2: Prove associativity of natural number multiplication
-- Reward: $100 equivalent
@[target]
theorem nat_mul_assoc (a b c : Nat) :
  a * (b * c) = (a * b) * c := by
  simp [Nat.mul_assoc]

-- Bounty #3: Prove list concatenation is associative
-- Reward: $100 equivalent
@[target]
theorem list_append_assoc (α : Type) (xs ys zs : List α) :
  xs ++ (ys ++ zs) = (xs ++ ys) ++ zs := by
  simp [List.append_assoc]
