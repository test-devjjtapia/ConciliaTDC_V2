# Tickets históricos (exportación simulada de Jira)

---

### INC-2041 — Batch de conciliación no ejecutó (Crítico)
**Fecha:** 2026-07-14 · **Reporta:** Soporte L2 · **Resuelve:** Ricardo
**Síntoma:** Analistas reportan que no hay datos nuevos en la app por la mañana.
**Diagnóstico:** JOB_CONCILIACION quedó en espera: JOB_VALIDACION terminó con RC=08
(archivo de entrada del procesador no llegó).
**Resolución:** Se confirmó con el procesador, llegó el archivo a las 10:20,
Ricardo re-lanzó el job manualmente desde Control-M. Batch completó 10:45.
**Notas de Ricardo:** "Siempre revisen primero si llegó el archivo. Si no llegó,
no re-lancen a lo ciego."

---

### INC-2019 — Movimientos duplicados en conciliación (Mayor)
**Fecha:** 2026-05-03 · **Reporta:** Usuario de conciliación
**Síntoma:** Transacciones aparecen duplicadas en la app.
**Diagnóstico:** JOB_CONCILIACION se ejecutó dos veces el mismo día
(reinicio sin verificar corrida previa). El COBOL no valida doble ejecución.
**Resolución:** DBA depuró duplicados con respaldo. Se agregó recordatorio
operativo (no documentado, solo verbal).
**Riesgo pendiente:** La validación de doble corrida sigue siendo manual.

---

### INC-1987 — App no muestra conciliaciones (Menor)
**Fecha:** 2026-03-22 · **Reporta:** Usuario de conciliación
**Síntoma:** La app móvil no puede consultar información, pantalla en blanco.
**Diagnóstico:** Token de sesión expirado; el refresh falla si el usuario
tenía más de 8 horas sin actividad.
**Resolución:** Cerrar y abrir sesión. Se escaló a desarrollo para revisar
el manejo del refresh token (pendiente).

---

### INC-1822 — Diferencias de centavos masivas (Menor)
**Fecha:** 2025-11-30
**Síntoma:** 400+ excepciones con diferencias de $0.01 a $0.99.
**Diagnóstico:** Error de redondeo en el archivo del procesador.
Las diferencias ≤ $0.99 se ajustan automáticamente (regla en el COBOL),
pero ese día el archivo venía mal formado y el ajuste no aplicó.
**Resolución:** Procesador corrigió el archivo; se re-corrió el batch al día siguiente.
