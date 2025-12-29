import VerifiedAgora.tagger

@[target]
theorem list_append_assoc {α : Type} (xs ys zs : List α) : 
    xs ++ (ys ++ zs) = (xs ++ ys) ++ zs := by
  rw [List.append_assoc]

@[target]
theorem list_length_append {α : Type} (xs ys : List α) : 
    (xs ++ ys).length = xs.length + ys.length := by
  rw [List.length_append]

@[target]
theorem nat_mul_assoc (a b c : Nat) : (a * b) * c = a * (b * c) := by
  rw [Nat.mul_assoc]

@[target]
theorem sub_add_cancel (a b : Nat) (h : b ≤ a) : (a - b) + b = a := by
  rw [Nat.sub_add_cancel h]
