# AI Log - Equipo Pumitas Prime

## Herramientas utilizadas
- Cursor (asistente de código con LLM)
- ChatGPT (edición de texto, estructura y revisión crítica)
- GitHub secret scanning / GitGuardian (detección de posibles secretos)

## Filosofía de uso
Usamos IA como acelerador para tareas mecánicas (boilerplate, estructura, correcciones repetitivas y documentación), pero no para sustituir decisiones analíticas.

Las decisiones sustantivas del proyecto (ODS en foco, selección de variables, mensaje del tablero, interpretación de correlaciones y límites metodológicos) fueron tomadas por el equipo.

Criterio operativo:
- Si una tarea requiere contexto local, criterio de política pública o interpretación causal, la resuelve el equipo.
- Si una tarea es de implementación repetitiva o formateo, se puede delegar a IA y luego se revisa manualmente.

## Registro de uso

### 2026-04-06 | Cursor | Estructura inicial del tablero Quarto
- **Tarea delegada**: Crear tablero en Quarto con visualizaciones Plotly para correlaciones entre ODS 4, 8, 9, 10 y 11.
- **Prompt (resumen)**: "Quiero un proyecto para hackathon ODS 2030 con correlaciones; usar solo Quarto y Plotly."
- **Resultado IA**: Generó `_quarto.yml`, `dashboard/index.qmd`, `data/indicadores_ods_demo.csv` y flujo de render.
- **Modificaciones del equipo**:
  - Ajustamos narrativa en espanol para enfocarla al jurado del hackathon.
  - Confirmamos que el tablero principal estuviera en `dashboard/index.qmd` por regla organizativa.
  - Corregimos un error de redaccion ("no implica causalidad") y validamos coherencia ODS.
- **Decision propia**: Aceptado con cambios. Se uso la propuesta tecnica, pero la narrativa final y el enfoque analitico fueron definidos por el equipo.

### 2026-04-06 | Cursor | Ajuste tecnico para mantener compatibilidad (sin dependencia extra de tendencia)
- **Tarea delegada**: Resolver grafica de dispersion sin depender de paquetes no previstos.
- **Prompt (resumen)**: "Necesito mantener Quarto + Plotly y evitar fallos por dependencias."
- **Resultado IA**: Sustituyo tendencia `trendline="ols"` por ajuste lineal con `numpy.polyfit` y trazado con `plotly.graph_objects`.
- **Modificaciones del equipo**:
  - Revisamos la recta de tendencia y validamos que solo representa asociacion lineal.
  - Conservamos la advertencia metodologica de no inferir causalidad.
- **Decision propia**: Aceptado. Mejora reproducibilidad tecnica sin alterar la interpretacion.

### 2026-04-06 | Cursor | Reorganizacion para estandar del hackathon
- **Tarea delegada**: Reubicar tablero en `dashboard/index.qmd` y corregir rutas de datos.
- **Prompt (resumen)**: "En el grupo pidieron que el tablero vaya en `dashboard/`; adapta el proyecto."
- **Resultado IA**: Reorganizo archivos, configuro render y ajusto lectura del CSV usando ruta robusta con `QUARTO_PROJECT_DIR`.
- **Modificaciones del equipo**:
  - Confirmamos estructura final y salida en `dashboard/index.html`.
  - Validamos ejecucion con `quarto render`.
- **Decision propia**: Aceptado. Fue un cambio de cumplimiento operativo, no analitico.

### 2026-04-06 | Cursor | README visual
- **Tarea delegada**: Proponer y redactar README visual para presentar el proyecto.
- **Prompt (resumen)**: "Genera un README muy visual y basado en ODS 4, 8, 9, 10 y 11."
- **Resultado IA**: README con badges, tabla de alcance, estructura del repo y pasos de ejecucion.
- **Modificaciones del equipo**:
  - Revisamos tono y contenido para que reflejara nuestra identidad.
  - Ajustamos secciones de fuentes y agregamos la guia REST cuando se incorporo.
- **Decision propia**: Aceptado con cambios editoriales.

### 2026-04-10 | Cursor + GitGuardian | Incidentes de secretos y remediacion
- **Tarea delegada**: Diagnosticar 3 alertas "Generic Password" y sanear repositorio.
- **Prompt (resumen)**: "GitGuardian detecto secretos; ayudame a corregir y limpiar historial."
- **Resultado IA**:
  - Detecto literales en scripts SQL de guia (`ODS2015*`, `Anio2020`).
  - Reemplazo por marcadores `REEMPLAZAR_*`.
  - Documento advertencia en `README.md`.
  - Reescribio historial con `git filter-repo` y realizo push forzado.
- **Modificaciones del equipo**:
  - Validamos que no quedaran coincidencias en historial.
  - Confirmamos que, al no haber clones aun, el force-push no afectaba a terceros.
- **Decision propia**: Aceptado. Priorizamos seguridad y cumplimiento de escaneo.

### 2026-04-10 | Cursor | Integracion de guia API REST
- **Tarea delegada**: Integrar `05_guia_servicio_RESTful.pdf` al repo y enlazarla en README.
- **Prompt (resumen)**: "Encontre un PDF para usar APIs; haz push."
- **Resultado IA**: Archivo movido a `Guia_ODS/` y README actualizado con enlace.
- **Modificaciones del equipo**:
  - Validamos que la ubicacion fuera consistente con las guias existentes.
- **Decision propia**: Aceptado.

## Decisiones que NO se delegaron a IA
- Seleccion final de ODS en foco: **4, 8, 9, 10 y 11**.
- Interpretacion sustantiva de correlaciones y mensajes para jurado.
- Criterios metodologicos sobre limites del analisis (correlacion != causalidad).
- Priorizacion de narrativa y enfoque del problema para el hackathon.

## Evidencia de reproducibilidad
- Pipeline reproducible con:
  - `requirements.txt`
  - `_quarto.yml`
  - `dashboard/index.qmd`
  - `quarto render`
- Estandar de estructura cumplido: tablero en `dashboard/index.qmd`.
- Transparencia de uso de IA documentada en este `ai-log.md`.

## Declaracion final
La IA se uso como herramienta de apoyo tecnico y editorial. El analisis, las decisiones de enfoque y la narrativa final del proyecto fueron responsabilidad del equipo **Pumitas Prime**.
