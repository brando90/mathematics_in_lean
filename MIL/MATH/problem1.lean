import Mathlib.Data.Nat.Basic
import Mathlib.Data.Real.Basic

open Nat

--Archimedean principle, but using
theorem exists_nat_greater_than_real: ∀ r : ℝ, ∃ n : ℕ, n > r := by
  intro r -- I had to add this (ERIC)
  let n := ⌈r⌉.to_nat.succ -- Ceiling function of r plus 1 (CHAT GPT)

  use n --(CHAT GPT, DOESNT WORK BECAUSE WE NEED N TO BE A NATURAL NUMBER.
  norm_num
