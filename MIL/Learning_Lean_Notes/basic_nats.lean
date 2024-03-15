/-
This is a comment.
Inductive types are like functions to create objects

-/

inductive UnaryNat: Type
| zero: UnaryNat
| succ: UnaryNat → UnaryNat
deriving Repr

--Zero
#eval UnaryNat.zero
--To create one
#eval UnaryNat.succ UnaryNat.zero
--Creating 2
#eval UnaryNat.succ UnaryNat.zero

#check UnaryNat.zero
#check UnaryNat.succ UnaryNat.zero

--Open the namespace for UnaryNat
open UnaryNat
#check succ zero
#check UnaryNat
#eval zero



--To define functions
def add_left: UnaryNat → UnaryNat → UnaryNat
| zero, n => n
| succ m', n => succ (add_left m' n)

#check add_left zero --This takes in a number a and outputs the function taking in some b and returning a+b

def add_right (m n: UnaryNat) : UnaryNat :=
  match n with 
  | zero => m
  | succ n' => succ (add_right m n')

#eval add_right zero zero

--todo EXERCISE: Prove that add_right is equal to add_left for all inputs

infixl:65 "+" => add_left

#eval zero + zero -- = add(0,0)


theorem add_zero_is_zero: zero + zero = zero := rfl --Tactic that unfolds addition operation, rfl essentially solves trivial calculatable inequalties

-- 0 + n = 0
theorem zero_add_n_eq_n : ∀ n : UnaryNat, zero + n = n := by
  intro n
  -- rfl
  rw [add_left]
  -- simp [add_left]

theorem zero_add_n_eq_n' (n : UnaryNat): zero + n = n := by rfl
#print zero_add_n_eq_n' 

theorem n_add_zero_eq_n: ∀ n : UnaryNat, n + zero = n := by
  intro n
  induction n with
  | zero => rfl
  -- | succ n' ih => rw [add_left]; rw [ih]
  | succ n' ih => rw[add_left,ih]
  #print n_add_zero_eq_n
