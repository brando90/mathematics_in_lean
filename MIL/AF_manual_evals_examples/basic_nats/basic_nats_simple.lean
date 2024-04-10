---- Example: define unary natural numbers

-- define unary natural numbers
inductive UnaryNat : Type
| Zero: UnaryNat
| Succ: UnaryNat -> UnaryNat
-- make unary nats printable
deriving Repr

-- bring contents of unary nat into scope
open UnaryNat

---- check types and evals
-- check type of unary nat, zero and succ
#check UnaryNat
#check UnaryNat.Zero
#check Succ (Succ Zero)

---- define addition for unary natural numbers
-- define addition for unary natural numbers (without explicit names in function declaration)
def add_left : UnaryNat -> UnaryNat -> UnaryNat
| Zero, n => n
| Succ m, n => Succ (add_left m n)

-- define addition infix notation
infixl:65 "+" => add_left

---- evals for addition
-- eval addition for unary natural numbers left and right
#eval Zero + Zero
#eval Zero + (Succ Zero)
#eval (Succ Zero) + (Succ Zero)

---- theorem show non inductive case of addition
-- theorem left addition, 0 + n = n (not inductive proof)
theorem add_left_zero_plus_n_eq_n (n : UnaryNat) : Zero + n = n := by rfl
-- theorem left addition, 0 + n = n (not inductive proof) with forall statements
theorem add_left_zero_plus_n_eq_n' : ∀ n : UnaryNat, Zero + n = n := by
  intros
  rfl

-- theorem left addition, n + 0 = n (inductive proof) with forall and use inductive hypothesis explicitly
theorem add_left_n_plus_zero_eq_n' : ∀ (n : UnaryNat), n + Zero = n := by
  intros n
  induction n with
  | Zero => rfl
  | Succ n' ih => simp [add_left]; assumption
