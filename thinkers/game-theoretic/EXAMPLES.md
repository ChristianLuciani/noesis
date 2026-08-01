# Game-Theoretic Thinker: Reconocimiento Facial en Espacios Públicos

## Problema canónico

> ¿Debería una ciudad implementar reconocimiento facial en espacios públicos?

## Perspectiva Game-Theoretic

### Jugadores

1. **Gobierno municipal** — payoff: reducción de crimen + reelección; costo: presupuesto + oposición civil
2. **Ciudadanos** — payoff: seguridad + privacidad; estrategia: apoyar, oponerse, o adaptarse
3. **Criminales** — payoff: beneficio del crimen - probabilidad de captura × penalidad
4. **Empresa de vigilancia** — payoff: contrato - costo de implementación

### Juego sin reconocimiento facial (statu quo)

- Criminales: roban si beneficio > riesgo de captura × penalidad
- Ciudadanos: aceptan nivel actual de inseguridad
- Gobierno: invierte en policía tradicional

**Equilibrio:** Tasa de crimen donde el criminal marginal es indiferente entre delinquir y no hacerlo.

### Juego con reconocimiento facial

Si se implementa RF:
- Probabilidad de captura ↑ para criminales en espacios públicos
- Criminales se adaptan: se mueven a espacios privados, usan máscaras, o cambian de modus
- **Efecto de sustitución, no de reducción** (a menos que el crimen total baje)

### ¿Es un problema de compromiso?

El gobierno promete: "Solo usaremos RF para crímenes violentos."

Pero una vez instalada la infraestructura, el costo marginal de usarla para otros fines es ~cero. El criminal ya invirtió en las cámaras. Los ciudadanos anticipan esto → desconfianza.

**Problema de inconsistencia temporal:** el gobierno no puede comprometerse creíblemente a limitar el uso futuro. En el equilibrio de Nash perfecto en subjuegos, los ciudadanos anticipan misión creep y se oponen.

### Mecanismo de compromiso creíble

Para que el juego funcione, el gobierno necesita un commitment device:
- Ley que PROHÍBA explícitamente usos secundarios con penalidades automáticas
- Comité de supervisión con miembros de la oposición y sociedad civil
- Cláusula de caducidad: el sistema se apaga automáticamente cada 2 años y requiere re-aprobación

Sin estos, la promesa de uso limitado no es creíble → el equilibrio es oposición ciudadana.

### Conclusión estratégica

El juego no es sobre "seguridad vs. privacidad" sino sobre **credibilidad del compromiso.** La tecnología no es el problema; la estructura de incentivos del gobierno que la opera sí lo es. Si el gobierno puede resolver el problema de compromiso (mecanismo creíble), la implementación puede ser Pareto-superior. Si no, el statu quo es el equilibrio estable.
