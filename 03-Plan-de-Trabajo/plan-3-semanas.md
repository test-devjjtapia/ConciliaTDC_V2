# Plan de trabajo: 3 semanas para documentar ConciliaTDC

> Este plan es una guía operativa de ejecución. Cada fase menciona herramientas tradicionales y dónde entra la IA.

---

## SEMANA 1 — Descubrimiento y levantamiento de conocimiento

**Objetivo:** entender QUÉ hace el sistema y QUIÉN sabe qué.

| Día | Actividad | Herramientas tradicionales | Apoyo de IA |
|---|---|---|---|
| 1 | Sesión de levantamiento con negocio (analistas de conciliación): ¿qué hace la app? ¿qué es una "diferencia"? ¿cuándo reprocesan? | Guía de preguntas (`guia-preguntas-levantamiento.md`), grabación/notas | Generar la guía de preguntas con Copiloto antes de la sesión |
| 2 | Sesión de levantamiento con Mariana (backend): API, BD, despliegue | Notas estructuradas por tema | Convertir notas crudas en resumen organizado (ver `04-Toolkit-IA/prompts-copilot.md` → P2) |
| 3 | Sesión de levantamiento con Ricardo (soporte): ¿qué haces cuando falla? | Plantilla de runbook vacía | — |
| 4 | Revisión de tickets históricos de Jira: patrones de fallo | Jira, Excel | Resumir y clasificar incidentes por componente (P4) |
| 5 | Primer mapa del sistema: actores, componentes, pendientes | draw.io / Mermaid | Generar borrador de diagrama de contexto C4 (P5) |

**Entregable de la semana:** mapa preliminar del sistema + lista de **preguntas pendientes** y **conocimiento concentrado en personas** (Ricardo = Single Point of Knowledge).

---

## SEMANA 2 — Investigación técnica directa

**Objetivo:** verificar contra la evidencia lo que dijeron las personas. *Las percepciones iniciales se vuelven sólidas cuando se contrastan con código, datos y operación.*

| Día | Actividad | Herramientas tradicionales | Apoyo de IA |
|---|---|---|---|
| 6 | Leer el COBOL `CONCILI1.cbl`: reglas de negocio reales | Editor, conocimiento COBOL | Explicar párrafos, extraer reglas y valores de ESTATUS (P1) |
| 7 | Leer el JCL y la definición de Control-M: cadena de jobs y dependencias | Control-M, conocimiento JCL | Generar diagrama de flujo de jobs en Mermaid (P5) |
| 8 | Mapear la base de datos: tablas, relaciones, campos críticos | DBeaver (diagrama ER), SQL | Documentar cada tabla y columna a partir del DDL (P1) |
| 9 | Probar la API: endpoints, requests, respuestas, errores | Postman, openapi.yaml | Generar borrador de documentación de endpoints (P1) |
| 10 | Seguir un incidente real: del log al componente | Logs, spool, Splunk | Correlacionar log ↔ ticket ↔ código (P4) |

**Entregable de la semana:** borradores técnicos validados contra evidencia + matriz de dependencias en construcción.

**Regla de oro de la semana:** todo lo que la IA sugiera se compara contra código, logs o tickets. Si no hay evidencia → va a "preguntas pendientes", no a la documentación.

---

## SEMANA 3 — Producción documental, validación y publicación

**Objetivo:** convertir borradores en documentación oficial.

| Día | Actividad | Herramientas tradicionales | Apoyo de IA |
|---|---|---|---|
| 11 | Redactar documento funcional | Plantilla `05-Plantillas/plantilla-documento-funcional.md`, Confluence | Estructurar contenido a partir de notas validadas (P3) |
| 12 | Redactar documento técnico + diagramas | Plantilla técnica, Mermaid en Git | Refinar diagramas C4/componentes |
| 13 | Redactar runbook del batch con Ricardo | Plantilla runbook | Convertir la sesión con Ricardo en pasos accionables (P3) |
| 14 | **Validación**: revisión de cada documento con su dueño técnico | Reuniones de revisión | Checklist de consistencia (¿toda API tiene dueño? ¿toda tabla documentada?) |
| 15 | Publicar en wiki oficial, control de versiones, sesión de transferencia | Confluence/Git, reunión de handoff | Índice y glosario |

**Entregable de la semana:** paquete documental oficial + sesión de transferencia de conocimiento.

---

## Entregables finales

1. Documento funcional (qué hace, reglas de negocio, usuarios, excepciones)
2. Documento técnico (arquitectura, componentes, tecnologías)
3. Documento de integraciones (API + batch + archivo a Contabilidad)
4. Diagramas: contexto (C4-1), contenedores (C4-2), flujo del batch, ER de la BD
5. Runbook operativo del batch (incluye RC=08 y doble corrida)
6. Matriz de dependencias y puntos críticos
7. Registro de preguntas pendientes y riesgos (lo que NO se pudo confirmar)
