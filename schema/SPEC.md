# thinker.toml — Specification v1.0

Canonical specification for the thinker manifest in the Noesis taxonomy. Each thinker is defined by 6 mandatory layers + taxonomy positioning + sources.

Reference implementation: [`thinker.toml.schema.json`](thinker.toml.schema.json)

---

## Layers

### Capa 0: Identity

Who this thinker is. Their name, tradition, and self-knowledge of their own limits.

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `slug` | string | ✅ | URL-safe identifier, matches directory name (e.g., `critical`) |
| `display_name` | string | ✅ | Human-readable name (e.g., "Critical Thinker") |
| `tagline` | string | — | One-line essence, max 120 chars |
| `tradition` | string | ✅ | Academic tradition this thinker belongs to |
| `self_acknowledged_biases` | string[] | ✅ | Known biases and blind spots. MUST have ≥1 entry — every lens distorts |

### Capa 1: Cognitive Profile

How this thinker thinks. The core engine of the perspective.

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `characteristic_questions` | string[] | ✅ | Questions this thinker habitually asks. MUST have ≥2 |
| `heuristics` | string[] | — | Rules of thumb that guide reasoning |
| `epistemic_vices` | string[] | ✅ | Negative tendencies. MUST have ≥1 |
| `stops_when` | string | — | When this thinker considers thinking complete |
| `ignores` | string[] | — | What this thinker deliberately excludes |
| `metacognitive_awareness` | object | — | Self-assessment calibration and delegation awareness |

### Capa 2: Skills

What capabilities this thinker needs. Can be empty (pure reasoning without tools).

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `declared` | string[] | ✅ | List of required capabilities (may be empty: `[]`) |
| `tools_preference` | object[] | — | Preferred tool categories with examples |

### Capa 3: Memory

What, how long, and how this thinker remembers.

| Field | Type | Description |
|-------|------|-------------|
| `type` | enum | `ephemeral` (session-only), `accumulating` (builds over time), `reindexing` (reorganizes periodically), `none` |
| `retention` | string | Duration: `session`, `conversation`, `indefinite` |
| `structure` | string | Storage structure: `flat`, `hierarchical`, `associative` |

### Capa 4: Context

How this thinker builds, prioritizes, and prunes its context window.

| Field | Type | Description |
|-------|------|-------------|
| `strategy` | enum | `recency`, `relevance`, `summary`, `sliding_window`, `full_context`, `delegated` |
| `max_tokens_preference` | integer | Preferred window size (0 = no preference) |
| `pruning` | string | What to drop when window fills |

### Capa 5: Runtime

How this thinker executes. Hints for the engine that gives it life.

| Field | Type | Description |
|-------|------|-------------|
| `preferred_execution` | enum | `single_pass`, `chain_of_thought`, `tree_search`, `tool_loop`, `reactive`, `unspecified` |
| `loops_when` | string | When to iterate |
| `delegation_policy` | string | When to hand off to another thinker |

---

## Taxonomy Positioning

Places the thinker in the taxonomy graph.

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `taxonomy.family` | string[] | — | Families (multiple allowed) |
| `taxonomy.related` | object[] | — | Relationships: `complements`, `contrasts_with`, `derives_from`, `parent_of` |

## Sources

Academic references grounding this thinker. Minimum 3 with DOIs.

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `author` | string | ✅ | Author name(s) |
| `year` | integer | ✅ | Publication year |
| `title` | string | ✅ | Work title |
| `doi` | string | — | DOI URL (format: `https://doi.org/10.xxx/...`) |
| `relevance` | string | — | Why this source matters |

---

## Extensions

The `[extensions]` table in TOML allows arbitrary key-value pairs for experimental or domain-specific fields. Use `x-` prefix for properties under `extensions` (following Agent Manifest convention). Extensions MUST NOT contradict required fields.

---

## Changelog

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-08-01 | Initial release. 6 layers + taxonomy + sources + extensions |
