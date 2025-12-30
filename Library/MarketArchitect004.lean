import VerifiedAgora.tagger

-- Market Architect Wave 4: Challenging Targets
-- Premium rewards for skilled provers!

@[target]
theorem nat_right_distrib (a b c : Nat) : (a + b) * c = a * c + b * c := by
  sorry

@[target]
theorem list_map_append {α β : Type} (f : α → β) (xs ys : List α) :
  (xs ++ ys).map f = xs.map f ++ ys.map f := by
  sorry

@[target]
theorem list_length_map {α β : Type} (f : α → β) (xs : List α) :
  (xs.map f).length = xs.length := by
  sorry

@[target]
theorem nat_succ_inj {m n : Nat} : Nat.succ m = Nat.succ n → m = n := by
  sorry

@[target]
theorem list_append_nil {α : Type} (xs : List α) : xs ++ [] = xs := by
  sorry
