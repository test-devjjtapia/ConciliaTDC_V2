# Prompts para Copilotos de IA — listos para usar

> Filosofía: **la IA genera la primera hipótesis; el analista valida contra
> evidencia; el experto aprueba.** Ningún texto generado por IA va directo
> a la documentación oficial.

---

## P0 — Preparar una sesión de levantamiento

```
Voy a realizar una sesión de levantamiento con el responsable de soporte de un sistema de conciliación
bancaria compuesto por: app móvil, API REST (Flask), base de datos DB2 y
proceso batch nocturno en Mainframe (COBOL/JCL con Control-M).
Genera una guía de preguntas estructurada en tres bloques: funcional,
técnico y operativo. Prioriza preguntas que revelen conocimiento no
documentado y dependencias entre componentes.
```

## P1 — Analizar código / DDL / especificación

```
Adjunto el programa COBOL CONCILI1.cbl. Actúa como analista técnico:
1) Resume qué hace el programa en 3 líneas de lenguaje de negocio.
2) Extrae TODAS las reglas de negocio (umbrales, condiciones, estatus).
3) Lista entradas, salidas y tablas de base de datos que toca.
4) Identifica riesgos operativos (¿qué pasa si el archivo falta?
   ¿si corre dos veces?).
Marca con [HIPÓTESIS] todo lo que no esté explícito en el código.
```

> Pruébalo en el ejercicio con: `02-Sistema-ConciliaTDC/batch/CONCILI1.cbl`,
> luego con `db/schema.sql` y `api/openapi.yaml`.

## P2 — Estructurar notas de levantamiento desordenadas

```
Estas son notas crudas de una sesión de levantamiento con un desarrollador.
Organízalas en: 1) descripción funcional, 2) componentes técnicos,
3) dependencias e integraciones, 4) riesgos mencionados,
5) preguntas pendientes. NO agregues información que no esté en las notas.
Si algo es ambiguo o contradictorio, márcalo como [VERIFICAR].
```

> Pruébalo con: `01-Escenario/notas-levantamiento-dev.md` y compara el resultado
> contra la evidencia del sistema.

## P3 — Convertir una sesión de soporte en runbook

```
Con base en estos tickets de incidentes y estas notas de soporte, genera un
borrador de runbook con el formato: Síntoma / Componentes involucrados /
Validaciones paso a paso / Resolución / Escalamiento / Qué NO hacer.
Usa solo la información proporcionada; marca los huecos como [PENDIENTE].
```

> Pruébalo con: `01-Escenario/tickets-jira.md` + `01-Escenario/logs/batch-error.log`.

## P4 — Analizar incidentes y correlacionar evidencia

```
Te doy un log de error de un job Mainframe y un ticket de incidente.
1) Explica la cadena de causa: qué falló, por qué, qué componentes afectó.
2) Relaciona el log con el ticket (¿mismo incidente? ¿mismo patrón?).
3) Propone qué secciones del runbook cubre este incidente.
```

## P5 — Generar diagramas como código

```
Con esta descripción del sistema [pegar resumen validado], genera:
1) Un diagrama de contexto C4 nivel 1 en Mermaid.
2) Un diagrama de secuencia del proceso batch nocturno en Mermaid.
3) Un flujo BPMN simplificado del proceso de conciliación.
Usa nombres de componentes exactamente como aparecen en la descripción.
```

> La ventaja de Mermaid/PlantUML: los diagramas viven en Git junto a la
> documentación y se actualizan con control de versiones.

## P6 — Detectar huecos documentales (consistency check)

```
Te doy mi documentación preliminar [pegar]. Actúa como revisor:
1) ¿Todo componente mencionado tiene descripción?
2) ¿Toda integración tiene ambos extremos identificados?
3) ¿Hay afirmaciones sin evidencia o contradictorias?
4) ¿Qué preguntas haría un desarrollador nuevo que este documento
   no responde?
```
