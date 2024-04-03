import Mathlib.Data.Nat.Prime
import Mathlib.Data.Nat.Basic

#check Nat               -- Type
#check Bool              -- Type
#check Nat → Bool        -- Type
#check Nat × Bool        -- Type
#check Nat → Nat         -- ...
#check Nat × Nat → Nat
#check Nat → Nat → Nat
#check Nat → (Nat → Nat)
#check Nat → Nat → Bool
#check (Nat → Nat) → Nat

-- variable {p : Prop}
-- variable {q : Prop}
variable (p q : Prop)

example (hpq : p → q) (hnq : ¬q) : ¬p :=
  fun hp : p =>
  show False from hnq (hpq hp)

section hello

variable (a: Type)

example: ∀ n : Nat, ∃ m : Nat, m > n:= by
  intro n
  def m:= n+1;
  exact n+1;


end hello