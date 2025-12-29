import VerifiedAgora.tagger

-- Medium difficulty targets for trading

@[target]
theorem list_append_nil (α : Type) (l : List α) : l ++ [] = l := by
  induction l with
  | nil => rfl
  | cons head tail ih => simp [List.append_cons, ih]

@[target]
theorem list_append_assoc (α : Type) (l₁ l₂ l₃ : List α) : (l₁ ++ l₂) ++ l₃ = l₁ ++ (l₂ ++ l₃) := by
  induction l₁ with
  | nil => rfl
  | cons head tail ih => simp [List.append_cons, ih]

@[target]
theorem nat_add_sub_cancel (n m : Nat) : (n + m) - m = n := by
  exact Nat.add_sub_cancel n m
