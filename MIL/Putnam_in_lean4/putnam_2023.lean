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
