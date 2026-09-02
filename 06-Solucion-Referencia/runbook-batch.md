# Runbook RB-01 — Batch de conciliación no ejecutó / RC=08

| Campo | Valor |
|---|---|
| Proceso | Cadena nocturna ConciliaTDC (Control-M) |
| Severidad típica | Crítica (analistas sin datos a las 07:00) |
| Tiempo estimado de atención | 30–45 min |
| Validado por | Ricardo (Soporte L3) |
| Incidentes históricos | INC-2041, INC-2019, INC-1822 |

## Síntoma

Los analistas reportan por la mañana que la app no muestra conciliaciones
nuevas, o Control-M muestra la cadena detenida.

## Componentes involucrados

- Control-M (scheduler)
- JOB_VALIDACION → JOB_CONCILIACION → JOB_NOTIF_CONTA
- Archivo del procesador `BCT.PROD.TDC.TRANSAC.D<fecha>`
- Programa COBOL CONCILI1 / base DB2

## Validaciones paso a paso

1. En Control-M, revisa en qué job quedó detenida la cadena.
2. Abre el spool del job y busca el código de retorno (RC).
3. Si **JOB_VALIDACION terminó RC=08**: el archivo del procesador no llegó
   o llegó mal formado → confirma con el procesador antes de hacer nada más.
4. Si **JOB_CONCILIACION terminó RC=08 en PASO01**: el dataset de entrada
   no existe (ver log: `DATASET NO ENCONTRADO`).
5. Verifica si el batch ya corrió hoy (revisa corridas previas del job).

## Resolución

1. Confirma con el procesador la recepción del archivo.
2. Cuando el archivo esté disponible, re-lanza el job desde Control-M.
3. Verifica en el resumen del spool: transacciones leídas, conciliadas
   y excepciones con valores razonables.
4. Confirma que JOB_NOTIF_CONTA liberó el archivo a Contabilidad.
5. Notifica a los analistas que la información del día está disponible.

## Qué NO hacer

- **Nunca re-lances el job sin verificar si ya corrió ese día.** El COBOL no
  valida doble ejecución y los movimientos se duplican (INC-2019: requirió
  depuración manual por DBA con respaldo).
- **No re-lances a ciegas con RC=08** sin confirmar primero la llegada del
  archivo del procesador.

## Escalamiento

| Si... | Escalar a |
|---|---|
| El procesador no confirma el archivo en 1 h | Operaciones / Procesador TDC |
| Hay sospecha de doble corrida | DBA + Ricardo (L3) |
| El log muestra errores no descritos aquí | Desarrollo (Mariana) |
