# Ejercicio Práctico: Documentación de un Sistema sin Documentación

> **Propósito:**
> Practicar el rol de **Analista Documentador Técnico-Funcional** sobre un sistema ficticio pero realista, con enfoque en levantamiento, análisis, documentación y continuidad operativa.

---

## El escenario

Acabas de entrar a **JJTapiaMX-Consulting**. Te asignan el sistema **ConciliaTDC**: una aplicación que concilia transacciones de tarjetas de crédito. Tiene una app móvil/web, una API REST, una base de datos relacional y un proceso batch nocturno en Mainframe.

**Problema:** el desarrollador original ya no está. No existe documentación. Solo tienes:
- Acceso al repositorio de código (`02-Sistema-ConciliaTDC/`)
- Notas sueltas de una sesión de levantamiento con un desarrollador (`01-Escenario/notas-levantamiento-dev.md`)
- Tickets históricos de incidentes (`01-Escenario/tickets-jira.md`)
- Un log de un fallo real (`01-Escenario/logs/batch-error.log`)

**Tu misión:** producir la documentación técnico-funcional del sistema en 3 semanas.

---

## Estructura del ejercicio

| Carpeta | Contenido |
|---|---|
| `01-Escenario/` | La evidencia dispersa con la que arrancas (notas, tickets, logs) |
| `02-Sistema-ConciliaTDC/` | El "sistema desconocido": COBOL, JCL, API, BD, scheduler |
| `03-Plan-de-Trabajo/` | Plan semana a semana, checklist de levantamiento y guía de sesiones técnicas |
| `04-Toolkit-IA/` | Prompts para Copilotos y diseño de agentes de IA especializados |
| `05-Plantillas/` | Plantillas vacías de todos los documentos a producir |
| `06-Solucion-Referencia/` | La documentación "resuelta" — compárala con tu resultado |

## Cómo trabajar el ejercicio

1. **Lee el escenario** (`01-Escenario/`) sin abrir todavía el código.
2. **Sigue el plan** (`03-Plan-de-Trabajo/plan-3-semanas.md`) fase por fase.
3. **Investiga el sistema** (`02-Sistema-ConciliaTDC/`) usando las técnicas del plan: leer código, seguir logs, mapear la BD, reconstruir la cadena de jobs.
4. **Usa el toolkit de IA** (`04-Toolkit-IA/`): aplica los prompts con tu Copiloto sobre los archivos reales del ejercicio.
5. **Llena las plantillas** (`05-Plantillas/`) con lo que descubras.
6. **Contrasta con la solución** (`06-Solucion-Referencia/`) y evalúa qué se te escapó.
7. **Prepara un resumen ejecutivo** de 1-2 minutos sobre el enfoque y los hallazgos.

---

## Resumen ejecutivo del enfoque (guion)

### Versión corta (~90 segundos)

> "Lo abordo en cuatro fases. **Primero, levantamiento de conocimiento**: trabajo con desarrollo, soporte, DBAs y usuarios con una guía de preguntas estructurada — funcional, técnica y operativa. **Segundo, investigación técnica directa**: reviso el repositorio, el esquema de la base de datos, los logs y la cadena de jobs para reconstruir el flujo real del sistema, porque la información inicial suele estar incompleta. **Tercero, estructuración**: convierto ese conocimiento disperso en documentos estándar — documento funcional, documento técnico, matriz de integraciones y dependencias, diagramas de procesos y arquitectura, y runbooks de soporte. **Cuarto, validación y transferencia**: reviso cada documento con los responsables técnicos antes de publicarlo en la wiki oficial.
>
> Uso herramientas tradicionales —Confluence o wiki, Jira, DBeaver, Postman, draw.io o Mermaid— y también **Copilotos de IA para acelerar**: me ayudan a generar la primera hipótesis al leer código legacy, a estructurar notas desordenadas de levantamiento y a producir borradores de diagramas. Pero la regla es clara: la IA propone, el analista valida, y el experto técnico aprueba. La documentación oficial siempre pasa por validación humana.
>
> Al final entrego algo más que documentos: un mapa de dependencias, puntos críticos y conocimiento que hoy está concentrado en personas — que es exactamente el riesgo que la empresa quiere eliminar."

### Versión extendida

Si te piden profundizar, usa el plan de `03-Plan-de-Trabajo/plan-3-semanas.md` como guion: describe la semana 1 (descubrimiento y personas), semana 2 (investigación técnica asistida por IA) y semana 3 (producción documental y validación), y cierra con los entregables concretos: qué documentos, en qué herramienta, con qué control de versiones.

### Principios que conectan con el objetivo del proyecto

Úsalos como criterios de éxito:
- *"Concentrar y mantener actualizado el conocimiento de las aplicaciones"*
- *"Identificar dependencias, puntos críticos y conocimiento concentrado en personas"*
- *"Asegurar la transferencia y permanencia del conocimiento"*
- *"Facilitar la continuidad de la operación"*
