/-
1.19 Theorem There exists an ordered field R which has the leaast-upper-bound property.
  Morevover, R contains Q as a subfield.

Plan of attack:
- import Q from mathlib
- import ordered field from mathlib
- define R as dedikind cuts like Rudin did in Step 1
- Prove it's an ordered Field

- TODO later:
  - define lub or from mathlib
  - then see what goes next from Rudin's thm 1.19 and continue proof
-/

import Mathlib.Algebra.Order.Field.Defs

-- #check LinearOrderedSemifield
#check Set
-- #check (Set)
#check Set.univ
-- #print Set.univ

-- structure == inductive, but structure has one constructor. it is all these things it's an and, it's like a named tuple or record in coq, structs in C
structure Cut where
  carrier: Set ℚ  -- carrier == α in Rudin, the actual cut
  not_empty: carrier ≠ {}  -- α ≠ ∅
  not_all: carrier ≠ Set.univ  -- alpha ≠ Set ℚ, carrier ≠ { _a | True}
  -- if q < p & p ∈ α ==> q ∈ α
  p_less_q_in_carrier: ∀ p ∈ carrier, ∀ q : ℚ, q < p -> q ∈ carrier
  -- (p : ℚ) -> p ∈ carrier -> (q : ℚ) -> q < p -> q ∈ carrier
  p_less_q_in_carrier': (p : ℚ) -> p ∈ carrier -> (q : ℚ) -> q < p -> q ∈ carrier
  -- TODO: rfl proof of that
