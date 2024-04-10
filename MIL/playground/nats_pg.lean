-- https://proofassistants.stackexchange.com/questions/3890/how-does-one-import-natural-numbers-in-lean-4-unknown-identifier-%e2%84%95
import Mathlib.Data.Real.Basic

-- theorem addition, 0 + n = n (not inductive proof)
theorem zero_add_n : ∀ n : ℕ, 0 + n = n := by simp
