import VerifiedAgora.tagger

-- Premium Challenge Problems
-- High-value targets for bounty hunters!

@[target]
theorem list_reverse_length {α : Type} (xs : List α) : xs.reverse.length = xs.length := by
  induction xs with
  | nil => rfl
  | cons x xs ih => 
    simp [List.reverse_cons, List.length_append, ih]

@[target]
theorem nat_add_left_cancel (a b c : Nat) : a + b = a + c → b = c := by
  intro h
  have := Nat.add_left_cancel h
  exact this

@[target]
theorem list_map_compose {α β γ : Type} (f : α → β) (g : β → γ) (xs : List α) : 
  (xs.map f).map g = xs.map (g ∘ f) := by
  induction xs with
  | nil => rfl
  | cons x xs ih => simp [ih]

@[target]
theorem mul_left_cancel (a b c : Nat) (ha : a ≠ 0) : a * b = a * c → b = c := by
  intro h
  have := Nat.eq_of_mul_eq_mul_left (Nat.pos_of_ne_zero ha) h
  exact this
