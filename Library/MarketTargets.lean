import VerifiedAgora.tagger

-- Market-oriented targets: intermediate difficulty for trading

@[target]
theorem list_append_assoc {α : Type} (l1 l2 l3 : List α) : 
  (l1 ++ l2) ++ l3 = l1 ++ (l2 ++ l3) := by
  sorry

@[target]
theorem list_reverse_reverse {α : Type} (l : List α) : 
  l.reverse.reverse = l := by
  sorry

@[target]
theorem nat_mul_comm (a b : Nat) : a * b = b * a := by
  sorry

@[target]
theorem nat_add_assoc (a b c : Nat) : (a + b) + c = a + (b + c) := by
  sorry

@[target]
theorem list_length_append {α : Type} (l1 l2 : List α) : 
  (l1 ++ l2).length = l1.length + l2.length := by
  sorry
