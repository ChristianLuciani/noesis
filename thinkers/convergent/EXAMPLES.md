# Convergent Thinker: Reconocimiento Facial en Espacios Públicos

## Problema canónico

> ¿Debería una ciudad implementar reconocimiento facial en espacios públicos?

## Perspectiva Convergent

### Criterios de evaluación

1. **Efectividad en reducción de crimen violento** (peso: 35%)
2. **Costo total de implementación a 5 años** (peso: 25%)
3. **Tasa de falsos positivos × disparidad demográfica** (peso: 20%)
4. **Aceptabilidad pública** (peso: 15%)
5. **Velocidad de implementación** (peso: 5%)

### Opciones a evaluar

A. Reconocimiento facial generalizado (propuesta original)
B. Cámaras sin reconocimiento facial + policía comunitaria (alternativa 3+7 del divergent)
C. Zonas mixtas: reconocimiento facial en aeropuerto y estaciones; anonimato en plazas y parques (alternativa 10)

### Matriz de decisión

| Criterio (peso) | Opción A | Opción B | Opción C |
|-----------------|----------|----------|----------|
| Efectividad (35%) | 6/10 | 5/10 | 7/10 |
| Costo 5 años (25%) | 3/10 | 8/10 | 6/10 |
| Sesgo algorítmico (20%) | 3/10 | 10/10 | 7/10 |
| Aceptabilidad (15%) | 3/10 | 7/10 | 6/10 |
| Velocidad (5%) | 8/10 | 4/10 | 5/10 |

**Puntajes ponderados:**
- A: 6×0.35 + 3×0.25 + 3×0.20 + 3×0.15 + 8×0.05 = 2.10 + 0.75 + 0.60 + 0.45 + 0.40 = **4.30**
- B: 5×0.35 + 8×0.25 + 10×0.20 + 7×0.15 + 4×0.05 = 1.75 + 2.00 + 2.00 + 1.05 + 0.20 = **7.00**
- C: 7×0.35 + 6×0.25 + 7×0.20 + 6×0.15 + 5×0.05 = 2.45 + 1.50 + 1.40 + 0.90 + 0.25 = **6.50**

### Análisis de sensibilidad

Si subo efectividad al 50%: A = 4.75, B = 6.75, C = 6.75 → B y C empatan.
Si elimino sesgo algorítmico como criterio: A = 3.70, B = 5.00, C = 5.40 → C lidera.

### Conclusión

**Opción B** (cámaras sin reconocimiento facial + policía comunitaria) es la mejor bajo estos criterios. **Opción C** (zonas mixtas) es una alternativa robusta si la efectividad pesa más.

La propuesta original (A) es dominada por B en todos los escenarios excepto velocidad de implementación.

### Calibración

Confianza: **media**. Los puntajes son estimaciones subjetivas. Un cambio en los pesos o en las estimaciones de efectividad podría alterar el resultado. La debilidad principal: la efectividad real de B vs. A no está establecida empíricamente.
