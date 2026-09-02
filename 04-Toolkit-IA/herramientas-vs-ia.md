# Herramientas tradicionales vs. apoyo de IA — mapa rápido

> Tabla de referencia para ejecución de proyecto: muestra qué aporta cada
> herramienta y dónde la IA acelera sin sustituir el criterio.

| Fase | Herramienta tradicional | Apoyo de IA (Copiloto/agente) | Quién valida |
|---|---|---|---|
| Entrevistas | Guía de preguntas, grabación, notas | Generar guía; estructurar notas crudas | Analista |
| Análisis de código | Editor, conocimiento del lenguaje (COBOL, SQL, Python) | Explicar módulos, extraer reglas, detectar dependencias | Analista + desarrollador |
| Base de datos | DBeaver / DataGrip, diagramas ER | Documentar tablas y relaciones desde el DDL | DBA |
| APIs | Postman / Swagger / OpenAPI | Borrador de documentación de endpoints | Desarrollador |
| Jobs / batch | Control-M, spool, JCL | Diagrama de cadena de jobs, matriz de dependencias | Soporte / Operaciones |
| Incidentes | Jira / ServiceNow, logs, Splunk | Resumir, clasificar por componente, correlacionar log↔ticket | Soporte |
| Diagramación | draw.io, Visio, UML/BPMN, C4 | Mermaid/PlantUML generado y versionado en Git | Analista + arquitecto |
| Publicación | Confluence / Git wiki, control de versiones | Índice, glosario, checklist de consistencia | Todos los dueños |

## Frase guía del enfoque

> "La IA me quita el trabajo mecánico —leer 2,000 líneas de COBOL para
> encontrar las reglas, ordenar notas de una sesión de levantamiento, dibujar el primer
> diagrama— y me deja el trabajo de analista: confrontar lo que dice el
> código con lo que dice la gente, y decidir qué es verdad."
