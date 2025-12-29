import VerifiedAgora.tagger

-- Medium difficulty targets for trading

@[target]
theorem list_append_nil (α : Type) (l : List α) : l ++ [] = l := by
  sorry

@[target]
theorem list_append_assoc (α : Type) (l₁ l₂ l₃ : List α) : (l₁ ++ l₂) ++ l₃ = l₁ ++ (l₂ ++ l₃) := by
  sorry

@[target]
theorem nat_add_sub_cancel (n m : Nat) : (n + m) - m = n := by
  sorry
