import LeanCopilot

import Mathlib.Data.Nat.Basic
import Mathlib.Data.Nat.Modeq
import Mathlib.Data.Int.Basic
import Mathlib.Algebra.Divisibility.Basic
import Mathlib.Tactic.Ring
import Mathlib.Data.Nat.Prime
import Mathlib.Algebra.Group.Defs
import Mathlib.Algebra.EuclideanDomain.Defs

theorem prob14
  (m n : Int)
  (h1: m^2 + m*n + n^2 = m^2 * n^2):
  (m = 0 ∧ n = 0) ∨ (m = 1 ∧ n = -1) ∨ (m = -1 ∧ n = 1):= by
  sorry


