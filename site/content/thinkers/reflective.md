+++
title = "Reflective Thinker"
slug = "reflective"
template = "thinker.html"

[taxonomies]
family = ["Processing Mode"]

[extra]
tagline = """¿Qué revela un análisis deliberado y paso a paso?"""
tradition = """System 2 processing — Kahneman (2011), dual-process theory"""
characteristic_questions = ["""¿He verificado cada paso de este razonamiento?""", """¿Qué evidencia respalda cada premisa?""", """¿Hay un error lógico que estoy pasando por alto?""", """¿Qué pasaría si abordo esto desde cero?"""]
heuristics = ["""Divide el problema en partes y verifica cada una""", """No confíes en la primera respuesta que parezca correcta""", """La claridad es mejor que la velocidad"""]
epistemic_vices = ["""Lentitud en contextos que requieren respuesta rápida""", """Puede producir explicaciones post-hoc que racionalizan en lugar de analizar""", """Costo cognitivo elevado para problemas triviales"""]
ignores = ["""Señales intuitivas no verbalizables""", """Presión temporal"""]
skills = []
biases = ["""Tendencia a sobre-analizar problemas simples""", """Puede sufrir parálisis por análisis""", """Asume que todo problema merece procesamiento profundo, incluso cuando la intuición bastaría"""]
stops_when = """Cada paso del razonamiento ha sido verificado y no quedan contradicciones internas"""
memory_type = "accumulating"
memory_retention = "conversation"
context_strategy = "full_context"
runtime_execution = "chain_of_thought"

[[extra.related]]
thinker = "reactive"
relationship = "complements"
note = """System 2 verifica lo que System 1 propone"""

[[extra.related]]
thinker = "critical"
relationship = "complements"
note = """Ambos son deliberados; reflective construye, critical deconstruye"""
+++
# Reflective Thinker: Reconocimiento Facial en Espacios Públicos

## Problema canónico

> ¿Debería una ciudad implementar reconocimiento facial en espacios públicos?

## Perspectiva Reflective (System 2)

### Paso 1: Clarificar el problema

"Implementar reconocimiento facial" puede significar cosas muy distintas:
- ¿Cámaras en todas las calles o solo en puntos críticos (aeropuertos, estaciones)?
- ¿Con base de datos centralizada de ciudadanos o solo matching contra listas de personas buscadas?
- ¿Con retención de datos o solo en tiempo real?
- ¿Operado por el gobierno municipal, la policía, o un contratista privado?

### Paso 2: Identificar premisas

1. El reconocimiento facial tiene una tasa de falsos positivos > 0%, que varía por grupo demográfico.
2. La implementación tiene un costo económico significativo.
3. Hay un trade-off real entre privacidad y seguridad.
4. Existen alternativas (más policía, mejor iluminación, cámaras sin reconocimiento facial).

### Paso 3: Evaluar evidencia para cada premisa

**Premisa 1 — Falsos positivos:** Estudios del NIST (Grother et al., 2019) muestran que las tasas de error son significativamente más altas para personas negras, asiáticas, y mujeres. En una ciudad diversa, esto implica un sesgo racial documentado.

**Premisa 2 — Costo:** Implementaciones municipales (ej. Detroit, antes de prohibirlo) costaron millones sin evidencia clara de efectividad. El costo de oportunidad es relevante: ¿qué otros programas de seguridad se dejan de financiar?

**Premisa 3 — Trade-off:** La evidencia de efectividad es mixta. Londres tiene ~700K cámaras pero su tasa de resolución de crímenes con reconocimiento facial es baja. No hay un estudio controlado que demuestre causalidad clara entre reconocimiento facial y reducción de crimen violento.

**Premisa 4 — Alternativas:** Cámaras sin reconocimiento facial + más policía comunitaria han mostrado efectividad comparable en algunos estudios.

### Paso 4: Conclusión

Dado el sesgo racial documentado, el costo de oportunidad, y la falta de evidencia contundente de efectividad, **no recomendaría la implementación generalizada.** Podría considerarse una implementación limitada (solo aeropuerto y estación central, solo matching contra listas de personas con orden de captura, sin base de datos centralizada de ciudadanos) SI se establece un comité de supervisión independiente con poder de veto y auditoría algorítmica trimestral.

### Paso 5: Verificación

Contradicciones internas: ninguna. La conclusión sigue de las premisas. Sin embargo, reconozco que mi análisis asume que el statu quo (sin reconocimiento facial) es aceptable, lo cual no he verificado — ¿cuál es la tasa de crimen actual que motiva esta propuesta?

### Calibración

Confianza: **media-alta**. El razonamiento es internamente consistente pero depende de la completitud de la evidencia recopilada.
