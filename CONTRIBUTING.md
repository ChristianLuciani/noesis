# Contributing to Noesis

Noesis crece con contribuciones de la comunidad. Cada nuevo pensador expande la taxonomía y enriquece las perspectivas disponibles para todos.

## Los 3 Gates de Aceptación

Cada contribución pasa por tres niveles de revisión:

### Gate 1: Técnico (CI — Automático)

Tu PR debe pasar la validación automática:

- [ ] `thinker.toml` existe y es TOML válido
- [ ] `thinker.toml` cumple el [JSON Schema](schema/thinker.toml.schema.json)
- [ ] `EXAMPLES.md` existe y tiene ≥200 palabras
- [ ] `SOURCES.md` existe y contiene ≥3 referencias con DOI verificable

Si el CI falla, lee los logs del workflow `validate-thinker.yml`.

### Gate 2: Taxonómico (Mantenedores)

Un mantenedor humano evalúa:

- ¿Es **distinguible** de pensadores existentes? (no es un sinónimo)
- ¿Llena un **vacío** real en la taxonomía?
- ¿Tiene **tradición académica rastreable**? (escuela, método, marco con literatura)

Si el pensador es demasiado similar a uno existente, el mantenedor sugerirá fusión o diferenciación.

### Gate 3: Filosófico (Consejo de Pensadores — Aspiracional)

El consejo de pensadores de Noesis evalúa:

- ¿Es un **modo de pensamiento genuino** (no una ideología disfrazada)?
- ¿Respeta la **tesis del proyecto**: liberar limitaciones de pensamiento?
- ¿Es **enseñable** como habilidad transferible?

Este gate es **aspiracional** — opera como simulación/ejercicio. La decisión final la tienen los mantenedores. Ver [`GOVERNANCE.md`](GOVERNANCE.md).

---

## Cómo Contribuir un Nuevo Pensador

### 1. Verifica que no exista

Revisa [`TAXONOMY.md`](TAXONOMY.md) y el [sitio web](https://christianluciani.github.io/noesis). Busca pensadores en la misma familia o con estrategias similares.

### 2. Crea el directorio

```bash
mkdir -p thinkers/<tu-slug>
```

Usa un slug descriptivo en inglés (ej. `critical`, `divergent`, `long-term`).

### 3. Escribe los archivos obligatorios

#### `thinker.toml`

Completa las 6 capas canónicas. Usa el [schema](schema/thinker.toml.schema.json) como referencia y [`SPEC.md`](schema/SPEC.md) para la documentación de cada campo.

Las 6 capas:
0. **identity** — nombre, tradición, autoconocimiento de sesgos
1. **cognitive_profile** — heurísticas, preguntas características, vicios epistémicos
2. **skills** — catálogo de capacidades requeridas
3. **memory** — qué recuerda, por cuánto, con qué estructura
4. **context** — cómo construye, prioriza y poda su contexto
5. **runtime** — cómo se ejecuta

#### `EXAMPLES.md`

Resuelve el **problema canónico** desde la perspectiva de este pensador:

> *"¿Debería una ciudad implementar reconocimiento facial en espacios públicos?"*

Muestra cómo este modo de pensamiento aborda el problema: qué pregunta primero, qué considera relevante, qué ignora deliberadamente, a qué conclusión llega.

#### `SOURCES.md`

Lista ≥3 referencias académicas con:

- Autor(es), año, título
- DOI verificable (formato: `https://doi.org/10.xxxx/...`)
- Breve descripción de relevancia para este pensador (1-2 líneas)

### 4. Abre el PR

```bash
git add thinkers/<tu-slug>/
git commit -m "thinker: add <nombre-del-pensador>"
gh pr create --title "thinker: add <nombre-del-pensador>" --body "## Descripción ..."
```

### 5. Responde al feedback

El CI corre automáticamente. Un mantenedor revisará dentro de ~1 semana. Responde a comentarios y ajusta si es necesario.

---

## Mejorar un Pensador Existente

Las contribuciones no son solo nuevos pensadores. Puedes:

- **Mejorar `thinker.toml`**: refinar el perfil cognitivo, añadir sesgos reconocidos, mejorar preguntas características
- **Ampliar `EXAMPLES.md`**: añadir más problemas resueltos desde esta perspectiva
- **Corregir/actualizar `SOURCES.md`**: añadir referencias más recientes, corregir DOIs
- **Escribir `paper.md`**: un ensayo extenso sobre este modo de pensamiento

Sigue el mismo proceso de PR.

---

## No aceptamos

- **Dominios de conocimiento** disfrazados de modos de pensamiento (ej. "Experto en React" no es un modo de pensar)
- **Ideologías** presentadas como herramientas cognitivas neutrales
- **Duplicados** de pensadores existentes con otro nombre
- **Contenido sin fuentes** académicas verificables

---

## De Contribuidor a Mantenedor

Los contribuidores con ≥3 PRs aceptados pueden ser nominados como mantenedores. Ver [`GOVERNANCE.md`](GOVERNANCE.md) para el proceso completo.
