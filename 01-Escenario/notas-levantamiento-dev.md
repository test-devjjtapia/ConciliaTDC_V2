# Notas de levantamiento — Mariana (desarrolladora backend)
> Transcripción cruda, sin ordenar. Así llega la información en la vida real.

- la app consume la API de clientes... bueno, de conciliaciones
- a veces falla cuando el token expira, hay que renovar el token
- hay un proceso nocturno, eso lo corre el mainframe, yo no le entro
- la tabla principal es TRANSACCIONES, hay otra de EXCEPCIONES
- si el archivo del procesador no llega, todo se detiene y Ricardo re-lanza el job
- el job se llama CONCILI o algo así, creo que hay un paso de validación antes
- las diferencias de centavos las absorbe un ajuste automático, creo que hasta 0.99
- cuando hay diferencia mayor, cae en EXCEPCIONES y el analista la revisa en la app
- el reproceso desde la app pega a un endpoint POST, no sé si quedó documentado
- cuidado: la tabla CONCILIACIONES tiene un campo ESTATUS que nadie sabe qué valores tiene, está en el COBOL
- el archivo de salida se manda a Contabilidad, eso lo hace otro job después
- los logs del batch salen en el spool, Ricardo los revisa con Control-M
- la API es Flask, corre en un Linux, el despliegue lo hace... ¿Jenkins? no estoy segura
- si el batch corre dos veces el mismo día duplica movimientos, ya pasó una vez (ver INC-2019)
- no hay diagrama de nada, el último se perdió cuando se fue Omar
