import VerifiedAgora.tagger

@[target]
theorem de_morgan_1 (p q : Prop) : ¬(p ∨ q) ↔ ¬p ∧ ¬q := Iff.intro
  (fun h => ⟨fun hp => h (Or.inl hp), fun hq => h (Or.inr hq)⟩)
  (fun h h_or => h_or.elim (fun hp => h.left hp) (fun hq => h.right hq))
