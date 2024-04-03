/-

{
    "problem": "How many vertical asymptotes does the graph of $y=\\frac{2}{x^2+x-6}$ have?",
    "level": "Level 3",
    "type": "Algebra",
    "solution": "The denominator of the rational function factors into $x^2+x-6=(x-2)(x+3)$. Since the numerator is always nonzero, there is a vertical asymptote whenever the denominator is $0$, which occurs for $x = 2$ and $x = -3$.  Therefore, the graph has $\\boxed{2}$ vertical asymptotes."
}



-/
-- import Mathlib.Tactic
-- import Mathlib.Data.Real.Basic

-- noncomputable def f (x : ℝ) : ℝ := 2 / (x^2 + x - 6)

/-
Strategy

define: f

lemma: (x^2 + x - 6) = (x + 3)(x - 2)

define: vertical asymptote, as lim_{x->val} f(x) = infity
(on either side i.e. vertical asymptote if goes to infinity if it does from left or right)

-- if we put the answer in the theorem
Theorem1 algebra_1json_ans_in_thm: Show that f(x) = 2 / (x^2 + x - 6) has 2 vertical asymptotes at x=-3, x=2.
proof:
rewrite f -> 2 / (x + 3)(x - 2)
cases:
1. show lim_{x -> -3} f(x) = infinity
2. show lim_{x -> 2} f(x) = infinity
end
-/
import Mathlib.Tactic.Linarith
import Mathlib.Data.Nat.Basic
import Mathlib.Data.Nat.Parity
-- import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Data.Real.Basic
import Mathlib.Algebra.Parity
-- import Mathlib.Analysis.Calculus.Tendsto
#check ℝ

-- -- definition f: f(x) = 2 / (x^2 + x - 6)
-- noncomputable def f (x : ℝ) : ℝ := 2 / (x^2 + x - 6)
-- -- lemma denom_factorization (x : ℝ) : x^2 + x - 6 = (x - 2) * (x + 3) := by ring
-- lemma denom_factorization (x : ℝ) : x^2 + x - 6 = (x - 2) * (x + 3) := by ring

<<<<<<< HEAD
-- -- definition Func_has_Vertical_Asymptote: (f: Real -> Real) (a : Real) : lim_{x -> a} = +- infinity
-- def Func_has_Vertical_Asymptote (f: ℝ -> ℝ) (a : ℝ) : Prop :=
--   (tendsto f (𝓝 a) at_top) ∨ (tendsto f (𝓝 a) at_bot)
-- -- theorem Has_two_vertical_asymptotes:  Func_has_Vertical_Asymptote f 2 /\ Func_has_Vertical_Asymptote f -3 := by sorry


-- -- thm: Show that f(x) = 2 / (x^2 + x - 6) has 2 vertical asymptotes at x=-3, x=2.
-- -- thm: Show that lim_{x -> -3} f(x) = infinity /\ lim_{x -> 2} f(x) = infinity
-- theorem vertical_asymptotes_of_f_with_ans_thm1 :
=======

-- Archimedean Principle; the natural numbers are unbounded.
theorem archimedean: ∀ n : Nat, ∃ m : Nat, m > n := by
  intro n;
  let a := n+1;
  use a;
  norm_num;


-- definition Func_has_Vertical_Asymptote: (f: Real -> Real) (a : Real) : lim_{x -> a} = +- infinity
def Func_has_Vertical_Asymptote (f: ℝ -> ℝ) (a : ℝ) : Prop := sorry
  -- (tendsto f (𝓝 a) at_top) ∨ (tendsto f (𝓝 a) at_bot)
-- theorem Has_two_vertical_asymptotes:  Func_has_Vertical_Asymptote f 2 /\ Func_has_Vertical_Asymptote f -3 := by sorry


-- thm: Show that f(x) = 2 / (x^2 + x - 6) has 2 vertical asymptotes at x=-3, x=2.
-- thm: Show that lim_{x -> -3} f(x) = infinity /\ lim_{x -> 2} f(x) = infinity
-- theorem vertical_asymptotes_of_f_with_ans_thm1 :

-- Define a predicate for odd numbers
def is_odd (n : ℕ) : Prop := ∃ k, n = 2 * k + 1

-- Define a predicate for even numbers
def is_even (n : ℕ) : Prop := ∃ k, n = 2 * k



/-
###### New theorem! ########
Proving that the sum of two odd numbers is odd. Brando's asymptote problem is a little too hard for my Lean skills rn, so I'm simplifying this task.
-/
-- The stuff GPT generated:
-- theorem sum_of_two_odd_is_even (m n : ℕ) (h1 : is_odd m) (h2 : is_odd n) :is_even (m + n) :=

--What I think is the correct version of this theorem:
theorem two_odd_is_even: ∀ m n : ℕ, is_odd m ∧ is_odd n → is_even (m+n) := by
  -- intros m n;
  
  -- intro h1 h2;
  -- cases h1 with h1 ;
  -- cases h2 with h2 hk2;

  -- rw [hk1,hk2];

  -- simp[add_assoc];

  -- use (k1 + k2 + 1);

  -- ring;
  sorry

theorem sum_of_two_odd_is_even: ∀ m n : Nat, Odd m ∧ Odd n → Even (m+n) := by
  apply Mathlib.Algebra.Parity.Odd.add_odd;
>>>>>>> 8e10b3bb06eafe1d8f61caa937e34664def85d50
