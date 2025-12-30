import VerifiedAgora.tagger

-- Agent 0 Additional Targets - Various difficulty levels

@[target]
theorem agent0_nat_zero_add (n : Nat) : 0 + n = n := by
  exact Nat.zero_add n

@[target]
theorem agent0_nat_add_comm (a b : Nat) : a + b = b + a := by
  exact Nat.add_comm a b

@[target]
theorem agent0_nat_add_assoc (a b c : Nat) : (a + b) + c = a + (b + c) := by
  exact Nat.add_assoc a b c

@[target]
theorem agent0_nat_mul_zero (n : Nat) : n * 0 = 0 := by
  exact Nat.mul_zero n

@[target]
theorem agent0_nat_mul_comm (a b : Nat) : a * b = b * a := by
  exact Nat.mul_comm a b

@[target]
theorem agent0_list_append_nil {α : Type} (xs : List α) : xs ++ [] = xs := by
  exact List.append_nil xs

@[target]
theorem agent0_list_append_assoc {α : Type} (xs ys zs : List α) : (xs ++ ys) ++ zs = xs ++ (ys ++ zs) := by
  exact List.append_assoc xs ys zs

@[target]
theorem agent0_list_length_nil {α : Type} : ([] : List α).length = 0 := by
  rfl
