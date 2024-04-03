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
-- import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Data.Real.Basic
-- import Mathlib.Analysis.Calculus.Tendsto
#check ℝ

-- -- definition f: f(x) = 2 / (x^2 + x - 6)
-- noncomputable def f (x : ℝ) : ℝ := 2 / (x^2 + x - 6)
-- -- lemma denom_factorization (x : ℝ) : x^2 + x - 6 = (x - 2) * (x + 3) := by ring
-- lemma denom_factorization (x : ℝ) : x^2 + x - 6 = (x - 2) * (x + 3) := by ring

-- -- definition Func_has_Vertical_Asymptote: (f: Real -> Real) (a : Real) : lim_{x -> a} = +- infinity
-- def Func_has_Vertical_Asymptote (f: ℝ -> ℝ) (a : ℝ) : Prop :=
--   (tendsto f (𝓝 a) at_top) ∨ (tendsto f (𝓝 a) at_bot)
-- -- theorem Has_two_vertical_asymptotes:  Func_has_Vertical_Asymptote f 2 /\ Func_has_Vertical_Asymptote f -3 := by sorry


-- -- thm: Show that f(x) = 2 / (x^2 + x - 6) has 2 vertical asymptotes at x=-3, x=2.
-- -- thm: Show that lim_{x -> -3} f(x) = infinity /\ lim_{x -> 2} f(x) = infinity
-- theorem vertical_asymptotes_of_f_with_ans_thm1 :
