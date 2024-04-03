import Mathlib.Data.Nat.Basic
import Mathlib.Data.Nat.Modeq
import Mathlib.Data.Int.Basic
import Mathlib.Algebra.Divisibility.Basic
import Mathlib.Tactic.Ring
import Mathlib.Data.Nat.Prime
import Mathlib.Algebra.Group.Defs
import Mathlib.Algebra.EuclideanDomain.Defs
import Mathlib.Algebra.GroupPower.Basic
import Mathlib.Algebra.Field.Basic
import Mathlib.Tactic.Zify
-- import Mathlib.Data.ZMod.Basic
/-
######## PROBLEM STATEMENT ########
--Determine all possible values of the expression a^3 + b^3 + c^3 -3abc
where a,b,c are nonnegative integers.
-/
--I kind of have to use two parts to this?



/-
General tactic:

Split this into different cases, where n = 0,1,2,4,5,7,8 mod 9.
Then, for each of them, come up with A,B,C in terms of n and apply simp


-/

-- example (a b c : ℕ) : c * b * a = b * (a * c) := by
--   rw [mul_comm b (a * c)]
--   mul_comm

--   -- rw [mul_comm c a]

-- lemma trivial
--   (n : ℕ):
--   n = n - 1 +1 := by
--     sorry

-- lemma mod9
--   (n : ℕ):
--   ∃ a b, n = 9*a+b:= by
--     let a := (n - (n % 9)) / 9
--     let b := n % 9
--     use a,b
--     simp
--     rw [mul_comm]

--     sorry

example {α : Type*} [Field α] (A B C : α) : ((B-A)^2 - (B-A) * (C-A) + (C-A)^2) * (3 *A + (B-A) + (C-A)) = A^3 + B^3 + C^3 - 3 * A * B * C := by
  ring

lemma algFact (A B C : ℤ):
  ((B-A)^2 - (B-A) * (C-A) + (C-A)^2) * (3 *A + (B-A) + (C-A)) = A^3 + B^3 + C^3 - 3 * A * B * C :=
  by
  -- zify
  ring
  -- ring


-- omg do i need to split this up into different hypothesis cases...

--Zero case
theorem putnam_2019_prob1_part1_0:
  ∃ A B C : Nat, A ≥ 0 ∧ B ≥ 0∧  C ≥ 0 ∧  A^2 + B^2 + C^2 - 3 * A*  B * C = 0 := by
  let A := 0
  let B := 0
  let C := 0
  use A,B,C
  norm_num

theorem putnam_2019_prob1_part1_0mod3
  (n : ℤ)
  -- (h: n % 9 = 0) :
  (h: n % 9 = 9) : --HOW DO I USE THE PREVIOUS HYPOTHESIS?? IT WONT WORK, ASK BRANDO.
  ∃ A B C : ℤ, A^3 + B^3 + C^3 - 3 * A*  B * C = n := by

  let A := (n - 9)/9;
  let B := A + 1;
  let C := A + 2;
  use A,B,C;
  ring
  rw[Int.ediv_mul_cancel]
  norm_num
  rw[add_comm]
  apply Int.dvd_sub_of_emod_eq;
  -- have h2: 0 % 9 = 9 := by
  apply h

theorem putnam_2019_prob1_part1_1mod3
  (n : ℤ)
  (h2: n % 3 = 1):
  ∃ A B C : ℤ,  A^3 + B^3 + C^3 - 3 * A*  B * C = n := by
  let A := (n-1)/3
  let B := A
  let C := A+1
  use A,B,C
  simp
  ring;
  rw[Int.ediv_mul_cancel]
  norm_num
  rw[add_comm]
  apply Int.dvd_sub_of_emod_eq;
  apply h2
--WHY WONT THIS WORK

theorem putnam_2019_prob1_part1_2mod3
  (n : ℤ)
  (h2: n % 3 = 2):
  ∃ A B C : ℤ, A^3 + B^3 + C^3 - 3 * A*  B * C = n := by
  let A := (n-2)/3
  let B := A + 1
  let C:= A + 1
  use A,B,C
  simp
  ring
  rw[Int.ediv_mul_cancel]
  norm_num
  rw [add_comm]
  apply Int.dvd_sub_of_emod_eq;
  apply h2

theorem putnam_2019_prob1_part2
  (A B C : Int)
  (h1: A ≥ 0)
  (h2: B ≥ 0)
  (h3: C ≥ 0):
  A^3 + B^3 + C^3 - 3 * A * B * C ≥ 0 ∧ A^3 + B^3 + C^3 - 3 * A * B * C % 9 ≠ 3 ∧ A^3 + B^3 + C^3 - 3 * A * B * C % 9 ≠ 6:= by
  let b := B - A
  let c := C - A
  have imp1: A^3 + B^3 + C^3 - 3 * A * B * C = (b^2 - b * c + c^2) * (3 * A + b + c) := by ring

  have imp2: 2^2*(b^2 - b * c + c^2)= (2* b - c)^2 + 3 *c^2 := by
    ring
  apply And.intro
  --We want to show by the sum of squares that this is always non-negative.
  rw[imp1]

  sorry

  sorry
