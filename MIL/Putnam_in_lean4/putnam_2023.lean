/-
https://kskedlaya.org/putnam-archive/2023.pdf
-/

/- A1
  For a positive integer n,
  let fn(x) =vcos(x) cos(2x) cos(3x)··· cos(nx).
  Find the smallest n such that | f''_n(0)| > 2023.
-/

/-
(n : Nat), f_n(x) = cos(x) * ... * cons(nx)
-/
import Mathlib.Tactic
import Mathlib.Algebra.BigOperators.Basic

open BigOperators

/- likely pain points
  - type coercions (arithmetic on ℕ vs ℝ vs ℚ etc
    - having operations that work on both nats and reals
  - having to put the answer in the question or how to restrict the concreteness of the answer needed for the proof to work
    - possible solutions
      - 1. writing the answer in the theorem and making it clear the limitations of the benchmark in the paper e.g., it doesn't mean it is a putnam fellow due to simplicity of prover
        - annotated clearly problems that have limitations
      - 2. restricting the logic (e.g., SMT solver) or writing constraints on the problem?
-/
#check Finset.Icc
-- #eval decide (0 ∈ Finset.range 3)
-- #eval decide (3 ∈ Finset.Icc 1 3)

def smallest (P : ℕ → Prop) (n : ℕ) := P n ∧ ∀ k, k < n → ¬ P k

#check Real.cos
example
    (_ : f = fun n x => ∏ k : ℕ in Finset.Icc 1 n, Real.cos (k * x))
    (second_deriv : (ℝ → ℝ) -> (ℝ → ℝ))
    (abs : ℝ → ℝ)
    (_ : P = fun n => abs (second_deriv (f n) 0) > 2023)
    : ∃ n, smallest P n :=
  by sorry

example
    (P : ℕ → Prop)
    : { x | P x } :=
    by sorry


import Mathlib.Data.Complex.Exponential
import Mathlib.Analysis.Calculus.Deriv.Mul
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Deriv
import Mathlib.NumberTheory.Bernoulli

open BigOperators
open Classical

-- Putnam analysis question
-- Compute the second derivative of
-- d^2/dx^2 cos(x)cos(2x)...cos(nx) at x=0

section product_rule
variable {𝕜 : Type u} [NontriviallyNormedField 𝕜] {x : 𝕜} {𝔸 : Type u_2} [NormedCommRing 𝔸] [NormedAlgebra 𝕜 𝔸]

noncomputable def deriv_if (p : Prop) [Decidable p] (f : 𝕜 → 𝔸) : 𝕜 → 𝔸 :=
  if p then deriv f else f

theorem deriv_if_pos {p : Prop} [Decidable p] {f : 𝕜 → 𝔸} (h : p) :
    deriv_if p f = deriv f := if_pos h

theorem deriv_if_neg {p : Prop} [Decidable p] {f : 𝕜 → 𝔸} (h : ¬p) :
    deriv_if p f = f := if_neg h

theorem differentiable_prod (S : Finset α) (f : α → 𝕜 → 𝔸) (x : 𝕜)
    (hdiff : ∀ i, DifferentiableAt 𝕜 (f i) x) :
    DifferentiableAt 𝕜 (fun x => ∏ i in S, f i x) x := by
  induction S using Finset.induction_on
  case empty => simp
  case insert i S hi h =>
  · simp [hi]
    exact (hdiff i).mul h

theorem deriv_prod [DecidableEq α] (S : Finset α) (f : α → 𝕜 → 𝔸)
    (hdiff : ∀ i : α, Differentiable 𝕜 (f i)) :
    deriv (fun z => ∏ i in S, f i z) =
      fun x => ∑ i in S, ∏ j in S, deriv_if (i = j) (f j) x := by
  funext x
  induction S using Finset.induction_on
  · simp
  case insert t S ht ih =>
    simp only [Finset.prod_insert ht]
    rw [deriv_mul]
    · rw [ih, Finset.sum_insert ht, deriv_if_pos rfl, Finset.mul_sum]
      have : ∀ j ∈ S, t ≠ j := by rintro j hj rfl; contradiction
      congr 1
      · congr 1
        apply Finset.prod_congr rfl
        intro j hj
        rw [deriv_if_neg (this j hj)]
      · apply Finset.sum_congr rfl
        intro i hi
        rw [deriv_if_neg (this i hi).symm]
    · exact hdiff t x
    · apply differentiable_prod; intro i; exact hdiff i x

end product_rule
