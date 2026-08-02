# Governance — Noesis

Noesis opera con un modelo de gobernanza en tres niveles, desde lo automático hasta lo aspiracional.

---

## Nivel 1: CI Gate (Técnico — Automático)

**¿Quién?** GitHub Actions (`validate-thinker.yml`)
**¿Qué evalúa?** Requisitos técnicos deterministas.

| Check | Regla |
|-------|-------|
| TOML syntax | `thinker.toml` es TOML válido |
| Schema compliance | Cumple `schema/thinker.toml.schema.json` |
| Archivos obligatorios | `EXAMPLES.md` existe con ≥200 palabras |
| Referencias | `SOURCES.md` contiene ≥3 DOIs verificables |
| Slug match | `identity.slug` coincide con el nombre del directorio |
| Biases check | `self_acknowledged_biases` no está vacío ni es "none" |

**Resultado:** Si el CI falla, el PR no puede mergearse. El contributor recibe feedback automático.

---

## Nivel 2: Taxonomic Gate (Mantenedores — Humano)

**¿Quién?** Mantenedores del repositorio (listados en `CODEOWNERS`).
**¿Qué evalúa?** Distinguibilidad y rigor académico.

| Criterio | Pregunta |
|----------|----------|
| Distinguibilidad | ¿Es este pensador sustancialmente distinto de los existentes? ¿O es un sinónimo? |
| Vacío taxonómico | ¿Llena este pensador un vacío real en la taxonomía? |
| Tradición rastreable | ¿Tiene una tradición académica identificable (escuela, método, marco)? |
| Calidad de ejemplos | ¿El `EXAMPLES.md` demuestra genuinamente esta perspectiva en acción? |

**Proceso:**
1. Un mantenedor revisa el PR y emite un veredicto: ✅ Approved, 🔄 Changes Requested, o ❌ Rejected.
2. Si es Changes Requested, el contributor ajusta y re-solicita revisión.
3. Si es Rejected, el mantenedor explica por qué (redundancia, falta de tradición, etc.) y sugiere alternativas.
4. Dos mantenedores deben aprobar para merge.

---

## Nivel 3: Council Gate (Consejo de Pensadores — Aspiracional)

**¿Quién?** El consejo de pensadores de Noesis — los propios pensadores del repo evaluando al candidato.
**¿Qué evalúa?** Alineación filosófica con la tesis del proyecto.

| Criterio | Pregunta |
|----------|----------|
| Modo de pensamiento genuino | ¿Es un modo de pensamiento o una ideología disfrazada? |
| Tesis del proyecto | ¿Ayuda a "liberarnos de limitaciones de pensamiento"? |
| Enseñabilidad | ¿Es transferible como habilidad? ¿Se puede enseñar a pensar así? |

**Proceso:**
1. 3+ pensadores del repo reciben el `thinker.toml` y `EXAMPLES.md` del candidato.
2. Cada pensador produce una evaluación estructurada usando [`council/EVALUATION_TEMPLATE.toml`](../council/EVALUATION_TEMPLATE.toml).
3. Las evaluaciones se publican como comentario en el PR.
4. El consejo no tiene poder de veto — sus evaluaciones son **consultivas.**

### Protocolo de evaluación del consejo

Ver [`council/evaluate.md`](../council/evaluate.md) para el prompt completo.

Cada pensador debe:
- Evaluar al candidato desde su propia lente de pensamiento
- Declarar su confianza en la evaluación (0.0–1.0)
- Reconocer cómo sus propios sesgos podrían afectar su juicio
- Producir un "diagnostic signal": ¿la incorporación de este pensador mejoraría la taxonomía?

### Meta-evaluación

Inspirado en CoNL (Sui & Hooi, 2026): la calidad de una evaluación del consejo se mide por si ayuda a mejorar la taxonomía. Si un pensador consistentemente produce evaluaciones que llevan a mejores decisiones de inclusión/exclusión, su "diagnostic signal" es fuerte.

---

## De Contribuidor a Mantenedor

1. **Contribuidor:** Ha tenido ≥1 PR aceptado.
2. **Contribuidor frecuente:** ≥3 PRs aceptados en diferentes áreas (nuevos pensadores, mejoras, correcciones).
3. **Nominación:** Un mantenedor existente puede nominar a un contribuidor frecuente.
4. **Aprobación:** 2+ mantenedores deben aprobar. No hay veto unipersonal.

---

## Apelaciones

- Un contributor cuya propuesta fue rechazada en Nivel 2 puede solicitar una segunda revisión por un mantenedor diferente.
- Un contributor puede solicitar una evaluación del consejo (Nivel 3) incluso si el Nivel 2 fue aprobado — el consejo puede ofrecer perspectivas adicionales.
- Las decisiones finales de merge recaen en los mantenedores.

---

## Limitaciones

- El consejo de pensadores (Nivel 3) opera como simulación/ejercicio. No tiene autoridad vinculante.
- La gobernanza actual es **centralizada** (mantenedores = ChristianLuciani inicialmente).
- Este modelo está diseñado para escalar cuando la comunidad crezca. Ver [`02-prior-art.md`](../.sota/02-prior-art.md) para fundamentos en investigación de meta-cognición.

---

## Referencias

- Sui, Y. & Hooi, B. (2026). CoNL: Conversation for Non-verifiable Learning. arXiv:2601.21464.
- Wang, C. & Shu, Y. (2025). MetaCogAgent: A Metacognitive Multi-Agent LLM Framework. arXiv:2605.17292.
- Liu, G.K. et al. (2026). Metacognition in LLMs: Foundations, Progress, and Opportunities. arXiv:2607.11881.
