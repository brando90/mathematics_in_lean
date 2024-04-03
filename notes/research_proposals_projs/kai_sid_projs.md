# Project Options: Using Formalization & Informalization to improve all Benchmarks

Three Standard benchmarks to evaluate on:
1. Autoformalization (AF) e.g., ProofNet, debug1, IsaAF
   1. metrics: CE loss/perplexity (extact string mathc, formal equivalence)
2. Informal Theorem Proving (iTP) e.g., MATH
   1. metrics: exact match on boxed answers.
3. Formal Theorm Proving (fTP) e.g., MiniF2F, LeanDojo's Mathlib split
   1. metrics: proving accuracy

Project Options (always thinking how to improve the above 3 benchmarks + what is the new conceptual novel contribution):
1. formal proofs -> informal proofs (main: improve ProofNet, MATH)
   1. Contribution: a. show formal proofs improve informal reasoning 2. easy way to get more formal, formal data for AF that is high quality
   - tasks:
      1. From already existing formal proofs generate AF pairs (e.g., execute formal proof to get `full_formal_proof=<thm, ps, tac, ...>` and informalize it, also at each step too, [extra proof term version too])
      2. generates informal proofs to train for MATH `full_informal_proof=LLM(full_formal_proof, "informalize formal proof ")`
      3. how does it improve MiniF2F?
      4. Compute alignments/quality to the above target benchmarks (let's precompute task2vec embedding of the (val) target benchmarks)
2. informal problems/thms `i_thm` -> formal problem/thm `f_thm` -> formal proofs `f_pf` (say resticted to IMO so to improve IMO reasoning or restricted to higher level mathematics but that needs a new benchmark)
   1. Contribution: demonstrate data (thms/pfs,problems/solns) from textbook improve language models at: the 3 benchmarks above (& beat Tony's current work AF work)
   - tasks:
      1. extract textbook level problems/solutions (e.g., AMPS, IMO, higher maths level textbooks) and do: `i_thm` -> `f_thm` -> `f_pf` -> `i_pf`.
         - build an neural theorem prover NTP for the above with expert iteration (start from something easy to use e.g., LeanDojo's ReProver?)
         - find a way to reliably get `i_thm` -> `f_thm` (e.g., see MiniF2F and use mathlib)
         - then once we get proofs, decide which `f_pf` to train on (the ones that compile, type check, proof the theorem, train on the ones with high back translation to informal language)
      2. generate formal proofs for MATH's APS and repeat above
      3. Report improvement on all 3: AF, MATH, TP
      4. Study data alignment/quality
3. In depth study of different data domains on 3 benchmarks & quantitative [data quality](https://github.com/brando90/beyond-scale-language-data-diversity/blob/main/notes/data_quality_eq_div_plus_alignment_and_data_selection.md)/[alignment](https://github.com/brando90/evals-for-autoformalization/blob/main/notes/research_proposals_projs/data_selection_with_alignment_for_af.md) metrics (other ref [Align for AF](https://github.com/brando90/evals-for-autoformalization/blob/main/notes/research_proposals_projs/af-ft-plan-kai-align-vs-eval-perf.jpeg))
   1. coq, isabelle, pair, unpaired, mixed but unpaired, textbook, python-docstrings, etc
   2. I feel we can give up this part and instead do 1 & 2 and put the data metrics study at the end
4. Formalize a textbook autonomously + improve AF on a new textbook AF based benchmark
5. Continually training on [all maths data](https://github.com/brando90/evals-for-autoformalization/blob/main/notes/research_proposals_projs/math_pile_list.md)
6. prompting + data generation with
   1. Mathematics_and_Plausible_Reasoning_vol2_G_Polya_Patterns_of_Plausible_Inference_Princeton_Univ_Pr_1969
   2. George_Polya_How_to_Solve_It_A_New_Aspect_of_Mathematical_Method_Princeton_University_Press_2015   
7. Backtranslation based data augmentation using mathematical textbooks

idea of ps, tact -> informal docs informal 
Remark: 
   - How to do `f_pf` -> `i_pf`
   - For every proof step we have `proof_state, tactic` (short `ps, tac`):
      - We create `full_formal_proof=<thm, ps, tac, ...>`
      - We informalize step by step: 
         - `LLM(ps, "informalie") -> i_ps`
         - `LLM(tac, "informalize") -> i_reasoning_step = i_rea_step`. Here the prompt engineering is important. We use few-shot example + importantly, the observation tactics are really hard to make human/informal interpretable. So we use the change in the proof state + the documentation of the tactic to produce a high quality informalization.
         - then concantenate to produce a proof/solution that AF based (not exactly synthetic)
         - (we can always improve diversity via MetaMath's techniques)
needs:
   1. Neural Theorem Prover (parsel, DSP, ReProver)
   2. Expert Iteration

Question:
   - does MMA train on informalizations of formal proof steps to improve AF? Or only on theorems? What exactly do they train on?

# Wish list

- Better benchmarks
   - split mathlib for a new thm proving benchmark & AF benchmark
   - textbook based AF (and thm but harder to guarantee thms are right), extract thm, proofs for a solid benchmark of about 5K test examples (that's the size of MATH)
