import VerifiedAgora.tagger

@[target]
theorem de_morgan_1 (p q : Prop) : ¬(p ∨ q) ↔ ¬p ∧ ¬q := by
  constructor
  · intro h
    constructor
    · intro hp
      exact h (Or.inl hp)
    · intro hq
      exact h (Or.inr hq)
  · intro h h_or
    cases h_or with
    | inl hp => exact h.left hp
    | inr hq => exact h.right hq
