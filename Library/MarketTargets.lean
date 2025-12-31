import VerifiedAgora.tagger

-- Easy target - trivial
@[target]
theorem easy_reflexivity : 5 = 5 := by
  rfl

-- Medium target - requires some thought
@[target]
theorem list_append_assoc {α : Type} (l1 l2 l3 : List α) : 
  (l1 ++ l2) ++ l3 = l1 ++ (l2 ++ l3) := by
  sorry

-- Medium target - basic arithmetic
@[target]
theorem nat_mul_comm (a b : Nat) : a * b = b * a := by
  sorry

-- Medium-hard target
@[target]
theorem list_reverse_append {α : Type} (l1 l2 : List α) :
  (l1 ++ l2).reverse = l2.reverse ++ l1.reverse := by
  sorry

-- Harder target - requires induction
@[target]
theorem nat_add_assoc (a b c : Nat) : (a + b) + c = a + (b + c) := by
  sorry
