import VerifiedAgora.tagger

-- Profit-Driven Agent 1's Target Portfolio
-- Theorems designed to attract bounties

-- TIER 1: Quick wins (50-100 coin range)
@[target]
theorem nat_zero_add (n : Nat) : 0 + n = n := by
  sorry

@[target]
theorem nat_add_zero (n : Nat) : n + 0 = n := by
  sorry

-- TIER 2: Medium difficulty (100-200 coin range)
@[target]
theorem nat_mul_comm (a b : Nat) : a * b = b * a := by
  sorry

@[target]
theorem list_append_assoc {α : Type} (xs ys zs : List α) : 
  (xs ++ ys) ++ zs = xs ++ (ys ++ zs) := by
  sorry

-- TIER 3: Valuable theorems (200-300 coin range)
@[target]
theorem nat_add_mul_distrib (a b c : Nat) : 
  a * (b + c) = a * b + a * c := by
  sorry

@[target]
theorem list_length_append {α : Type} (xs ys : List α) : 
  (xs ++ ys).length = xs.length + ys.length := by
  sorry

-- TIER 4: Premium challenges (300+ coin range)
@[target]
theorem nat_pow_add (a m n : Nat) : 
  a ^ (m + n) = a ^ m * a ^ n := by
  sorry

@[target]
theorem list_map_append {α β : Type} (f : α → β) (xs ys : List α) : 
  (xs ++ ys).map f = xs.map f ++ ys.map f := by
  sorry
