# Documento Funcional — ConciliaTDC

| Campo | Valor |
|---|---|
| Sistema | ConciliaTDC |
| Versión del documento | 1.0 |
| Autor | Analista Documentador Técnico-Funcional |
| Validado por (negocio) | Usuarios de conciliación |
| Estado | Aprobado (ejemplo de referencia) |

## 1. Objetivo del sistema

ConciliaTDC concilia diariamente las transacciones de tarjetas de crédito
reportadas por el procesador contra los movimientos registrados internamente.
Detecta diferencias, absorbe automáticamente las menores y presenta las
mayores a los analistas de conciliación para su revisión y reproceso.

## 2. Usuarios y roles

| Rol | Qué hace con el sistema | Frecuencia |
|---|---|---|
| Analista de conciliación | Consulta conciliaciones del día, revisa excepciones, solicita reprocesos | Diario (a partir de 07:00) |
| Soporte L2/L3 | Atiende fallas del batch nocturno | Por incidente |
| Contabilidad | Recibe el archivo de conciliados | Diario |

## 3. Procesos de negocio

### 3.1 Proceso principal: conciliación nocturna

1. El procesador envía el archivo de transacciones del día.
2. El sistema valida que el archivo llegó completo y bien formado.
3. Cada transacción se compara contra el movimiento registrado.
4. Sin diferencia → se marca como **CONCILIADA**.
5. Diferencia de hasta $0.99 → se ajusta automáticamente (**AJUSTADA**).
6. Diferencia mayor → se genera una **EXCEPCIÓN**.
7. Los conciliados se envían a Contabilidad.
8. Por la mañana, los analistas revisan las excepciones en la app.

### 3.2 Proceso de revisión de excepciones

1. El analista consulta las excepciones pendientes en la app.
2. Revisa la diferencia y decide: **ACEPTAR_DIFERENCIA** o **REPROCESAR**.
3. La solicitud se envía por la API y la excepción queda RESUELTA.

## 4. Reglas de negocio

| # | Regla | Origen | Validada por |
|---|---|---|---|
| RN-01 | Diferencias ≤ $0.99 se ajustan automáticamente | Código (CONCILI1, WS-TOLERANCIA) + notas Mariana | Pendiente firma de negocio |
| RN-02 | Diferencias > $0.99 requieren revisión humana | Código (CONCILI1) | Pendiente firma de negocio |
| RN-03 | Si el archivo del procesador no llega, la cadena completa se detiene | Control-M + INC-2041 | Ricardo |
| RN-04 | El batch NO debe ejecutarse dos veces el mismo día (duplica movimientos) | INC-2019 | Ricardo |
| RN-05 | La ventana del batch debe terminar antes de las 07:00 | control-m-jobs.json | Operaciones |

## 5. Casos de excepción

| Caso | Qué lo provoca | Quién lo atiende | Cómo |
|---|---|---|---|
| Archivo del procesador no llega | Falla/retraso del procesador | Soporte (Ricardo) | Runbook RB-01 |
| Diferencia mayor a tolerancia | Error de captura o del procesador | Analista de conciliación | App → reproceso |
| App sin datos por la mañana | El batch no corrió | Soporte | Verificar cadena Control-M |
| Token expirado en la app | Sesión > 8 h sin actividad | Usuario / Desarrollo | Re-login (INC-1987) |

## 6. Preguntas pendientes

| # | Pregunta | Dueño | Estado |
|---|---|---|---|
| 1 | ¿La tolerancia de $0.99 sigue vigente como regla de negocio o fue histórica? | Negocio | Pendiente |
| 2 | ¿Se implementará validación automática de doble corrida? | Desarrollo | Pendiente |
