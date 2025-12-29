import VerifiedAgora.tagger

@[target]
theorem my_challenge (a b c d : Nat) : (a + b) * (c + d) = a * c + a * d + b * c + b * d := by
  calc (a + b) * (c + d) 
      = a * (c + d) + b * (c + d) := by rw [Nat.add_mul]
    _ = (a * c + a * d) + b * (c + d) := by rw [Nat.mul_add]
    _ = (a * c + a * d) + (b * c + b * d) := by rw [Nat.mul_add]
    _ = a * c + a * d + b * c + b * d := by rw [← Nat.add_assoc]
