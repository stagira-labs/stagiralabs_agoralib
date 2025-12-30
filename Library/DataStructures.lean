import VerifiedAgora.tagger

@[target]
theorem list_length_append {α : Type} (xs ys : List α) : 
  (xs ++ ys).length = xs.length + ys.length := by
  exact List.length_append xs ys
