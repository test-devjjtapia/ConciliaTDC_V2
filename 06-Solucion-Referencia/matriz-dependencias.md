# Matriz de dependencias y puntos críticos — ConciliaTDC

## Dependencias del sistema

| Componente | Depende de | Tipo | ¿Qué pasa si falla? | Evidencia |
|---|---|---|---|---|
| App | API + token | Sync | Pantalla en blanco (INC-1987) | Tickets, openapi.yaml |
| API | DB2 | Sync | Sin consultas | openapi.yaml, schema.sql |
| JOB_CONCILIACION | JOB_VALIDACION | Batch | Cadena detenida | control-m-jobs.json |
| JOB_CONCILIACION | Archivo del procesador | Batch (archivo) | RC=08, sin datos al día siguiente | INC-2041, log |
| JOB_NOTIF_CONTA | JOB_CONCILIACION | Batch | Contabilidad sin archivo | JCL (COND), control-m-jobs.json |
| Conciliación (COBOL) | DB2 TRANSACCIONES | Batch (SQL) | No hay comparación posible | CONCILI1.cbl |

## Puntos críticos

| Punto crítico | Por qué es crítico | Ventana | Responsable |
|---|---|---|---|
| Recepción del archivo del procesador | Sin archivo no hay conciliación del día | Antes de 01:30 | Procesador / Soporte |
| Cadena batch completa | Analistas trabajan a las 07:00 | 01:30–07:00 | Operaciones |
| Tolerancia $0.99 | Regla de negocio embebida en COBOL | Permanente | Negocio + Desarrollo |
| Doble corrida del batch | Duplica movimientos financieros | Cualquier re-lanzamiento | Soporte |

## Conocimiento concentrado en personas

| Conocimiento | Persona | Riesgo si no está | ¿Ya documentado? |
|---|---|---|---|
| Qué hacer cuando falla el batch | Ricardo | Alto — cadena detenida sin atención | ✓ Runbook RB-01 |
| API y base de datos | Mariana | Medio | ✓ Documento técnico |
| Significado de diferencias y cuándo reprocesar | Analistas de conciliación | Medio | ✓ Documento funcional |

## Preguntas pendientes consolidadas

| # | Pregunta | Bloquea | Dueño | Estado |
|---|---|---|---|---|
| 1 | ¿Cómo se despliega la API? ¿Jenkins? | Doc. técnico §7 | Mariana / DevOps | Pendiente |
| 2 | ¿Valores históricos de CONCILIACIONES.ESTATUS además de los 3 del COBOL? | Doc. técnico §4 | Mariana / DBA | Pendiente |
| 3 | ¿Se automatizará la validación de doble corrida? | Riesgos §8 | Desarrollo | Pendiente |
| 4 | ¿La tolerancia $0.99 es regla vigente firmada por negocio? | Doc. funcional RN-01 | Negocio | Pendiente |
