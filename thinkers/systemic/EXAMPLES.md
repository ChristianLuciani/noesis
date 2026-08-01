# Systemic Thinker: Reconocimiento Facial en Espacios Públicos

## Problema canónico

> ¿Debería una ciudad implementar reconocimiento facial en espacios públicos?

## Perspectiva Systemic

### El sistema

No es "cámaras sí o no". Es un sistema con:

**Stocks:**
- Cantidad de cámaras desplegadas
- Volumen de datos biométricos almacenados
- Nivel de confianza pública en el gobierno
- Tasa de criminalidad

**Flows:**
- Instalación de cámaras → ↑ cobertura → ↓ crimen (esperado) → ↑ confianza → ↑ demanda de más cámaras (loop de refuerzo R1)
- ↑ cámaras → ↑ falsos positivos → ↑ arrestos erróneos → ↓ confianza → ↓ apoyo a cámaras (loop de balance B1)
- ↑ datos biométricos → ↑ riesgo de brecha de seguridad → ↑ costo de ciberseguridad (loop de balance B2)

**Delays críticos:**
- El efecto en crimen tarda meses/años en manifestarse
- La erosión de confianza puede ser lenta... hasta que un incidente la desploma abruptamente
- El costo de revertir (desinstalar, borrar datos) es alto y tiene su propio delay

### Puntos de palanca (de mayor a menor efectividad)

1. **Transparencia + accountability** (más efectivo): Un comité independiente con poder de veto y datos públicos de efectividad transforma la dinámica de confianza.
2. **Reglas de retención de datos** (menos efectivo, más fácil): Limitar el almacenamiento a 24h reduce el riesgo de brecha masiva.
3. **Umbral de matching** (efecto medio): Ajustar la sensibilidad del algoritmo cambia el trade-off falsos positivos vs. falsos negativos.

### Consecuencias no intencionadas

- **Efecto de desplazamiento:** El crimen se mueve a zonas sin cámaras en lugar de reducirse.
- **Chilling effect:** Las personas modifican su comportamiento (evitan protestas, reuniones) aunque no tengan nada que ocultar.
- **Misión creep:** Hoy es para "personas con orden de captura", mañana para "deudores de impuestos".
- **Normalización:** Una generación crece con vigilancia y la percibe como normal, reduciendo la demanda de privacidad en el futuro (shift en el stock de "expectativas de privacidad").

### Conclusión sistémica

El sistema tiene un loop de refuerzo peligroso (más cámaras → más datos → más justificación para más cámaras) y un loop de balance débil (los falsos positivos afectan desproporcionadamente a minorías que ya tienen menos poder político para activar el balance).

**Recomendación:** Si se implementa, debe ser con un loop de balance fuerte y rápido: supervisión independiente con poder de veto, auditoría algorítmica pública, y cláusula de caducidad que requiera re-aprobación cada 2 años. Sin estos contrapesos, el sistema tenderá a expandirse independientemente de su efectividad real.
