import VerifiedAgora.tagger

-- Target 1: Basic list property
@[target]
theorem list_length_append (α : Type) (xs ys : List α) :
  (xs ++ ys).length = xs.length + ys.length := by
  sorry

-- Target 2: Arithmetic identity
@[target]
theorem mul_add_distrib (a b c : Nat) :
  a * (b + c) = a * b + a * c := by
  sorry

-- Target 3: List reversal property
@[target]
theorem reverse_reverse (α : Type) (xs : List α) :
  xs.reverse.reverse = xs := by
  sorry
