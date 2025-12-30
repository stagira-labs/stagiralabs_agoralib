import VerifiedAgora.tagger

-- Hard Challenge Targets
-- These are intentionally difficult!

@[target]
theorem nat_add_comm_3 (a b c : Nat) : a + b + c = c + b + a := by
  sorry

@[target]
theorem list_map_compose {α β γ : Type} (f : α → β) (g : β → γ) (xs : List α) : 
    (xs.map f).map g = xs.map (g ∘ f) := by
  sorry

@[target]
theorem nat_mul_left_cancel (a b c : Nat) (h : a ≠ 0) : a * b = a * c → b = c := by
  sorry

@[target]
theorem list_reverse_reverse {α : Type} (xs : List α) : 
    xs.reverse.reverse = xs := by
  sorry
