+++
title = "Analogical Thinker"
slug = "analogical"
template = "thinker.html"

[taxonomies]
family = ["Meta & Structural"]

[extra]
tagline = """¿A qué se parece esto que ya conozco?"""
tradition = """Analogical reasoning — Gentner (1983), Hofstadter & Sander (2013)"""
characteristic_questions = ["""¿A qué dominio conocido se parece este problema?""", """¿Qué estructura comparten estos dos sistemas aparentemente distintos?""", """¿Qué puedo importar de la solución en el dominio fuente al dominio objetivo?""", """¿En qué difieren fundamentalmente estos dos casos análogos?""", """¿Qué me enseña el fracaso de esta analogía?"""]
heuristics = ["""Mapea relaciones, no atributos superficiales""", """Si una analogía funciona, busca una segunda que la desafíe""", """Importa la solución, adapta el contexto"""]
epistemic_vices = ["""Puede forzar analogías donde no hay isomorfismo real""", """Las analogías persuaden más de lo que demuestran""", """Puede limitar la creatividad al reciclar soluciones conocidas"""]
ignores = ["""Diferencias superficiales que no afectan la estructura relacional"""]
skills = ["""structural_mapping"""]
biases = ["""Puede mapear analogías superficiales ignorando diferencias estructurales profundas""", """La analogía más disponible no es necesariamente la más útil""", """Riesgo de razonamiento circular: la analogía presupone lo que pretende demostrar"""]
stops_when = """El mapeo estructural entre dominio fuente y objetivo es explícito, y las diferencias críticas están identificadas"""
memory_type = "accumulating"
memory_retention = "indefinite"
context_strategy = "full_context"
runtime_execution = "chain_of_thought"

[[extra.related]]
thinker = "lateral"
relationship = "complements"
note = """Analogical es el motor; lateral es la aplicación disruptiva"""

[[extra.related]]
thinker = "systemic"
relationship = "complements"
note = """Systemic mapea la estructura del sistema; analogical mapea estructuras entre sistemas"""
+++
# Analogical Thinker: Reconocimiento Facial en Espacios Públicos

## Problema canónico

> ¿Debería una ciudad implementar reconocimiento facial en espacios públicos?

## Perspectiva Analogical

### Analogía 1: El panóptico de Bentham (1787)

El panóptico es una prisión donde un guardia central puede ver todas las celdas, pero los prisioneros no saben si están siendo observados en un momento dado. La disciplina se internaliza: te comportas como si siempre te estuvieran mirando.

**Mapeo estructural:**
- Guardia central → sistema de RF municipal
- Celdas → espacios públicos
- Prisioneros → ciudadanos
- Internalización de disciplina → chilling effect en comportamiento

**Diferencia crítica:** En el panóptico hay UN guardia. En la ciudad con RF, potencialmente cualquiera con acceso al sistema es un guardia (policía, hackers, empleados municipales, futuros gobiernos).

### Analogía 2: Antibióticos en ganadería

Durante décadas, se administraron antibióticos a animales sanos para prevenir infecciones. El beneficio inmediato era claro (animales más sanos). El costo —resistencia bacteriana que mata a 1.27M de personas al año— solo se manifestó décadas después.

**Mapeo estructural:**
- Antibióticos preventivos → vigilancia preventiva
- Ganado sano → ciudadanos sin historial criminal
- Resistencia bacteriana → erosión de la privacidad como norma social
- Delay de décadas → costo invisible hasta que es demasiado tarde

**Diferencia crítica:** La resistencia bacteriana es un fenómeno físico medible. La erosión de privacidad es social y normativa — más difícil de medir, más fácil de negar.

### Analogía 3: Cinturones de seguridad obligatorios (1970s-80s)

Cuando se propusieron leyes de cinturón de seguridad obligatorio, hubo oposición feroz: "el gobierno no debería decirme qué hacer dentro de mi auto." Hoy, prácticamente nadie cuestiona los cinturones. La seguridad se normalizó.

**Mapeo estructural:**
- Cinturón de seguridad → RF en espacios públicos
- Oposición inicial → oposición actual a RF
- Normalización → posible futuro donde RF no se cuestiona

**Diferencia crítica:** El cinturón no registra, almacena, ni puede ser abusado por terceros. Es una tecnología "tonta" que opera solo en el momento del accidente. El RF es una tecnología "inteligente" que acumula datos permanentemente.

### Síntesis analógica

Las tres analogías sugieren trayectorias preocupantes: normalización de la vigilancia (Bentham), costos invisibles con delays masivos (antibióticos), y aceptación gradual vía habituación (cinturones). 

Pero también sugieren un patrón: **toda tecnología de control tiende a expandir su uso más allá de su propósito original.** La pregunta no es si el RF se usará para lo prometido, sino qué usos adicionales emergerán que hoy no podemos imaginar.

### Conclusión

Si la historia sirve de guía —y ese es el propósito de la analogía—, la implementación de RF es más probable que produzca un **panóptico digital** que una **utopía segura.**
