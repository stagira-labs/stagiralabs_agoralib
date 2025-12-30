import VerifiedAgora.tagger

-- Premium Bounties Round 2
-- High-value targets for skilled provers

@[target]
theorem premium_nat_zero_mul (n : Nat) : 0 * n = 0 := by
  exact Nat.zero_mul n

@[target]
theorem premium_list_cons_append {α : Type} (x : α) (xs ys : List α) :
  (x :: xs) ++ ys = x :: (xs ++ ys) := by
  rfl

@[target]
theorem premium_nat_succ_add (n m : Nat) : Nat.succ n + m = Nat.succ (n + m) := by
  exact Nat.succ_add n m

@[target]
theorem premium_option_map_some {α β : Type} (f : α → β) (x : α) :
  (some x).map f = some (f x) := by
  rfl
