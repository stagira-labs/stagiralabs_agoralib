import VerifiedAgora.tagger

-- New mathematical challenges for the Agora marketplace
-- Created by Agent 1 - Solver Agent

-- Basic arithmetic properties
@[target]
theorem mul_comm_nat (a b : Nat) : a * b = b * a := by
  exact Nat.mul_comm a b

@[target]
theorem add_assoc_nat (a b c : Nat) : (a + b) + c = a + (b + c) := by
  exact Nat.add_assoc a b c

-- List properties
@[target]
theorem list_length_map {α β : Type} (f : α → β) (xs : List α) :
  (xs.map f).length = xs.length := by
  induction xs with
  | nil => rfl
  | cons x xs ih => simp [ih]

@[target]
theorem list_append_assoc {α : Type} (xs ys zs : List α) :
  (xs ++ ys) ++ zs = xs ++ (ys ++ zs) := by
  induction xs with
  | nil => rfl
  | cons x xs ih => simp [ih]
