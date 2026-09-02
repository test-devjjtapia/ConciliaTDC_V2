# Guía de preguntas para sesiones de levantamiento

> Uso real: prepara la sesión con tu Copiloto (ver prompt P0 en
> `../04-Toolkit-IA/prompts-copilot.md`) y adapta esta base al sistema.

## A. Funcionales (negocio)

1. ¿Cuál es el objetivo del sistema? ¿Qué problema de negocio resuelve?
2. ¿Quiénes lo usan y para qué lo usan día a día?
3. ¿Cuáles son los procesos críticos? ¿Qué pasa si el sistema no está disponible un día?
4. ¿Qué reglas de negocio no son obvias? (ej. tolerancias, ajustes, reprocesos)
5. ¿Qué excepciones existen y quién las atiende?

## B. Técnicas (desarrollo / arquitectura)

6. ¿Qué componentes existen? (app, API, BD, batch, integraciones)
7. ¿Qué sistemas consume y qué sistemas lo consumen?
8. ¿Qué APIs expone? ¿Quién las consume? ¿Cómo se autentican?
9. ¿Qué bases de datos usa? ¿Cuáles son las tablas críticas?
10. ¿Hay procesos batch o jobs? ¿Cuándo corren? ¿Qué dependencias tienen?
11. ¿Cómo se despliega? ¿Quién lo despliega?
12. ¿Qué pasaría si una dependencia falla? ¿Hay contingencia?

## C. Operativas (soporte)

13. ¿Cuáles son los incidentes más frecuentes? (cruza con Jira/ServiceNow)
14. ¿Qué revisas primero cuando falla? ¿Dónde están los logs?
15. ¿Qué acciones solo tú sabes hacer? ¿Qué pasa si no estás?
16. ¿Qué códigos de error existen y qué significan? (ej. RC=08)
17. ¿Qué NO se debe hacer nunca? (ej. re-lanzar sin verificar corrida previa)

## D. De cierre (todas las sesiones)

18. ¿Qué documentación existe, aunque sea vieja o parcial?
19. ¿Quién más sabe de este sistema?
20. Si tuvieras que advertirme UNA cosa sobre este sistema, ¿cuál sería?

---

## Registro de preguntas pendientes (llénalo durante el ejercicio)

| # | Pregunta | A quién preguntar | Estado |
|---|---|---|---|
| 1 | ¿Cómo se despliega la API? ¿Jenkins? | Mariana / DevOps | Pendiente |
| 2 | ¿Qué valores puede tener ESTATUS además de los del COBOL? | Mariana | Pendiente |
| 3 | ¿Existe validación automática de doble corrida del batch? | Ricardo | Pendiente |
