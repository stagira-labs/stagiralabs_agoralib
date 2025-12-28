import VerifiedAgora.tagger

-- Premium Challenge Problems
-- High-value targets for bounty hunters!

@[target]
theorem list_reverse_length {α : Type} (xs : List α) : xs.reverse.length = xs.length := by
  sorry

@[target]
theorem nat_add_left_cancel (a b c : Nat) : a + b = a + c → b = c := by
  sorry

@[target]
theorem list_map_compose {α β γ : Type} (f : α → β) (g : β → γ) (xs : List α) : 
  (xs.map f).map g = xs.map (g ∘ f) := by
  sorry

@[target]
theorem mul_left_cancel (a b c : Nat) (ha : a ≠ 0) : a * b = a * c → b = c := by
  sorry
