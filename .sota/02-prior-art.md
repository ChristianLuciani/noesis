# Prior Art Research: Taxonomy of Thinking Perspectives

> Fase: sota-research | Fecha: 2026-08-01

## Research Questions

| # | Pregunta | Trazabilidad |
|---|----------|-------------|
| R1 | ¿Qué proyectos tipo "consejo de agentes LLM" existen? | Éxito: demuestra tesis de perspectivas complementarias |
| R2 | ¿Qué taxonomías de pensamiento/cognición están documentadas? | Constraint: tradición identificable y rastreable |
| R3 | ¿Existen formatos estándar para describir agentes declarativamente? | Constraint: agnóstico de framework |
| R4 | ¿Existen sistemas de meta-cognición donde agentes evalúan pensamiento? | Éxito: mecanismos de auto-evaluación |
| R5 | ¿Existe el concepto de "agente compuesto" en la literatura? | Open risk: hipótesis de agente compuesto → Repo B |
| R6 | ¿Se ha convertido una taxonomía de pensamiento en herramienta educativa interactiva? | Tesis: el repo es educativo + funcional |

---

## Already Solved?

### R1 — Consejos de agentes LLM

**[llm-council](https://github.com/karpathy/llm-council)** (Karpathy, 23K ⭐). Sistema 3-etapas: (1) múltiples LLMs responden en paralelo, (2) cada LLM rankea las respuestas de los demás (anónimas), (3) un Chairman sintetiza la respuesta final. Usa OpenRouter con modelos comerciales (GPT, Gemini, Claude, Grok). Código: Python/FastAPI + React. No es mantenido ("vibe coded", "I don't intend to improve it").

**Chain-of-Agents (CoA)** (Zhang et al., 2024). Multi-agente secuencial para tareas de contexto largo. Worker agents procesan chunks en cadena pasando "communication units"; un manager sintetiza. Outperforma RAG y Full-Context en QA, summarization, code completion.

**AutoGen** (Microsoft), **MetaGPT**, **Camel**, **AgentVerse** — frameworks generales multi-agente, no especializados en modos de pensamiento.

**Veredicto:** ADAPT. llm-council es el referente más cercano, pero sus "agentes" son LLMs genéricos, no pensadores con perfiles cognitivos distintos. CoA aporta el patrón de comunicación secuencial con "communication units". **Ninguno estructura agentes por taxonomía de pensamiento.**

### R2 — Taxonomías de pensamiento documentadas

**Taxonomías académicas principales:**

| Taxonomía | Autor/Año | Dimensiones | Evidencia |
|-----------|-----------|-------------|-----------|
| Six Thinking Hats | De Bono (1985) | 6 modos (Blue, White, Red, Black, Yellow, Green) | Amplia adopción, crítica por falta de evidencia empírica (Moseley et al., 2005) |
| Bloom's Taxonomy (revisada) | Anderson & Krathwohl (2001) | 6 niveles: Remember, Understand, Apply, Analyze, Evaluate, Create | Gold standard educativo |
| System 1 / System 2 | Kahneman (2011) | Rápido/intuitivo vs. Lento/deliberativo | Premio Nobel, ampliamente validado |
| Frameworks for Thinking | Moseley et al. (2005) | 42 frameworks revisados, 3 recomendados | Handbook académico de Cambridge |
| Felder-Silverman | Felder & Silverman (1988) | 4 dimensiones bipolar (visual/verbal, active/reflective, sensing/intuitive, sequential/global) | Usado en ingeniería educativa |

**Proyecto más cercano: [fullo/thinking-habit-discovery](https://github.com/fullo/thinking-habit-discovery)** (2026). Modelo cognitivo de 5 dimensiones: D1 Canal Cognitivo (verbal, visual, somático, auditivo, abstracto), D2 Estrategia (adversarial, socrática, iterativa, narrativa, analógica...), D3 Dirección (divergente, convergente, lateral, sustractiva), D4 Medio (voz, escritura, diagramas, prototipos, código), D5 Forma Lógica (deductiva, inductiva, abductiva, analógica). 137 papers referenciados, cuestionario interactivo, plugin para Claude Code. **PERO: perfila humanos, no crea agentes.**

**[ArthurAI Learning Cognitive Profile](https://www.arthurgrid.ai/how-it-works/lcp/)** — 30 preguntas, 4 dimensiones Felder-Silverman. Perfila estudiantes para personalizar lecciones.

**Veredicto:** BUILD. La literatura de taxonomías es RICA — hay base académica sólida para poblar el repo. Pero **NADIE ha codificado estos modos de pensamiento como AGENTES.** El gap es precisamente lo que este proyecto propone: taxonomía → agentes → consejo.

### R3 — Formatos de especificación de agentes

**[Agent Manifest](https://github.com/agent-manifest/agent-manifest)** (Capucci, 2026). Especificación declarativa v1.0. Campos: identity, ownership, purpose, forbidden_actions, autonomy (0-3), risk_profile, stopping_authority, audit_surface, data_handling, contact. Extensible vía `x-` prefix o `extensions` object. Fuerte en boundary declaration, débil en perfil cognitivo.

**[Agent Card Spec](https://docs.astropods.ai/agent-card-spec)** (Astro AI, 2026). `AGENT.md` con YAML frontmatter. Campos: description, tags, authors, capabilities, integrations. Más orientado a discovery/documentación que a especificación funcional.

**Microsoft 365 Declarative Agent Manifest** — JSON schema, orientado a capacidades (WebSearch, OneDrive, GraphConnectors), muy específico de ecosistema.

**[AgentCard](https://github.com/kwailapt/AgentCard)** (kwailapt, 2026). Schema para A2A (agent-to-agent). Campos: agent_id (ULID), capabilities[], endpoint, pricing (en Joules). Incluye pricing termodinámico (Landauer floor). Interesante pero enfocado en interoperabilidad económica.

**Veredicto:** ADAPT. El `thinker.toml` propuesto con 6 capas canónicas (Identidad → Perfil cognitivo → Skills → Memoria → Contexto → Runtime) es MÁS RICO en dimensión cognitiva que cualquier formato existente. Los formatos existentes sirven para identidad/governance/boundaries pero no capturan la lente de pensamiento. Podemos aprender de Agent Manifest (extensibility, `x-` prefix) y Agent Card (YAML frontmatter pattern).

### R4 — Meta-cognición: agentes evaluando pensamiento

**[MetaCogAgent](https://arxiv.org/abs/2605.17292)** (Wang & Shu, 2025). Multi-agente con Unidad Metacognitiva: (1) self-assessment (confidence pre-ejecución), (2) adaptive delegation (si confianza baja, redirige), (3) capability boundary learning (cybernetic feedback). 82.4% accuracy, +8.7% sobre mejor baseline. **Directamente relevante: los agentes evalúan su propia competencia antes de actuar.**

**[CoNL](https://arxiv.org/abs/2601.21464)** (Sui & Hooi, 2026). Multi-agente self-play: critique quality se mide por si ayuda a otros a mejorar. Diagnostic reward tracking. **Validación directa de "pensadores evalúan pensadores".**

**[ReMA](https://arxiv.org/abs/2503.09501)** (Wan et al., 2025). Separa meta-thinking agent (high-level) de reasoning agent (low-level) con MARL. Single-turn y multi-turn.

**[CoRE-Eval](https://arxiv.org/abs/2507.06087)** (Li et al., 2025). Label-free self-evaluation vía trayectorias geométricas en latent space. Detecta "overthinking" cíclico y hace early-exit.

**Survey comprehensivo:** "Metacognition in LLMs: Foundations, Progress, and Opportunities" (Liu et al., Yale, 2026). Cubre monitoring, control, calibration, metamemory, faithful uncertainty communication.

**Veredicto:** ADAPT. El mecanismo de "pensadores evalúan pensadores" del proyecto tiene respaldo académico sólido. Técnicas para adaptar: diagnostic reward de CoNL, self-assessment de MetaCogAgent, confidence calibration. La novedad del proyecto es aplicar meta-cognición a la GOBERNANZA de la taxonomía misma.

### R5 — Agente compuesto / Compound AI Systems

**SÍ, el concepto existe.** "Compound AI Systems" (CAIS) fue acuñado por Berkeley AI Research (Zaharia et al., 2024). Survey comprehensivo: "From Standalone LLMs to Integrated Intelligence" (Chen et al., 2025). Arquitecturas blueprint para enterprise (Kandogan et al., 2024, 2025).

**Taxonomía CAIS:** RAG, LLM Agents, Multimodal LLMs, Orchestration.

**Chain-of-Agents (CoA):** worker agents secuenciales + manager agent.

**Veredicto:** BUILD (Repo B). El concepto de "compound AI systems" está establecido, validando que Repo B (runtime + laboratorio de composición) tiene fundamento teórico. Lo novedoso: componer específicamente **modos de pensamiento** (no herramientas genéricas). Esto va a Repo B como laboratorio de la hipótesis.

### R6 — Taxonomía de pensamiento como herramienta educativa interactiva

**[fullo/thinking-habit-discovery](https://github.com/fullo/thinking-habit-discovery)** es lo más cercano: cuestionario interactivo, radar de 5 dimensiones, perfil cognitivo, gap analysis, 137 papers, Claude Code plugin con 3 skills. Pero es para **perfilar humanos**, no para crear agentes ni activar consejos.

**[ArthurAI LCP](https://www.arthurgrid.ai/how-it-works/lcp/)** — perfil cognitivo para personalizar lecciones. Similar: mide dimensiones de pensamiento. Diferente: output es personalización de contenido, no agentes.

**IBL + LLM + Bloom** (Luo et al., 2026, AJET) — estudiantes usando LLMs para inquiry-based learning, analizado con Bloom's taxonomy. 14 patrones de interacción identificados. Muestra que los estudiantes SÍ usan LLMs para navegar niveles cognitivos, pero sin estructura explícita de taxonomía.

**Gap confirmado:** Nadie ha construido un repositorio donde (a) la taxonomía de pensamiento SEA el contenido educativo, (b) cada modo de pensamiento SEA un agente funcional, y (c) el usuario pueda tanto estudiar la taxonomía como activar un consejo de pensadores. Este gap es real.

---

## Applicable Theory

| Teoría / Hallazgo | Fuente | Implicación para el diseño |
|-------------------|--------|---------------------------|
| Dual-process theory (System 1/2) | Kahneman (2011) | Fundamento para pensadores "reactivo" vs "reflexivo" |
| Six Thinking Hats — secuencias de sombreros | De Bono (1985) | Preconfiguraciones de consejos con orden (ej. Blue→White→Green→Blue) |
| MetaCogAgent: self-assessment + delegation | Wang & Shu (2025) | Capa 1 (Perfil cognitivo) debe incluir autoconocimiento de limitaciones |
| CoNL: diagnostic reward por critique quality | Sui & Hooi (2026) | Mecanismo para "pensadores evalúan pensadores" en el gate de gobernanza |
| CoRE: detección de ciclos en latent space | Li et al. (2025) | Señal temprana de "overthinking" útil para el runtime (Repo B) |
| Moseley et al.: 42 frameworks, 3 recomendados | Moseley et al. (2005) | Fuente canónica para la taxonomía inicial de pensadores |
| Felder-Silverman: 4 dimensiones bipolares | Felder & Silverman (1988) | Modelo para dimensiones ortogonales de la taxonomía |
| Agent Manifest: `x-` prefix extensibility | Capucci (2026) | Patrón para extender thinker.toml sin breaking changes |
| CAIS = LLMs + componentes + diseño | Chen et al. (2025) | Marco conceptual para Repo B (runtime = componente, taxonomía = datos) |
| Lost-in-the-middle mitigado por CoA | Zhang et al. (2024) | Patrón de worker agents secuenciales aplicable al runtime |
| Bloom's Taxonomy aplicada a interacción LLM | Luo et al. (2026) | Validación de que los niveles cognitivos son útiles como framework de interacción |
| fullo: 5 dimensiones, 137 papers, gap analysis | fullo (2026) | La taxonomía más completa y actualizada para perfilar pensamiento — fuente directa para el catálogo de pensadores |

---

## Expectations (qué es "bueno" cuantitativamente)

| Métrica | Benchmark | Expectativa |
|---------|-----------|-------------|
| Diversidad de perspectivas | Mismo problema, N pensadores → salidas complementarias | ≥3 perspectivas mutuamente distinguibles (no paráfrasis) |
| Calibración metacognitiva | ECE (Expected Calibration Error) | <0.10 (MetaCogAgent logra 0.087) |
| Precisión de delegación | ¿El pensador correcto recibe la tarea correcta? | >0.80 (MetaCogAgent: 0.841) |
| Taxonomía inicial | Pensadores en el repo al MVP | ≥12 pensadores cubriendo ≥4 familias taxonómicas |
| Tasa de aceptación de contribuciones | PRs aceptados / PRs totales | ≥60% pasando los 3 filtros |
| Reducción de "overthinking" | Token length reduction | 15-35% (CoRE-Eval: 13.7-33.2%) |
| Mejora sobre single-LLM baseline | Accuracy en problemas complejos | +5-10% (MetaCogAgent: +8.7% sobre AutoGen) |

---

## Implications for the Spec

1. **La taxonomía inicial DEBE basarse en marcos académicos establecidos** (De Bono, Kahneman, Bloom, Felder-Silverman, fullo). No inventar modos de pensamiento; curarlos de la literatura.
2. **El thinker.toml de 6 capas es un formato novedoso** — ningún formato de agente existente captura perfil cognitivo. ADAPTAR patrones de extensibilidad de Agent Manifest (`x-` prefix, `extensions` object).
3. **El mecanismo "pensadores evalúan pensadores" tiene respaldo en CoNL y MetaCogAgent.** Diseñar el gate taxonómico (nivel 2) usando diagnostic reward: ¿la crítica de un pensador ayudó a mejorar al candidato?
4. **La hipótesis de agente compuesto NO es nueva** — "Compound AI Systems" es un campo establecido. Esto VALIDA moverla a Repo B y fortalece su justificación.
5. **fullo/thinking-habit-discovery es el proyecto más cercano** y debe ser citado como prior art. Su taxonomía de 5 dimensiones (D1-D5) es la más completa encontrada y puede servir de fuente para el catálogo inicial de pensadores.
6. **Las secuencias de De Bono** (Blue→White→Green→Blue, etc.) son un patrón directo para las preconfiguraciones (presets) de consejos que el usuario puede guardar.
7. **Incluir mdBook/Zola DESDE EL INICIO** — el render educativo es parte del repo, no un afterthought.
8. **El council de gobernanza debe implementarse como un ejercicio de meta-cognición**: los pensadores existentes evalúan candidatos usando el mismo protocolo que usarían para evaluar un problema.
9. **La calibración de confianza (ECE) debe ser una métrica de calidad del repo**, no solo del runtime. Cada pensador debería declarar su confianza esperada por dominio.
10. **Diseñar para la componibilidad desde el día 0**: la taxonomía debe ser un grafo, no un árbol. Las relaciones entre pensadores (complementario, antagónico, ortogonal, derivado) SON contenido educativo.

---

## Veredicto Final

**BUILD** — con elementos ADAPT de formatos de agente existentes y mecanismos de meta-cognición establecidos.

Este proyecto ocupa un gap genuino: **nadie ha codificado modos de pensamiento como agentes, organizado en taxonomía, donde el repositorio mismo es material educativo y los pensadores se gobiernan a sí mismos.** La literatura de taxonomías de pensamiento es rica (42 frameworks en Moseley et al., De Bono, Kahneman, fullo). La literatura de meta-cognición en LLMs es activa (MetaCogAgent, CoNL, ReMA). Los formatos de agente existen (Agent Manifest, Agent Card). Pero la intersección de estos tres — taxonomía + agentes + meta-cognición como gobernanza — no está ocupada.

El proyecto más cercano (fullo/thinking-habit-discovery) perfila humanos, no crea agentes. llm-council crea consejos pero sin perfiles cognitivos distintos. La combinación de ambos con gobernanza metacognitiva es la contribución novedosa.
