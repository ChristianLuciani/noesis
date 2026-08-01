# TAXONOMY.md — Noesis Thinking Perspectives

Catálogo completo de familias y pensadores en la taxonomía Noesis. Este documento es la fuente canónica de la taxonomía. El sitio Zola y la estructura `/thinkers/` se derivan de él.

---

## Organización

La taxonomía Noesis organiza modos de pensamiento en **familias** que agrupan pensadores por afinidad funcional. Un pensador puede pertenecer a múltiples familias.

Las **relaciones** entre pensadores enriquecen la taxonomía:
- **complements**: dos perspectivas que juntas cubren más que cada una por separado
- **contrasts_with**: perspectivas en tensión productiva
- **derives_from**: genealogía intelectual

---

## Familias

### 1. Processing Mode

Cómo el pensamiento se inicia y procesa — el eje rápido/lento de Kahneman.

**Fuentes canónicas:** Kahneman (2011) *Thinking, Fast and Slow*; Stanovich & West (2000) individual differences in reasoning.

### 2. Reasoning Direction

Hacia dónde se mueve el pensamiento — el eje divergente/convergente/lateral.

**Fuentes canónicas:** Guilford (1956) *Structure of Intellect*; De Bono (1967) *Lateral Thinking*; De Bono (1985) *Six Thinking Hats*.

### 3. Analytical Lenses

Lentes disciplinadas para analizar problemas — tradiciones académicas consolidadas.

**Fuentes canónicas:** Bertalanffy (1968) *General System Theory*; Meadows (2008) *Thinking in Systems*; Popper (1959) *Logic of Scientific Discovery*; Paul & Elder (2001) *Critical Thinking*; von Neumann & Morgenstern (1944) *Theory of Games*.

### 4. Temporal Orientation

Horizonte temporal del pensamiento — el eje corto/largo plazo.

**Fuentes canónicas:** Bostrom (2014) *Superintelligence*; MacAskill (2022) *What We Owe the Future*; constraints-based decision theory.

### 5. Meta & Structural

Pensar sobre pensar — modos que operan sobre otros modos.

**Fuentes canónicas:** Flavell (1979) metacognition and cognitive monitoring; Gentner (1983) structure-mapping; Hofstadter & Sander (2013) *Surfaces and Essences*.

---

## Catálogo de Pensadores

| Slug | Display Name | Familia(s) | Tradición | Qué pregunta |
|------|-------------|-----------|-----------|-------------|
| `reactive` | Reactive Thinker | Processing Mode | Kahneman System 1 | "¿Qué me dice mi intuición inmediata?" |
| `reflective` | Reflective Thinker | Processing Mode | Kahneman System 2 | "¿Qué revela un análisis deliberado?" |
| `divergent` | Divergent Thinker | Reasoning Direction | Guilford, De Bono | "¿Cuántas posibilidades distintas puedo generar?" |
| `convergent` | Convergent Thinker | Reasoning Direction | Guilford, De Bono | "¿Cuál es la mejor respuesta dadas las restricciones?" |
| `lateral` | Lateral Thinker | Reasoning Direction | De Bono | "¿Desde qué ángulo inesperado puedo abordar esto?" |
| `systemic` | Systemic Thinker | Analytical Lenses | Bertalanffy, Meadows, Senge | "¿Cómo se relacionan las partes con el todo?" |
| `statistical` | Statistical Thinker | Analytical Lenses | Fisher, Neyman-Pearson, Bayesian | "¿Qué dicen los datos y cuánta incertidumbre hay?" |
| `scientific` | Scientific Thinker | Analytical Lenses | Popper, Kuhn | "¿Es esta hipótesis falsable y qué evidencia la refutaría?" |
| `critical` | Critical Thinker | Analytical Lenses | Socrates, Dewey, Paul-Elder | "¿Qué supuestos ocultos sostienen este argumento?" |
| `game-theoretic` | Game-Theoretic Thinker | Analytical Lenses | von Neumann, Nash, Schelling | "¿Qué estrategia emerge cuando múltiples agentes optimizan?" |
| `long-term` | Long-Term Thinker | Temporal Orientation | Bostrom, MacAskill | "¿Qué efectos de segundo y tercer orden se despliegan en el tiempo?" |
| `short-term` | Short-Term Thinker | Temporal Orientation | Constraints-based, agile | "¿Qué es lo más urgente y accionable ahora?" |
| `metacognitive` | Metacognitive Thinker | Meta & Structural | Flavell | "¿Cómo está pensando esto y qué sesgos me afectan?" |
| `analogical` | Analogical Thinker | Meta & Structural | Gentner, Hofstadter | "¿A qué se parece esto que ya conozco?" |

---

## Relaciones

```
complements:
  reactive ↔ reflective          (intuición + deliberación)
  divergent ↔ convergent         (generar opciones + seleccionar)
  systemic ↔ statistical         (estructura + datos)
  long-term ↔ short-term         (visión + acción)
  critical ↔ scientific          (cuestionar supuestos + evidencia empírica)
  metacognitive ↔ any            (awareness aplicable a cualquier modo)

contrasts_with:
  reactive ↔ scientific          (intuición inmediata vs. método sistemático)
  lateral ↔ convergent           (disrupción vs. optimización)
  divergent ↔ statistical        (amplitud vs. precisión)
  short-term ↔ long-term         (urgencia vs. paciencia)

derives_from:
  metacognitive ← Flavell (1979) cognitive monitoring theory
  systemic ← Bertalanffy (1968) general system theory
  lateral ← De Bono (1967) lateral thinking
  analogical ← Gentner (1983) structure-mapping theory
```
