# Statistical Thinker: Reconocimiento Facial en Espacios Públicos

## Problema canónico

> ¿Debería una ciudad implementar reconocimiento facial en espacios públicos?

## Perspectiva Statistical

### ¿Qué datos necesitaríamos?

Para decidir, necesito:

1. Tasa base de crimen violento en espacios públicos de la ciudad (crímenes/100K hab/año)
2. Tasa de resolución de crímenes con reconocimiento facial vs. sin él (estudios comparables)
3. Tasa de falsos positivos (FPR) y falsos negativos (FNR) del algoritmo en la demografía de la ciudad
4. Costo por crimen evitado
5. Costo por falso positivo (detención errónea, daño reputacional, litigio)

### El problema del valor predictivo positivo

Supongamos (generosamente, basado en estudios de Londres y Detroit):

- Tasa base de crimen en espacio público: 5 incidentes/100K personas/día
- Sensibilidad del algoritmo (TPR): 95%
- Especificidad (1 - FPR): 99.9% (optimista — el NIST reporta peor en demografías diversas)

En una ciudad de 1M de habitantes, ~50K personas pasan por espacios con cámaras al día.

**Criminales correctamente identificados:** 2.5 × 0.95 = 2.375 por día
**Falsos positivos:** 49,997.5 × 0.001 = ~50 personas inocentes señaladas por día

Por cada criminal identificado, **~21 personas inocentes son señaladas.**

### El problema de la disparidad demográfica

Si el FPR es 0.05% para hombres blancos y 0.2% para mujeres negras (consistente con estudios NIST), y la ciudad es 40% blanca, 30% negra, 20% hispana, 10% asiática:

- Falsos positivos en población negra: (15K × 0.002) = 30/día
- Falsos positivos en población blanca: (20K × 0.0005) = 10/día

**Una persona negra tiene 3x más probabilidad de ser falsamente señalada que una blanca**, incluso si cometen exactamente los mismos crímenes a la misma tasa.

### ¿Es el efecto estadísticamente significativo?

Con N = 50K/día:
- Diferencia observada: 30 vs 10
- χ² = significativo a p < 0.001

**Sí.** La disparidad no es ruido aleatorio.

### Tamaño del efecto en crímenes evitados

Los estudios más optimistas (Londres, após 5 años) sugieren una reducción de ~2% en crimen callejero. En una ciudad de 1M con 5 crímenes/100K/día, eso es 0.1 crímenes evitados por día. **36 crímenes evitados al año vs. ~18,250 falsos positivos.**

### Conclusión

El valor predictivo positivo es pésimo (~4.5%). La disparidad racial es estadísticamente significativa y grande. El número necesario a tratar (NNT) para evitar un crimen es astronómico comparado con el número necesario a dañar (NNH) con falsos positivos.

**Estadísticamente, la propuesta no se sostiene** a menos que:
- El FPR baje a <0.01% en TODAS las demografías
- O la tasa base de crimen sea órdenes de magnitud mayor

Confianza: **alta** en el razonamiento condicional, **media** en los parámetros estimados.
