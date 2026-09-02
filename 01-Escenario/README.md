# 01 — Escenario: Tu primer día

## Contexto del proyecto

**Empresa:** JJTapiaMX-Consulting
**Cliente:** Institución financiera (banca)
**Sistema asignado:** ConciliaTDC
**Tu rol:** Analista Documentador Técnico-Funcional

## Lo que te dicen el primer día

> "ConciliaTDC concilia las transacciones de tarjetas de crédito contra los movimientos
> del procesador. La app la usan los analistas de conciliación para ver diferencias y
> reprocesar. El que la construyó ya no está. Hay un COBOL que corre de noche, una API
> y una base de datos. Cuando falla el batch, soporte llama a Ricardo — él es el único
> que sabe qué hacer. Necesitamos que documentes todo."

## Inventario de evidencia disponible

| Evidencia | Archivo | Qué aporta |
|---|---|---|
| Notas de levantamiento con desarrollador | `notas-levantamiento-dev.md` | Conocimiento informal, desordenado, parcial |
| Tickets de incidentes históricos | `tickets-jira.md` | Fallos reales, síntomas, componentes afectados |
| Log de fallo del batch | `logs/batch-error.log` | Trazabilidad de un incidente real |
| Código fuente y configuración | `../02-Sistema-ConciliaTDC/` | La verdad técnica del sistema |

## Personas clave (stakeholders)

| Persona | Rol | Qué sabe |
|---|---|---|
| Ricardo | Soporte L2/L3 | Qué hacer cuando falla el batch (conocimiento NO documentado) |
| Mariana | Desarrolladora backend | La API y la base de datos |
| Usuarios de conciliación | Negocio | Qué significan las diferencias y cuándo se reprocesa |
| DBA | Infraestructura | Tablas, permisos, respaldos |

> **Punto crítico del proyecto:** Ricardo es un *Single Point of Knowledge*.
> Parte de tu trabajo es convertir lo que está en su cabeza en un runbook.

## Reglas

1. No modifiques los archivos de `02-Sistema-ConciliaTDC/` — son el "sistema en producción".
2. Documenta solo lo que puedas **evidenciar** (código, logs, tickets, sesiones de levantamiento).
3. Lo que no puedas confirmar, regístralo como **pregunta pendiente** — en el trabajo real, eso es oro.
4. Todo borrador generado con IA debe marcarse y validarse contra la evidencia.
