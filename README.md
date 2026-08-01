# Noesis — νοησις

> *from Greek νόησις — the act of thinking, understanding, pure thought*

A taxonomy of thinking perspectives encoded as cognitive agent blueprints. Study the structure to broaden your thinking. Activate the thinkers to attack problems from multiple lenses.

**Noesis is the map. [Noetix](https://github.com/ChristianLuciani/noetix) is the engine.**

---

## Tesis

Los humanos tenemos **limitaciones de pensamiento, no de inteligencia**. Nuestra personalidad, educación y cultura nos atan a sesgos cognitivos que nos impiden acceder a esquemas de pensamiento en los que no fuimos entrenados.

Noesis existe para liberarnos de esas limitaciones: **desmantelar paradigmas limitantes y dejar florecer paradigmas expansivos.**

---

## Cómo funciona

Noesis organiza modos de pensamiento en una **taxonomía navegable**. Cada pensador es un directorio con:

```
thinkers/<slug>/
├── thinker.toml    ← 6 capas canónicas: identidad → perfil cognitivo → skills → memoria → contexto → runtime
├── EXAMPLES.md     ← un mismo problema, visto desde esta perspectiva
└── SOURCES.md      ← tradición académica, autores, referencias con DOI
```

### Leer = Aprender

La estructura misma del repositorio es educativa. Navegar la taxonomía te expone a perspectivas que quizás nunca habrías considerado. Cada `thinker.toml` revela no solo cómo piensa ese modo, sino sus **sesgos reconocidos** y sus **preguntas características**.

### Activar = Ejercitar

Los blueprints son agnósticos de framework — cualquier runtime de agentes puede consumirlos. Noesis no ejecuta agentes. Para darles vida, usa [Noetix](https://github.com/ChristianLuciani/noetix) o tu propio runtime.

---

## Taxonomía

14 pensadores en 5 familias:

| Familia | Pensadores |
|---------|-----------|
| **Processing Mode** | Reactive (System 1), Reflective (System 2) |
| **Reasoning Direction** | Divergent, Convergent, Lateral |
| **Analytical Lenses** | Systemic, Statistical, Scientific, Critical, Game-Theoretic |
| **Temporal Orientation** | Long-Term, Short-Term |
| **Meta & Structural** | Metacognitive, Analogical |

[Explorar la taxonomía completa →](https://christianluciani.github.io/noesis)

---

## Contribuir

¿Conoces un modo de pensamiento que no está representado? Noesis es colaborativo y creciente.

1. Lee [`CONTRIBUTING.md`](CONTRIBUTING.md) — los 3 gates de aceptación
2. Crea un directorio `/thinkers/<tu-slug>/` con los 3 archivos obligatorios
3. El CI validará tu `thinker.toml` automáticamente
4. Un mantenedor revisará la distinguibilidad taxonómica
5. El consejo de pensadores evaluará la alineación filosófica

---

## Estructura del repositorio

```
noesis/
├── thinkers/           ← Blueprints de pensadores
│   └── <slug>/
│       ├── thinker.toml
│       ├── EXAMPLES.md
│       ├── SOURCES.md
│       └── paper.md (opcional)
├── schema/             ← JSON Schema + documentación de thinker.toml
├── council/            ← Protocolo de gobernanza del consejo de pensadores
├── site/               ← Zola static site (taxonomía navegable)
├── scripts/            ← Build + validación
├── TAXONOMY.md         ← Catálogo completo de familias y pensadores
├── MODEL_PARAMS.md     ← Configuración vendor-agnostic de LLMs
├── GOVERNANCE.md       ← Proceso de gobernanza en 3 niveles
├── CONTRIBUTING.md     ← Cómo proponer un nuevo pensador
└── .sota/              ← Antecedentes: brief, prior art, spec (ver más abajo)
```

---

## BYOK — Bring Your Own Key

Noesis no硬编码a ningún modelo ni provider. Usa el que tengas: OpenAI, Anthropic, Ollama, LM Studio, o LiteLLM. Ver [`MODEL_PARAMS.md`](MODEL_PARAMS.md).

---

## Antecedentes

Este proyecto fue diseñado usando el workflow SOTA:

- [`01-brief.md`](.sota/thought-perspectives/01-brief.md) — entrevista de clarificación
- [`02-prior-art.md`](.sota/thought-perspectives/02-prior-art.md) — investigación de prior art
- [`03-spec.md`](.sota/thought-perspectives/03-spec.md) — especificación de construcción

---

## Licencia

- Código y esquemas: [MIT](LICENSE)
- Contenido de pensadores (`/thinkers/`): [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)
