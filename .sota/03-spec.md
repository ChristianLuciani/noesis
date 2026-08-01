# Spec: NOESIS — Taxonomy of Thinking Perspectives

> Fase: sota-spec | Aprobación: ✅ Christian Luciani, 2026-08-01
> Cambio post-aprobación: mdBook → Zola (2026-08-01)
> Repo A: `noesis` (este spec) | Repo B: `noetix` (spec separado, futuro)

## Design Summary

`noesis` es un repositorio que codifica **modos de pensamiento como agentes declarativos**, organizados en una taxonomía navegable. Cada pensador es un directorio con `thinker.toml` (6 capas canónicas: identidad → perfil cognitivo → skills → memoria → contexto → runtime), `EXAMPLES.md` (mismo problema, esta perspectiva), y `SOURCES.md` (tradición académica). El repo se renderiza como libro navegable (mdBook) y se gobierna a sí mismo: el consejo de pensadores evalúa nuevas contribuciones. No es un runtime — es un blueprint agnóstico de framework. El runtime vive en `noetix`.

La taxonomía inicial abarca ~14 pensadores en 5 familias (Modo de Procesamiento, Dirección de Razonamiento, Lentes Analíticos, Orientación Temporal, Meta/Estructural), basados en tradiciones académicas rastreables (Kahneman, De Bono, Bloom, Guilford, Felder-Silverman, Moseley et al., fullo). Cada pensador declara su lente, sus sesgos reconocidos, y sus fuentes.

El repo tiene 3 gates de contribución: técnico (CI), taxonómico (mantenedores), y filosófico (consejo de pensadores, aspiracional). Los pensadores evalúan pensadores — meta-cognición como gobernanza.

## Execution Mode

**/goal** — con bloques de tareas paralelizables. El estado final es verificable: repo en GitHub con estructura de directorios, thinker.toml schema validado, ≥12 pensadores seed con sus 3 archivos obligatorios, CI funcionando, mdBook desplegado, y protocolo de gobernanza documentado. Los bloques independientes (seed thinkers) se construyen en paralelo.

**Por qué no one-shot:** el proyecto es multi-archivo con dependencias parciales y tareas heterogéneas (schema, contenido, CI, docs). **Por qué no /loop:** no requiere polling. **Por qué no skill:** es un proyecto único, no recurrente.

---

## Task Blocks

### T1: MODEL_PARAMS.md — Vendor-agnostic model configuration
- **goal:** Archivo `MODEL_PARAMS.md` que define tiers de capacidad (no modelos concretos), providers soportados, y cómo configurar el entorno
- **context:** `03-spec.md` (tiers FAST/MID/STRONG), model-routing skill
- **constraints:** Zero hardcoding de modelos, soporte mínimo para OpenAI + Anthropic + Ollama + LM Studio + LiteLLM, documentar variables de entorno necesarias sin exponer valores
- **completion:**
  - `MODEL_PARAMS.md` existe con:
    - Tabla de capability tiers (FAST, MID, STRONG) con capacidades mínimas sugeridas (no modelos)
    - Ejemplos de modelos que satisfacen cada tier en cada provider
    - Variables de entorno documentadas (`OPENAI_API_KEY`, `ANTHROPIC_API_KEY`, `OLLAMA_HOST`, `LM_STUDIO_HOST`, `LITELLM_ENDPOINT`)
    - BYOK explicado: el repo nunca硬编码a un modelo; el usuario configura su provider en `.env`
    - Ejemplo de `.env.example`
- **model_tier:** FAST (≥ haiku-class: documentación estructurada con criterios explícitos)
- **effort:** low
- **parallel_group:** —
- **depends_on:** —
- **hints:** Usar la tabla de model-routing como base. Documentar qué capacidades mínimas hacen falta para cada tier (ej. FAST: ~8B params, sigue instrucciones, ventana ≥8K tokens; MID: ~70B params, razonamiento multi-step; STRONG: frontier-class, debugging sin repro). No nombrar versiones específicas que envejecerían.

### T2: Repository scaffold
- **goal:** Estructura inicial del repo `noesis` con README, LICENSE, CONTRIBUTING.md, CODEOWNERS, .gitignore, `.env.example`
- **context:** `01-brief.md` (secciones Constraints, Non-Goals), `02-prior-art.md` (sección Implications for the spec #6, #7), `MODEL_PARAMS.md` (T1)
- **constraints:** AGNÓSTICO de framework (no incluir código de runtime), licencia abierta (CC BY 4.0 para contenido y MIT para código/TOML), monorepo con estructura plana bajo `/thinkers/`, `.env.example` referencia `MODEL_PARAMS.md`
- **completion:**
  - `README.md` existe con: nombre + tagline, tesis del proyecto, estructura del repo, quick start para contribuir, badge BYOK
  - `LICENSE` existe (MIT para código/TOML, CC BY 4.0 para contenido/pensadores, como Agent Manifest)
  - `CONTRIBUTING.md` describe los 3 gates y cómo proponer un nuevo pensador
  - `CODEOWNERS` asigna revisión de `/thinkers/` a mantenedores
  - `.gitignore` cubre build artifacts de mdBook y `.env`
  - `.env.example` lista variables de entorno sin valores (ver MODEL_PARAMS.md)
- **model_tier:** MID (≥ sonnet-class: code generation from complete spec, cost-aware)
- **effort:** low
- **parallel_group:** —
- **depends_on:** [T1]
- **hints:** Usar estructura plana `/thinkers/<slug>/`, no anidar familias. Las familias son metadata en `thinker.toml`, no directorios — esto permite que un pensador pertenezca a múltiples familias. Ver Agent Manifest para patrón de dual-licensing. Para parámetros de modelo/provider ver `MODEL_PARAMS.md`.

### T3: thinker.toml schema
- **goal:** JSON Schema canónico para `thinker.toml` v1.0, documentado con ejemplos
- **context:** `01-brief.md` (6 capas canónicas), `02-prior-art.md` (R3: Agent Manifest extensibility pattern, R5: fullo 5 dimensions)
- **constraints:** 6 capas obligatorias (identity, cognitive_profile, skills, memory, context, runtime), extensible vía `[extensions]`, formato TOML (más legible que JSON/YAML para humanos), schema debe ser validable por CI
- **completion:**
  - `schema/thinker.toml.schema.json` existe y valida contra JSON Schema draft-2020-12
  - `schema/EXAMPLES.md` muestra ≥3 ejemplos completos (ej. systemic, critical, game-theoretic)
  - `schema/SPEC.md` documenta cada capa, campo, tipo, requerido/opcional, y valores válidos
  - Incluye campo `family` (array, permite múltiples familias) y campo `sources` (array de referencias académicas con DOI)
  - Incluye campo `related` (array de slugs de pensadores relacionados: complements, contrasts_with, derives_from)
- **model_tier:** MID (≥ sonnet-class: code generation from complete spec, structured schema design)
- **effort:** medium
- **parallel_group:** A
- **depends_on:** —
- **hints:** La capa 0 (identity) debe incluir `self_acknowledged_biases` (array) — los sesgos que el pensador reconoce tener. Esto es clave para honestidad epistémica. La capa 1 (cognitive_profile) debe incluir `characteristic_questions` (array de preguntas que este pensador típicamente hace). Usar `x-` prefix de Agent Manifest como referencia para extensibilidad.

### T4: Initial taxonomy catalog
- **goal:** Documento `TAXONOMY.md` que define las familias y los ~14 pensadores seed
- **context:** `01-brief.md` (tesis, motivación), `02-prior-art.md` (R2: taxonomías existentes — De Bono, Bloom, Kahneman, Felder-Silverman, fullo, Moseley et al.)
- **constraints:** Cada pensador debe tener tradición académica rastreable (filtro 2 del brief), mínimo 12 pensadores, cada uno asignado a ≥1 familia
- **completion:**
  - `TAXONOMY.md` existe con:
    - Introducción explicando la organización (familias, relaciones, cómo navegar)
    - 5 familias definidas con descripción y fuentes
    - ~14 pensadores listados con: slug, nombre, familia(s), tradición académica, descripción de 1-2 líneas
    - Mapa visual de relaciones (tabla o diagrama ASCII: complements, contrasts_with, derives_from)
  - Alineado con `02-prior-art.md` R2 — cada pensador cita su fuente canónica
- **model_tier:** MID (≥ sonnet-class: synthesis from prior art, structured taxonomy design)
- **effort:** medium
- **parallel_group:** A
- **depends_on:** —
- **hints:** Los pensadores NO son chatbots con personalidad — son modos de razonamiento. La descripción debe capturar LA PREGUNTA que ese pensador hace y LA HERRAMIENTA que usa, no su "personalidad". Ej: Systemic Thinker pregunta "¿cómo se relacionan las partes con el todo?" y usa diagramas causales. NO describir como "es calmado y reflexivo."

### T5a–T5n: Seed thinkers (grupo paralelo B)
- **goal:** Crear directorio completo para cada pensador seed: `thinker.toml` + `EXAMPLES.md` + `SOURCES.md`
- **context:** `TAXONOMY.md` (T3), `schema/thinker.toml.schema.json` (T2), `02-prior-art.md` (R2, R4)
- **constraints:** Cada `thinker.toml` debe validar contra el schema, `EXAMPLES.md` debe usar el MISMO problema de referencia en todos los pensadores para demostrar diversidad de perspectivas, `SOURCES.md` debe tener ≥3 referencias con DOI verificable
- **completion:** Para cada pensador:
  - `thinkers/<slug>/thinker.toml` válido y completo (6 capas)
  - `thinkers/<slug>/EXAMPLES.md` con el problema canónico resuelto desde esta perspectiva
  - `thinkers/<slug>/SOURCES.md` con referencias académicas verificables
- **model_tier:** MID (≥ sonnet-class: creative content generation from spec + prior art, parallel batch)
- **effort:** medium
- **parallel_group:** B
- **depends_on:** [T3, T4]
- **hints:** Elegir UN problema canónico para todos los EXAMPLES.md — que sea rico en dimensiones (técnico, ético, estratégico, temporal). Sugerencia: "¿Debería una ciudad implementar reconocimiento facial en espacios públicos?" — involucra tecnología, ética, política, estadística, sistemas, temporalidad. El `thinker.toml` de cada pensador debe incluir `self_acknowledged_biases` honestos (no "ninguno" — todo modo de pensar tiene puntos ciegos). Usar los hallazgos de CoNL y MetaCogAgent para informar la capa de `cognitive_profile.metacognitive_awareness`.

### T5 batch assignment:
| ID | Pensador | Slug | Familia | Fuente canónica |
|----|----------|------|---------|-----------------|
| T5a | Reactive Thinker | `reactive` | Processing Mode | Kahneman (2011) System 1 |
| T5b | Reflective Thinker | `reflective` | Processing Mode | Kahneman (2011) System 2 |
| T5c | Divergent Thinker | `divergent` | Reasoning Direction | Guilford (1956), De Bono Green Hat |
| T5d | Convergent Thinker | `convergent` | Reasoning Direction | Guilford (1956), De Bono Black Hat |
| T5e | Lateral Thinker | `lateral` | Reasoning Direction | De Bono (1967) |
| T5f | Systemic Thinker | `systemic` | Analytical Lenses | Bertalanffy, Meadows, Senge |
| T5g | Statistical Thinker | `statistical` | Analytical Lenses | Fisher, Neyman-Pearson, Bayesian |
| T5h | Scientific Thinker | `scientific` | Analytical Lenses | Popper, Kuhn |
| T5i | Critical Thinker | `critical` | Analytical Lenses | Socrates, Dewey, Paul-Elder |
| T5j | Game-Theoretic Thinker | `game-theoretic` | Analytical Lenses | von Neumann, Nash, Schelling |
| T5k | Long-Term Thinker | `long-term` | Temporal Orientation | Bostrom, MacAskill, longtermism |
| T5l | Short-Term Thinker | `short-term` | Temporal Orientation | Constraints-based, agile |
| T5m | Metacognitive Thinker | `metacognitive` | Meta & Structural | Flavell (1979) |
| T5n | Analogical Thinker | `analogical` | Meta & Structural | Gentner (1983), Hofstadter (2013) |

### T6: CI validation
- **goal:** GitHub Actions workflow que valida PRs: (a) `thinker.toml` contra el JSON Schema, (b) archivos obligatorios presentes, (c) `SOURCES.md` tiene ≥3 referencias con DOI, (d) `EXAMPLES.md` existe y tiene contenido sustancial
- **context:** `schema/thinker.toml.schema.json` (T2), estructura de directorios (T1)
- **constraints:** Corre en cada PR a `/thinkers/`, no bloquea PRs que no tocan `/thinkers/`, usa validación determinista (sin llamadas a LLM)
- **completion:**
  - `.github/workflows/validate-thinker.yml` existe
  - Valida TOML syntax + schema compliance + archivos obligatorios + referencias en SOURCES.md
  - CI pasa con los pensadores seed existentes
  - Documentado en CONTRIBUTING.md cómo interpretar fallos de CI
- **model_tier:** FAST (≥ haiku-class: mechanical scripting with explicit criteria, deterministic validation)
- **effort:** low
- **parallel_group:** C
- **depends_on:** [T3]
- **hints:** Usar `toml` y `jsonschema` Python packages. Validar DOI con regex (no con API calls que fallen por rate limiting). La validación de "contenido sustancial" en EXAMPLES.md puede ser un mínimo de 200 palabras.

### T7: Zola static site — Neuro-friendly render
- **goal:** Configuración de Zola que renderiza la taxonomía como sitio navegable con taxonomías (familias, estrategias, direcciones), página por pensador, y relaciones cruzadas visibles. Diseño neuro-friendly obligatorio.
- **context:** `01-brief.md` (el repo es educativo), `TAXONOMY.md` (T4), estructura `/thinkers/` (T2)
- **constraints:** Deployed via GitHub Pages, generación de páginas automática desde `/thinkers/` vía script, usa taxonomías nativas de Zola para familias y dimensiones. **DISEÑO NEURO-FRIENDLY OBLIGATORIO:** tipografía de alto contraste, máximo ~70 caracteres por línea, espaciado generoso, sin animaciones, dark/light mode vía `prefers-color-scheme`, tipografía serif para lectura + sans-serif para UI, zero JavaScript innecesario, navegación predecible, legible en móvil.
- **completion:**
  - `site/config.toml` configurado con título "Noesis", taxonomías (familia, processing_mode, reasoning_direction), i18n es/en
  - `site/templates/` con templates Tera para thinker page, family index, taxonomy list, home
  - `site/sass/` con estilos neuro-friendly (dark/light, 70ch, serif/sans)
  - Script `scripts/build-site.sh` que genera `site/content/` desde `/thinkers/` + `TAXONOMY.md`
  - GitHub Actions `.github/workflows/deploy-site.yml` que buildea Zola y deploya a GitHub Pages
  - CSS cumple todos los requisitos neuro-friendly listados en constraints
- **model_tier:** MID (≥ sonnet-class: static site generation + templating + CSS)
- **effort:** medium
- **parallel_group:** D
- **depends_on:** [T5a–T5n, T4]
- **hints:** Las taxonomías de Zola (`taxonomies` en config.toml) permiten que cada pensador tenga tags para familia, processing_mode, reasoning_direction, temporal_orientation. Zola genera automáticamente páginas de índice por tag y listas de pensadores por tag. Usar Tera templates con `get_taxonomy` para mostrar relaciones cruzadas ("Pensadores que complementan a este:"). El script `build-site.sh` convierte cada `thinker.toml` en un .md con frontmatter TOML para Zola, asignando taxonomías según el campo `family` y dimensiones del perfil cognitivo.

### T8: Governance protocol
- **goal:** Documento `GOVERNANCE.md` que define el proceso de gobernanza en 3 niveles, incluyendo el protocolo del consejo de pensadores
- **context:** `01-brief.md` (gates de contribución), `02-prior-art.md` (R4: MetaCogAgent, CoNL), `CONTRIBUTING.md` (T2)
- **constraints:** El consejo de pensadores como gate de nivel 3 es ASPIRACIONAL (documentado como simulación/ejercicio), no reemplaza revisión humana, es transparente en sus limitaciones
- **completion:**
  - `GOVERNANCE.md` existe con:
    - Nivel 1: CI gate (técnico, automático)
    - Nivel 2: Taxonomic gate (mantenedores humanos, criterios de distinguibilidad y tradición)
    - Nivel 3: Council gate (consejo de pensadores, aspiracional, protocolo de evaluación)
    - Proceso de apelación y override por mantenedores
    - Cómo escalar de contribuidor a mantenedor
  - Referencia a `02-prior-art.md` para fundamentar el protocolo de meta-evaluación (CoNL diagnostic reward)
- **model_tier:** MID (≥ sonnet-class: structured policy document from spec + prior art)
- **effort:** medium
- **parallel_group:** E
- **depends_on:** [T2]
- **hints:** El council gate usa un protocolo inspirado en CoNL: 3+ pensadores evalúan al candidato, cada uno produce un "diagnostic signal" sobre si el candidato (a) llena un vacío taxonómico real, (b) es distinguible de pensadores existentes, (c) respeta la tesis del proyecto. No es votación — es deliberación estructurada con reasoning público.

### T9: Council bootstrapping prompt
- **goal:** Template/prompt que permite al consejo de pensadores evaluar un nuevo pensador candidato, usando el protocolo de T8
- **context:** `GOVERNANCE.md` (T8), `02-prior-art.md` (R4: CoNL protocol), pensadores seed (T5)
- **constraints:** Funciona con cualquier LLM que soporte system prompts, no asume acceso a OpenAI/Anthropic, output estructurado (JSON) para trazabilidad, incluye instrucciones de meta-cognición
- **completion:**
  - `council/evaluate.md` — instrucciones para el consejo (system prompt reutilizable)
  - `council/EVALUATION_TEMPLATE.toml` — formato estructurado de evaluación que produce cada pensador
  - `council/README.md` — cómo invocar una evaluación del consejo
  - Prompt de ejemplo mostrando 3 pensadores evaluando un candidato (ej. divergent evaluando a lateral)
- **model_tier:** STRONG (≥ opus-class: nuanced prompt design with metacognitive structures, ambiguous creative work)
- **effort:** high
- **parallel_group:** E
- **depends_on:** [T8, T5a–T5n]
- **hints:** El prompt debe INSTRUIR a cada pensador a declarar su propia incertidumbre sobre la evaluación ("confidence: 0.7") y reconocer sus sesgos al evaluar. Esto es meta-cognición aplicada. Incorporar el patrón de CoNL: "evalúa al candidato, luego explica cómo tu evaluación podría estar sesgada por tu propia lente de pensamiento." El output estructurado debe ser parseable por CI para el nivel 3 cuando madure.

---

## Task Dependency Graph

```
T1 (MODEL_PARAMS) ────────────────────────────────────┐
T2 (repo scaffold) ───────────────────────────────────┤
                                                       │
T3 (schema) ──────┬── T5a..T5n (seed thinkers) ── T7 (mdBook)
T4 (taxonomy) ────┘           │                         
                               ├── T9 (council prompt)   
T6 (CI) ──────────────────────┘                         
                                                        
T2 ── T8 (governance) ──────── T9                       
```

**Grupos paralelos:**
- A: T3 + T4 (independientes entre sí)
- B: T5a–T5n (14 pensadores, todos independientes entre sí)
- C: T6 (independiente, solo depende de T3)
- D: T7 (depende de T5 completo)
- E: T8 + T9 (T9 depende de T8 y T5; T8 depende de T2)

**Path crítico:** T3 → T5 → T7 (~3 bloques secuenciales)

---

## Acceptance

El repo `noesis` está listo cuando:
0. `MODEL_PARAMS.md` define tiers de capacidad, providers soportados, y guía de configuración
1. `README.md`, `LICENSE`, `CONTRIBUTING.md`, `CODEOWNERS`, `.gitignore`, `.env.example` existen y son coherentes
2. `schema/thinker.toml.schema.json` valida y está documentado con `SPEC.md` y `EXAMPLES.md`
3. `TAXONOMY.md` define ≥5 familias y ≥14 pensadores con fuentes académicas
4. Existen ≥12 directorios `/thinkers/<slug>/` con `thinker.toml`, `EXAMPLES.md`, y `SOURCES.md` completos
5. CI (`validate-thinker.yml`) pasa en todos los pensadores seed
6. `book.toml` + script + GitHub Actions deployan mdBook neuro-friendly a GitHub Pages
7. `GOVERNANCE.md` documenta el proceso de 3 niveles (CI → mantenedores → consejo)
8. `council/` contiene el protocolo de evaluación del consejo con prompt y template estructurado
9. `02-prior-art.md` está linkeado desde `README.md` como antecedentes

---

## Assumptions and Risks

**Assumptions:**
- El repo se aloja en GitHub (para CI, Pages, PR reviews)
- Los pensadores seed son curados por los mantenedores iniciales (no vía PR comunitario)
- El consejo de pensadores (nivel 3) funciona como simulación/ejercicio inicialmente — no tiene poder de veto
- `noetix` (Repo B) se especifica y construye separadamente
- **VENDOR-AGNOSTIC:** Todo contenido generado con LLMs debe ser posible con ≥1 provider (OpenAI, Anthropic, Ollama, LM Studio, LiteLLM). Ver `MODEL_PARAMS.md`. Ningún bloque asume un modelo o API key específico.

**Risks:**
1. **Calidad de los seed thinkers:** si los primeros pensadores son mediocres, la taxonomía pierde credibilidad. Mitigación: revisión por pares (mantenedores) antes de merge.
2. **Ambigüedad taxonómica:** los límites entre algunos modos de pensamiento son difusos (ej. ¿critical vs scientific?). Mitigación: `related` field en thinker.toml documenta overlaps explícitamente.
3. **Deriva del consejo:** sin supervisión humana, el council gate podría volverse un eco chamber. Mitigación: el nivel 3 es aspiracional y siempre override-able por mantenedores.
4. **Adopción:** si nadie contribuye, el repo es un catálogo estático. Mitigación: mdBook educativo + problemas canónicos + integración futura con `noetix` como consumidor visible.
