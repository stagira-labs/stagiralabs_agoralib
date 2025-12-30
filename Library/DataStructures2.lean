import VerifiedAgora.tagger

@[target]
theorem list_reverse_length {α : Type} (xs : List α) : 
  xs.reverse.length = xs.length := by
  exact List.length_reverse xs
