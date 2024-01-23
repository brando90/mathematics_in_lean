/-
thm 1.11

1.11 Theorem Suppose $S$ is an ordered set with the least-upper-bound property,
$B \subset S, B$ is not empty, and $B$ is bounded below.
Let $L$ be the set of all lower bounds of $B$.

Then
exists in $S$, and $\alpha=\inf B$.
$$
\alpha=\sup L
$$
In particular, inf $B$ exists in $S$.
-/

-- p1: α = sup L exists in S (trivial because it's in the way α is defined)
-- p2: inf B exist in S (trivial similar reasons)
-- p3: show α = inf B

-- S is a total order
-- B is not empty, B subset of S
-- L lower bounds of B
-- α = sup L
-- --> WTS: exists in α  S
import Mathlib.Init.Order.Defs
import Mathlib.Init.Set
import Mathlib.Order.Bounds.Basic

#check lowerBounds

theorem sup_of_lower_bounds_is_in_S {S : Type} [LinearOrder S] (B : Set S) (HB : Set.Nonempty B)
(L : Set S) (HL : Set.Nonempty L) (HL' : L = lowerBounds B) (α : S) (Hα : IsLUB L α) : IsGLB B α := sorry

import Mathlib.Init.Order.Defs
import Mathlib.Init.Set
import Mathlib.Order.Bounds.Basic

theorem sup_of_lower_bounds {S : Type*} [LinearOrder S]
    (B : Set S) (L : Set S) (hL : L = lowerBounds B) (hL : L.Nonempty)
    {α : S} (hα : IsLUB L α) :
    IsGLB B α := by
  subst L
  simp only [IsGLB, IsLUB, IsLeast, IsGreatest] at *
  constructor
  · have := lowerBounds_mono_set (subset_upperBounds_lowerBounds B)
    exact this hα.2
  · exact hα.1
