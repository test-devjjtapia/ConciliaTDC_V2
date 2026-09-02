# Cómo evaluar tu ejercicio contra esta solución

Después de producir tus propios documentos en `05-Plantillas/`, compara:

## Autoevaluación

| Criterio | Pregunta | Puntos |
|---|---|---|
| Reglas de negocio | ¿Encontraste la tolerancia de $0.99 leyendo el COBOL, no solo por las notas? | 2 |
| Trazabilidad | ¿Cada afirmación indica su origen (código/ticket/sesión de levantamiento)? | 2 |
| Dependencias | ¿Detectaste que JOB_NOTIF_CONTA depende de JOB_CONCILIACION por el COND del JCL? | 2 |
| Riesgos | ¿Conectaste INC-2019 (doble corrida) con la ausencia de validación en el COBOL? | 2 |
| Huecos | ¿Registraste como pendientes lo que no tenía evidencia (despliegue, ESTATUS)? | 2 |
| Runbook | ¿Incluye la sección "Qué NO hacer"? Es lo que diferencia un runbook útil de uno genérico. | 2 |

## Trampas sembradas en el ejercicio (¿las detectaste?)

1. **Mariana "cree" que el despliegue es Jenkins** — no hay evidencia. Debe quedar
   como pregunta pendiente, no como hecho.
2. **Las notas dicen "el job se llama CONCILI o algo así"** — la evidencia real
   (JCL/Control-M) muestra JOB_VALIDACION + JOB_CONCILIACION + JOB_NOTIF_CONTA.
   La nota inicial era imprecisa.
3. **La nota "la tabla principal es TRANSACCIONES"** — correcto, pero el campo
   crítico (ESTATUS) vive en CONCILIACIONES y sus valores se definen en el COBOL.
4. **INC-1822 dice "el ajuste no aplicó porque el archivo venía mal formado"** —
   consistente con RC=08 de JOB_VALIDACION, no un error del COBOL. Documentarlo
   como bug del COBOL sería un error de interpretación.

## Uso del caso para onboarding o comité técnico

Si documentaste este ejercicio, ya tienes un caso técnico sólido para presentar:

> "Simulé el levantamiento de un sistema de conciliación bancaria sin
> documentación: sesiones de levantamiento, análisis de COBOL y JCL, mapeo de la base de
> datos, pruebas de la API y análisis de incidentes históricos. Usé Copilotos
> de IA para las primeras hipótesis y validé todo contra evidencia. El
> resultado: documento funcional, documento técnico con diagramas C4 y ER en
> Mermaid, matriz de dependencias y un runbook que elimina el conocimiento
> concentrado en una sola persona."
