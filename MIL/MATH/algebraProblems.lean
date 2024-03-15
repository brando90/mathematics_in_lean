import Mathlib.Data.Nat.Basic
import Mathlib.Data.Real.Basic
import Mathlib.Data.Rat.Basic
-- import Mathlib.Data.Real.Sqrt
import Mathlib.Data.Nat.Modeq
import Mathlib.Data.Int.Basic
import Mathlib.Data.Real.Basic
import Mathlib.Tactic.LinearCombination
import Mathlib.Algebra.Divisibility.Basic
import Mathlib.Tactic.Ring
import Mathlib.Data.Nat.Prime
import Mathlib.Algebra.Group.Defs
import Mathlib.Algebra.EuclideanDomain.Defs
import Mathlib.Algebra.GroupPower.Basic
import Mathlib.Algebra.Field.Basic
import Mathlib.Algebra.GroupWithZero.Units.Lemmas
import Mathlib.Tactic.Zify
-- import Mathlib.Data.Real.Sqrt

#check (4,5)


/-
A number $x$ is 3 larger than its reciprocal.  What is the value of $\\left(x-\\frac{1}{x}\\right)^4$?

Solution:
The sentence is telling us, in algebra,  $$x=3+\\frac{1}{x}$$ A more useful form for us is $$x-\\frac{1}{x}=3$$ From there, we can bring both sides to the fourth power: $$\\left(x-\\frac{1}{x}\\right)^4=\\boxed{81}$$

-/
open Mathlib.Tactic.LinearCombination

theorem alg_test_2048 (x : ℚ) (h1: x = 1/x + 3) : (x - 1/x)^4 = 81:= by
  have h2: x - 1/x = 1/x + 3 - 1/x:= by
    rw[←pf_sub_c]
    rw[←h1]
  rw[h2]
  ring

/-

{
    "problem": "For a certain species of ocean fish, 8 fish can exist per cubic meter of water without the symptoms of overcrowding. If doctors want to study 600 fish, what is the minimum number of cubic meters of water necessary to maintain a healthy study environment?",
    "level": "Level 1",
    "type": "Algebra",
    "solution": "We need 8 fish per cubic meter.  We have 600 fish, so we have $600/8 = 75$ groups of 8 fish, which means we need $\\boxed{75}$ cubic meters of water."
}
-/
--Comment, this problem seems a little easy and convoluted.
theorem alg_test_1915 (fish vol : ℚ) (h1: fish = 8 * vol) (h2: fish = 600) : vol = 75:= by
  have div: vol = fish / 8 := by
    rw[h1]
    ring
  rw[div]
  rw[h2]
  rfl

/-
{
    "problem": "You have linear functions $p(x)$ and $q(x)$. You know $p(2)=3$, and $p(q(x))=4x+7$ for all $x$. Find $q(-1)$.",
    "level": "Level 5",
    "type": "Algebra",
    "solution": "We have $p(2)=3$, but we have no information about how $p(x)$ acts when we put numbers like $2$ into it. We can only put outputs of $q(x)$ into $p(x)$. So, let's force $2$ to be an output of $q(x)$: Let $q(a)=2$ for some $a$.  Then we know $p(q(a))=4a+7$. But since $q(a)=2$, we really have $p(2)=4a+7$. But we're given that $p(2)=3$, so $3=4a+7$. Solving this gives $a=-1$ (so as it turns out, there was a value of $a$ for which $q(a)=2$.) By the definition of $a$, $q(a)=2$, so since $a=-1$, $q(-1)=2$. But that's exactly what we wanted to find! So $q(-1)=\\boxed{2}$."
}
-/

--How much human input can I put in to influence the problem statement?

def linear (a : ℝ) (b : ℝ) (x: ℝ):=
  a * x + b

theorem alg_test_2237 (a1 b1 a2 b2 : ℝ) (h1: linear a1 b1 2 = 3) (h2: ∀ x : ℝ, linear a1 b1 (linear a2 b2 x) = 4 * x + 7): a2 * (-1) + b2 = 2 := by
  sorry
