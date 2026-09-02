# Diseño de Agentes de IA para documentación técnico-funcional

> Puedes usar este diseño como marco de
> **"ingeniería de conocimiento asistida por IA"**: agentes especializados
> que aceleran el análisis, con validación humana obligatoria.

## El flujo general

```
        EVIDENCIA
   (código, BD, logs, tickets, sesiones de levantamiento)
            │
            ▼
   ┌─────────────────────┐
   │  AGENTE 1           │  Lee repositorios y DDL
   │  Code Analyst       │  → inventario de componentes,
   └─────────┬───────────┘    reglas de negocio, dependencias
             ▼
   ┌─────────────────────┐
   │  AGENTE 2           │  Organiza hallazgos en plantillas
   │  Documentation      │  → borradores de documentos,
   │  Analyst            │    detecta información faltante
   └─────────┬───────────┘
             ▼
   ┌─────────────────────┐
   │  AGENTE 3           │  ¿Todo sistema tiene dueño?
   │  Consistency        │  ¿Toda API documentada?
   │  Checker            │  ¿Contradicciones entre docs?
   └─────────┬───────────┘
             ▼
   ┌─────────────────────┐
   │  AGENTE 4           │  Compara contra checklist de
   │  Knowledge Gap      │  levantamiento → lista de huecos
   │  Detector           │    y preguntas pendientes
   └─────────┬───────────┘
             ▼
     VALIDACIÓN HUMANA  ◄── analista + experto técnico
             ▼
   DOCUMENTACIÓN OFICIAL (Confluence / Git wiki)
```

## Ficha de cada agente

### Agente 1 — Code Analyst
- **Entrada:** repositorio (COBOL, JCL, SQL, OpenAPI), configuración de scheduler
- **Salida:** inventario de componentes, reglas de negocio extraídas, dependencias, riesgos
- **Prompt base:** P1 de `prompts-copilot.md`
- **Límite:** marca hipótesis; nunca "completa" información que no ve

### Agente 2 — Documentation Analyst
- **Entrada:** salidas validadas del Agente 1 + notas de levantamiento
- **Salida:** borradores en las plantillas de `05-Plantillas/`
- **Prompt base:** P2 y P3
- **Límite:** todo hueco va marcado como [PENDIENTE], no se inventa

### Agente 3 — Consistency Checker
- **Entrada:** todos los borradores
- **Salida:** reporte de inconsistencias (componentes sin dueño, APIs sin documentar, contradicciones)
- **Prompt base:** P6

### Agente 4 — Knowledge Gap Detector
- **Entrada:** borradores + checklist de levantamiento
- **Salida:** lista de huecos documentales y preguntas pendientes con prioridad

## Ejemplo de hueco que el Agente 4 detectaría en este ejercicio

```
Sistema: ConciliaTDC
├── Arquitectura ......... documentada ✓
├── APIs ................. documentada ✓
├── Base de datos ........ documentada ✓
├── Batch ................ documentado ✓
├── Despliegue de la API . ✗ HUECO (Mariana "cree" que es Jenkins)
├── Valores de ESTATUS ... ✗ HUECO (¿solo 3? ¿hay históricos?)
└── Runbook .............. parcial (falta contingencia si Ricardo no está)
```

## Cómo presentarlo en comité técnico o kickoff

> "Hoy lo hago con un Copiloto y prompts especializados por fase. La evolución
> natural —que ya he experimentado en proyectos personales— es orquestar
> agentes: uno analiza código, otro estructura documentos, otro revisa
> consistencia y otro detecta huecos. Lo importante es que la última milla
> siempre es humana: la IA acelera el 70% mecánico para que el analista
> dedique su tiempo al 30% que requiere criterio: validar, preguntar y
> resolver contradicciones con las personas."
