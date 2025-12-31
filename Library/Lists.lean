import VerifiedAgora.tagger

@[target]
theorem list_append_nil (α : Type u) (l : List α) : l ++ [] = l := by
  sorry

@[target]
theorem list_append_assoc (α : Type u) (l1 l2 l3 : List α) : (l1 ++ l2) ++ l3 = l1 ++ (l2 ++ l3) := by
  sorry
