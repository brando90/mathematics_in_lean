/-
theorem: lim_{x -> c+} f(x) = +infinity

x + infinit = +infinity

lim_{x -> c} f(x) = L
∀ ε > 0, ∃ δ > 0, 0 < |x - c| < δ → 0 < |f(x) - L| < ε

L = + infinity
consider some ε > 0
0 < |f(x) - L| < ε
0 < |f(x) - +infinity| < ε

--> this formalization doens't seem promising

theorem limit_of_reciprocal_of_x_is_unbounded: lim_{x -> 0+} 1/x = +infinity
∀ M > 0, ∃ δ > 0, ∀ x : ℝ, 0 < x - c < δ → f(x) > M
-- unboudned limit := "for any M, there exists a sufficiently close x s.t. f(x) is strictly greater than M"
∀ M: ℝ, 0 < M, ∃ δ : ℝ, 0 < δ, ∀ x : ℝ, 0 < x - c < δ → M < f(x)

proof:
consider some M > 0 (intro M)
-- choose delta, M < f(x) --> M < 1/x --> 1/M > x --> x < M⁻¹
δ = M⁻¹
. show 0 < δ
fact M > 0 --> M⁻¹ > 0 (by lemma in lean, division by positive number)
0 < x - c -> rewrite
  -> 0 < x
x - c < δ -> rewrite
  -> x < M⁻¹
(WTS: M < x⁻¹)
x < M⁻¹
-- multiply both sides by x⁻¹ if x⁻¹ > 0 (lemma, have stmt)
-> 0 < x --> x⁻¹ > 0
x⁻¹ * x < M^⁻¹ * x⁻¹
by identity x⁻¹ * x = 1 of fields (lemma in lean or automation)
1 < M⁻¹ * x⁻¹
-- multiply both sides by M if M > 0
1 < M⁻¹ * x⁻¹
M * 1 < M * M⁻¹ * x⁻¹
-- identity
M < x⁻¹
Qed

-/

-- import real numbers form mathlib
import Mathlib.Data.Real.Basic

noncomputable def f (x : ℝ) : ℝ := x⁻¹
#print f
#check f
#check f 1
-- #eval f 1
-- theorem any_R : ℝ -> R := λ x : ℝ, x -- TODO
theorem unit_test_f_1 : f 1 = 1 := by simp [f]
theorem unit_test_f_2 : f 2 = 1/2 := by simp [f]
noncomputable def f' (x : ℝ) : ℝ := 1/x
theorem units_f_eq_f' : ∀ x : ℝ , f x = f' x := by simp [f, f']
#print units_f_eq_f'

-- lim_{x -> c+} f(x) = +infinity := ∀ M > 0, ∃ δ > 0, ∀ x : ℝ, 0 < x - c < δ → f(x) > M
def unbounded_limit (f : ℝ -> ℝ) (c : ℝ) : Prop :=
  ∀ M : ℝ, 0 < M → ∃ δ : ℝ, 0 < δ ∧ ∀ x : ℝ, 0 < x - c ∧ x - c < δ → M < f x

-- show 1/x is unbounded as x -> 0 (or 1/x has a veritcal asymptote at x = 0)
theorem limit_of_reciprocal_of_x_is_unbounded: unbounded_limit f 0 := by
  unfold unbounded_limit f
  -- choose M : ℝ and is M > 0
  intro M h_M_pos
  -- choose delta = M⁻¹ by a tactic
  use M⁻¹
  -- deconstruct the constructor Left ∧ Right = And(Left, Right) to Left, Right using a tactic
  apply And.intro
  . exact (by simp [h_M_pos]) -- TODO try to find the lemma in mathlib to prove this
  . intro x ⟨h_x_pos, h_x_lt_M⟩
    -- rewrite x - 0 to x using a tactic for sub
    rw [sub_zero] at h_x_pos h_x_lt_M
    -- using rewrite do M < x⁻¹ → M * x < x⁻¹ * x by mulitpling both sides by x on the right
    -- #print mul_lt_mul_right -- (a0 : 0 < a) : b * a < c * a ↔ b < c
    rw [←mul_lt_mul_right h_M_pos] at h_x_lt_M
    -- #print mul_inv_cancel
    -- mul_inv_cancel: a ≠ 0 → a * a⁻¹ = 1
    nth_rewrite 2 [mul_comm] at h_x_lt_M
    have h_M_neq_zero : M ≠ 0 := ne_of_gt h_M_pos
    rw [mul_inv_cancel h_M_neq_zero] at h_x_lt_M
    -- multiply both sides by x⁻¹ on the left
    have h_x_inv_pos : 0 < x⁻¹ := inv_pos.mpr h_x_pos
    rw [← mul_lt_mul_left h_x_inv_pos] at h_x_lt_M
    -- apply associativity of mul
    rw [← mul_assoc] at h_x_lt_M
    -- mul_inv_cancel: a ≠ 0 → a * a⁻¹ = 1
    nth_rewrite 2 [mul_comm] at h_x_lt_M
    -- cancel the x * x⁻¹ to 1
    have h_x_neq_zero : x ≠ 0 := ne_of_gt h_x_pos
    rw [mul_inv_cancel h_x_neq_zero] at h_x_lt_M
    -- apply 1 * M = M
    rw [one_mul] at h_x_lt_M
    rw [mul_comm] at h_x_lt_M
    rw [one_mul] at h_x_lt_M
    assumption
