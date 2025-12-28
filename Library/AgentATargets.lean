import VerifiedAgora.tagger

-- Target 1: Basic list property
@[target]
theorem list_length_append (α : Type) (xs ys : List α) :
  (xs ++ ys).length = xs.length + ys.length := by
  induction xs with
  | nil => simp
  | cons head tail ih => simp [ih, Nat.add_comm, Nat.add_assoc]

-- Target 2: Arithmetic identity
@[target]
theorem mul_add_distrib (a b c : Nat) :
  a * (b + c) = a * b + a * c := by
  exact Nat.mul_add a b c

-- Target 3: List reversal property
@[target]
theorem reverse_reverse (α : Type) (xs : List α) :
  xs.reverse.reverse = xs := by
  exact List.reverse_reverse xs
