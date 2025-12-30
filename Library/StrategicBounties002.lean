import VerifiedAgora.tagger

-- Strategic Bounty Batch 2
-- More challenging targets

@[target]
theorem bounty_nat_add_assoc (a b c : Nat) : 
  (a + b) + c = a + (b + c) := by
  exact Nat.add_assoc a b c

@[target]
theorem bounty_nat_mul_zero (n : Nat) : n * 0 = 0 := by
  exact Nat.mul_zero n

@[target]
theorem bounty_list_reverse_append {α : Type} (xs ys : List α) :
  (xs ++ ys).reverse = ys.reverse ++ xs.reverse := by
  exact List.reverse_append xs ys

@[target]
theorem bounty_option_map_some {α β : Type} (f : α → β) (x : α) :
  (some x).map f = some (f x) := by
  rfl

@[target]
theorem bounty_nat_pred_succ (n : Nat) : n.succ.pred = n := by
  exact Nat.pred_succ n
