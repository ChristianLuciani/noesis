# Council Evaluation — Protocol

How to invoke the Noesis Council of Thinkers to evaluate a candidate thinker.

---

## What the Council Does

The council is a simulation of meta-cognitive governance. 3+ thinkers from the Noesis taxonomy evaluate a proposed new thinker, each from their own perspective. Their evaluations are **consultative**, not binding — the final decision rests with human maintainers.

---

## How to Invoke

### Prerequisites

1. A candidate thinker exists in a PR with `thinker.toml` + `EXAMPLES.md` + `SOURCES.md`
2. At least 3 existing thinkers from the taxonomy are selected for the council
3. Access to a LLM that supports system prompts (≥ MID tier recommended)

### Quick Start

```bash
# Using the CLI helper (coming in noetix)
# For now, manual invocation:

# 1. Select council members (at least 3, ideally from different families)
# 2. For each council member, run:
python3 -c "
import sys
sys.path.append('.')
# Load thinker profile and evaluation template
# Send to LLM with evaluate.md as system prompt
"

# 3. Collect evaluations in PR as structured comments
```

### Manual Invocation

1. Copy [`evaluate.md`](evaluate.md) as the **system prompt**
2. Copy the candidate's `thinker.toml` and `EXAMPLES.md` content
3. For each council member:
   - Prepend their identity from `thinkers/<slug>/thinker.toml` (identity + cognitive_profile sections)
   - Send to LLM with the evaluation prompt
4. Collect output in [`EVALUATION_TEMPLATE.toml`](EVALUATION_TEMPLATE.toml) format
5. Post as PR comments

### Selecting Council Members

Choose thinkers from **different families** to maximize perspective diversity:

| If candidate is in... | Council should include... |
|----------------------|--------------------------|
| Analytical Lenses | 1 Meta & Structural + 1 Processing Mode + 1 different Analytical Lens |
| Reasoning Direction | 1 Processing Mode + 1 Analytical + 1 Meta |
| Temporal Orientation | 1 Processing Mode + 1 Analytical + 1 Meta |
| Processing Mode | 1 Analytical + 1 Reasoning + 1 Meta |
| Meta & Structural | 1 Processing + 1 Analytical + 1 Reasoning |

Always include `metacognitive` if available — it's designed for exactly this task.

---

## Interpreting Results

Each council member produces a structured evaluation with:

- **recommendation:** accept / revise / reject
- **confidence:** 0.0–1.0 (how sure they are)
- **self_assessment:** how their own biases may have influenced the evaluation
- **diagnostic_signal:** specific feedback that could improve the candidate

Maintainers read all evaluations and make the final decision. Strong consensus (≥3/4 agree) is informative but not binding. A single dissenting voice with high confidence and good reasoning should be taken seriously.

---

## Limitations

- The council is a **simulation.** Thinkers are LLM instances, not autonomous agents.
- Thinkers may exhibit sycophancy (agreeing with the perceived "correct" answer).
- Counteract this by instructing them to find at least one genuine concern, even if overall favorable.
- The council does not replace human judgment — it augments it with structured multi-perspective feedback.
