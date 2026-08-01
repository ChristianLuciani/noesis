# Brief: Taxonomy of Thinking Perspectives

> Estado: CONFIRMADO ✅ → pasando a sota-research

## Problem

**Quién:** Personas — estudiantes, implementadores, profesionales del conocimiento, docentes — que quieren liberarse de sus sesgos cognitivos (dados por personalidad, educación, cultura) y acceder a esquemas de pensamiento en los que no fueron entrenados.

**Por qué ahora:** La era LLM hace trivial y casi gratuito instanciar "pensadores" con lentes de razonamiento distintas. Antes requería expertos humanos escribiendo monografías; hoy una perspectiva se codifica y se ejercita en vivo. El recurso escaso ya no es acceder a modos de pensamiento — es saber cuáles existen, cómo se relacionan, y cuándo conviene cuál.

**Tesis del proyecto:** Los humanos tenemos *limitaciones de pensamiento*, no de inteligencia. Este repo es un gimnasio para expandirlas: desmantelar paradigmas limitantes y dejar florecer paradigmas expansivos.

**El cliché que lo motiva:** "Los profesores enseñan a pensar" — pero en la práctica solo enseñan contenidos y procesos; las formas de pensamiento se desarrollan de manera inferida y difusa. Este repo hace explícito lo que la educación tradicional mantiene implícito.

## Success Criteria

1. **La taxonomía demuestra su tesis:** un mismo problema, atacado por N pensadores distintos, produce salidas complementarias que un usuario reconoce como "no lo habría visto solo."
2. **El ecosistema crece con calidad:** contribuciones de pensadores que pasan los criterios de aceptación, manteniendo coherencia taxonómica.
3. **Mecanismos de auto-evaluación:** los propios pensadores y consejos generan evaluaciones de otros pensadores/consejos — meta-evaluación por pares agénticos.
4. **Se usa en flujos reales:** personas y agentes invocan presets/consejos en problemas concretos.

## Constraints (lo que no debe cambiar)

1. **Agnóstico de framework:** el repo es blueprint taxonómico, no implementación. Cualquier framework de agentes puede consumirlo. NUNCA acoplarse a un runtime específico.
2. **Frontera abstracto/utilitario borrada:** la taxonomía DEBE ser educativa por sí misma (leer = aprender) Y funcional (activable como consejo). Una no sacrifica a la otra.
3. **3 filtros de aceptación para nuevos pensadores:**
   - Es un *modo de pensamiento*, no un dominio de conocimiento.
   - Tiene tradición identificable y distinguible de otras (escuela, método, marco con literatura rastreable).
   - Es enseñable como habilidad transferible.
4. **Licencias abiertas + fuentes académicas verificables.**
5. **Máxima libertad para experimentar, usar y jugar.**

## Non-Goals

- No es un runtime de agentes (eso es el Repo B — laboratorio de hipótesis compuestas).
- No es un libro de texto tradicional (aunque incluye render vía mdBook/Zola).
- No resuelve "cuándo una combinación de pensadores es sinérgica vs. antagonista" — lo formula como agenda de investigación abierta (Repo B).
- No es un competidor de llm-council de Karpathy — es una capa más fundamental (taxonomía) que proyectos como ese podrían consumir.

## Open Risks

1. **Gobernanza filosófica — primer paso activado:** el consejo de pensadores del repo será el ente de gobernanza inicial para el nivel 3 del gate de aceptación. Los pensadores evalúan pensadores — ejercicio y simulación auto-referencial que demuestra el sistema en acción mientras sirve de prototipo para gobernanza futura. Riesgo residual: sigue siendo aspiracional en términos de autoridad final (¿quién tiene el voto definitivo si el consejo se divide?).
2. **Preguntas de investigación abiertas:** ¿cuándo un recurso cognitivo deja de aportar según la taxonomía? ¿cómo afecta la organización (jerárquica, red, plana) al resultado del consejo? ¿la democracia por votación produce la mejor decisión? Se delegan al Repo B como laboratorio.
3. **Naming no cerrado:** "Perspectivas de Pensamiento" / "Thought Perspectives" — se aceptan sugerencias.

---

## Estructura del repositorio (Repo A — Taxonomía)

```
/thinkers/
  systemic/
    thinker.toml       ← obligatorio: 6 capas canónicas
    EXAMPLES.md        ← obligatorio: mismo problema, distintas perspectivas
    SOURCES.md         ← obligatorio: tradición, autores, referencias
    paper.md           ← opcional: ensayo extenso
    /variants/         ← opcional: variantes culturales/históricas
/mdbook/               ← render navegable (mdBook o Zola)
```

### 6 capas canónicas del thinker.toml

| # | Capa | Definición | ¿Obligatoria? |
|---|---|---|---|
| 0 | **Identidad** | Nombre, tradición, voz epistémica, autoconocimiento de sus propios sesgos y limitaciones. Sin identidad no hay contingencia. | **Sí** |
| 1 | **Perfil cognitivo** | Heurísticas, preguntas características, vicios epistémicos reconocidos, supuestos fundacionales que definen la lente. | **Sí** |
| 2 | **Taxonomía de skills** | Catálogo de capacidades que esta forma de pensamiento requiere (ej. pensador estadístico → tools de cálculo; pensador sistémico → tools de mapeo causal). | **Sí** (puede ser vacío, pero debe declararse) |
| 3 | **Modelo de memoria** | Qué recuerda, por cuánto, con qué estructura (corto plazo = efímero; largo plazo = acumula; reflexivo = reindexa). | Recomendado |
| 4 | **Ingeniería de contexto** | Cómo construye, prioriza y poda su contexto (ventana, resúmenes, anclajes). | Opcional (hereda default) |
| 5 | **Runtime / execution** | Cómo se ejecuta: ¿llamada directa? ¿loop tool-use? ¿cadena de razonamiento multi-step? | Opcional (hereda default) |

Las capas son **expandibles** — si se descubre necesidad de una nueva capa, se añade.

### Gate de contribución (3 niveles)

| Nivel | Mecanismo | Qué evalúa |
|---|---|---|
| **Requisito (1)** | CI automatizado (lint) | `thinker.toml` completo, `EXAMPLES.md` existe, `SOURCES.md` tiene referencias reales |
| **Taxonómico (2)** | Revisión humana (mantenedores) | ¿Es distinguible de pensadores existentes? ¿Llena un vacío o es redundante? ¿Tiene tradición rastreable? |
| **Filosófico (3)** | Aspiracional — por definir | ¿Respeta la tesis del proyecto? ¿Es modo de pensamiento genuino o ideología disfrazada? |

---

## Ecosistema (dos repos + roadmap)

| Artefacto | Propósito |
|---|---|
| **Repo A — Taxonomía de Pensamiento** (este) | Blueprints agnósticos de pensadores puros. Unidad atómica = `thinker.toml` + docs + render mdBook. |
| **Repo B — Runtime + Laboratorio** | Consume A (symlink/stow). Da vida a los agentes, prueba la hipótesis de agentes compuestos, aloja las preguntas de investigación abiertas como experimentos. |
| **Roadmap externo** | Despliegues en plataformas agénticas públicas (POE.ai, etc.) como demostradores. |

---

## Transcripción completa

Ver más abajo.

---

## Transcript

### Raw request (2026-07-31, Christian)

Quiero crear un repo que sea la casa de agentes específicos diseñados para sistemas de
pensamiento. Lo llamaría algo así como "Perspectivas de Pensamiento" (thought perspectives).
Sería como pensadores que protagonizan tipos de pensamiento: pensador sistémico, pensador
estadístico, pensador científico, pensador de largo plazo, pensador de corto plazo, pensador
analítico, pensador crítico — o sea, como meta-pensadores. Donde estén todos los tipos de
pensamiento identificados a la fecha: pensamiento sistema 1 (reactivo), pensamiento sistema 2
(reflexivo), pensador de teoría de juegos, etc.

El repo estaría poblado por lo que podríamos llamar "taxonomías de pensamiento". No solo
serviría para activar un consejo de pensadores (como https://github.com/karpathy/llm-council),
sino que el solo hecho de estudiar cómo está estructurado el repositorio le daría al usuario una
amplitud de perspectivas para abordar un tema o problema. El repo debería ser educativo, no solo
funcional en el sentido de proveer agentes.

Ejemplo del problema que motiva: el cliché académico de que los profesores "enseñan a pensar a
sus estudiantes", pero en la práctica solo enseñan contenidos y procesos que de forma implícita
desarrollan formas de pensar, de manera inferida y difusa.

### Ronda 1 — borrador de preguntas (tier FAST, hub, agente-razonador via LiteLLM, $0)

Preguntas draft: 1) público objetivo 2) experiencia central 3) indicador de éxito 4) por qué ahora 5) restricción esencial.

#### Q1 — Público objetivo

**Recomendado:** público dual (educativo + funcional).

**Respuesta de Christian:** AMBOS, y ese es el punto: la frontera entre lo puramente abstracto y lo puramente utilitario se borra. El implementador se educa no solo ejecuta; el estudiante ve el pensamiento EN ACCIÓN y aprende más de la lectura de los agentes que de un concepto teórico; el profesor/profesional del conocimiento hace meta-reflexión con una herramienta. Es una herramienta para aprender realmente a pensar Y para ejercitar el pensamiento en problemas que le importan al usuario. **Insight clave: los agentes son material educativo — leer cómo piensa un pensador ES la pedagogía.**

#### Q2 — Experiencia central (navegar / invocar / escribir)

**Recomendado:** flujo en dos movimientos (estudiar la taxonomía + invocar consejo de pensadores) y un tercero emergente (contribuir nuevos modos de pensamiento).

**Respuesta de Christian:** (a) navegar/estudiar = DEFINITIVO. (b) invocar = sí, pero el USUARIO selecciona los participantes; en local puede crear sus propias preconfiguraciones (presets) y guardarlas para sus flujos de trabajo. (c) contribuir = absolutamente, el repo debe ser COLABORATIVO y CRECIENTE, pero con criterios MUY claros de las limitaciones filosóficas: qué se acepta y qué no, para mantener la filosofía y principios del repo. Esos principios AÚN NO ESTÁN DEFINIDOS — hay que definirlos como parte del proyecto.

**Nueva motivación profunda (tesis del proyecto):** los humanos estamos sujetos a sesgos cognitivos dados por personalidad, educación y cultura; nos cuesta acceder a esquemas de pensamiento en los que no fuimos entrenados. El repo ayuda a liberarnos de nuestras LIMITACIONES DE PENSAMIENTO, no de inteligencia. Por eso la palabra "perspectivas" (acepta sugerencias): ver algo desde ángulos distintos, escalas distintas, distancias distintas, horizontes temporales distintos, lentes distintas.

**El repo debe ser un ECOSISTEMA.**

**Uso personal de Christian:** (1) estudiar y ampliar sus propios horizontes, liberarse de sesgos; (2) tirar de agentes específicos para evaluar problemas concretos y crear consejos específicos para flujos de trabajo concretos en otras actividades que mantiene; (3) HIPÓTESIS: ser una capa para crear AGENTES COMPUESTOS más complejos para trabajadores digitales — principio de investigación NO desarrollada ni explorada; no sabe si el concepto de "agente compuesto" existe o alguien lo trabaja. → **Movido a Repo B (runtime + laboratorio).**

#### Q3 — Indicador de éxito

**Pregunta:** ¿Cómo se mide el éxito de un sistema de pensamiento? ¿Cuándo una combinación de pensadores es sinérgica vs. contraproducente?

**Respuesta de Christian:** Paradigma: "desmantela paradigmas limitantes para dejar florecer nuevos paradigmas expansivos." El repo incluirá mecanismos de AUTO-EVALUACIÓN generados por el propio repo: ejercitaremos los pensadores y consejos para que creen auto-evaluaciones o evaluaciones de otro consejo o pensador. Meta-evaluación: los pensadores evalúan pensamiento.

#### Q4 — Por qué ahora

**Recomendado:** (1) era LLM hace trivial instanciar pensadores; (2) ecosistema ZANAH/NEXOS como consumidor natural.

**Respuesta de Christian:** La motivación es (1). (2) es consecuencia.

#### Q5 — Restricción esencial — Filtros de aceptación

**Recomendado:** 3 filtros — (a) modo de pensamiento, no dominio; (b) tradición identificable; (c) enseñable.

**Respuesta de Christian:** Los 3 APROBADOS. Pero además: son AGENTES con runtime, skills, memoria e ingeniería de contexto coherentes con su taxonomía. Hay que fijar criterios de contribución por capa: ¿cuándo se mejora un prompt? ¿qué skills debe tener una taxonomía? ¿qué requisitos mínimos para proponer una nueva taxonomía?

### Ronda 2 — juicio y re-pregunta

#### Q2.1 — Capas canónicas del agente-pensador

**Pregunta:** ¿Cuáles son las capas que definen a un pensador? ¿Cuáles obligatorias, cuáles extensibles?

**Recomendado:** 5 capas — perfil cognitivo, taxonomía de skills, modelo de memoria, ingeniería de contexto, runtime/execution.

**Respuesta de Christian:** Acepta las 5 capas con flexibilidad de expansión. Plantea pregunta de investigación: ¿cuándo un recurso cognitivo deja de aportar según la taxonomía aplicada? (Ej. labs de IA maximizan todo — ¿qué pasa cuando añadir un ingrediente no aporta?) Esta pregunta ES en sí misma una contribución. **Posteriormente añade capa 0: Identidad** (sin identidad no hay contingencia).

#### Q2.2 — Organización de la taxonomía

**Pregunta:** ¿Jerárquica, plana, en red?

**Respuesta de Christian:** COMPONIBLE y CONFIGURABLE. Añade complejidad pero da infinitos grados de libertad para investigación. Se convierte en el "juego del pensamiento" — más orgánico que el ajedrez, permite investigar sobre organismos y organizaciones. ¿Un organigrama jerárquico cambia el abordaje? ¿El sesgo del líder domina? ¿La mesa redonda produce resultado o ruido?

#### Q2.3 — Entrega concreta + formato del blueprint

**Pregunta:** ¿Qué descarga un usuario? ¿CLI, paquete, MCP?

**Respuesta de Christian:** AGNÓSTICO DE FRAMEWORK. El repo es blueprint taxonómico, insumo puro. Otro layer/proyecto le da runtime. Máxima libertad para experimentar. **Acepta estructura propuesta:** `thinker.toml` + `EXAMPLES.md` + `SOURCES.md` + `paper.md` opcional + `/variants/`. Sugiere mdBook/Zola como render navegable (dentro del mismo repo). Sugiere Repo B (runtime de referencia) consumido vía symlink/stow para prueba/juego. Roadmap de deploys en plataformas agénticas (POE.ai, etc.).

#### Q2.4 — Gate filosófico (proceso de aceptación)

**Pregunta:** ¿Quién decide que un pensador entra, y bajo qué mecanismo?

**Recomendado:** 3 niveles — técnico (CI), taxonómico (mantenedores), filosófico (consejo/comunidad).

**Respuesta de Christian:** Nivel 1 (Requisito) — sí. Nivel 2 (Taxonómico) — activado. Nivel 3 (Filosófico) — ASPIRACIONAL. No tiene ni pertenece a ninguna organización; no es momento de definir la gobernanza.

### Ajustes finales del brief

- **Hipótesis de agente compuesto → Repo B.** El repo A produce pensadores puros; el laboratorio (Repo B) prueba hipótesis.
- **Capa 0: Identidad.** Añadida a las 6 capas canónicas.
- **Render mdBook/Zola dentro del repo A.** No es un artefacto separado.
