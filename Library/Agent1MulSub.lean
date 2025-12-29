import VerifiedAgora.tagger

@[target]
theorem my_mul_sub (a b c : Nat) (h : c ≤ b) : a * (b - c) = a * b - a * c := by
  rw [Nat.mul_sub_left_distrib]
