
HackODS
Reglamentos 
Calendario
Capacitación
Mentorías 
Política de IA
 
Contenido
1 Postura del HackODS sobre la IA
2 Herramientas permitidas
3 Reglas obligatorias
4 Rúbrica: Integración estratégica de herramientas
5 Ejemplos de ai-log.md
5.1 Ejemplo: Delegación pasiva
5.2 Ejemplo: Uso funcional
5.3 Ejemplo: Uso estratégico
Declaratoria y Reglamento de Uso de IA
HackODS UNAM 2026

1 Postura del HackODS sobre la IA
En el HackODS UNAM 2026 no prohibimos el uso de herramientas de inteligencia artificial generativa. Consideramos que estas herramientas forman parte del ecosistema de trabajo contemporáneo y que aprender a integrarlas con criterio es una competencia profesional valiosa.

Sin embargo, el objetivo del hackathon es evaluar la capacidad analítica de cada equipo: su capacidad de formular preguntas relevantes, tomar decisiones informadas sobre datos, y construir una narrativa que conecte los Objetivos de Desarrollo Sostenible con problemáticas reales. Ninguna herramienta sustituye eso.

Por lo tanto, nuestra política se resume en:

No nos importa si usaron IA. Nos importa que piensen.

2 Herramientas permitidas
Los equipos pueden usar cualquier herramienta de IA generativa, incluyendo pero no limitado a:

Asistentes de código
Chatbots generativos
Herramientas de corrección y edición de texto
3 Reglas obligatorias
3.1 Archivo ai-log.md
Cada equipo debe incluir un archivo ai-log.md en la raíz de su repositorio. Este archivo documenta de manera transparente cómo se usaron herramientas de IA durante el hackathon.

El archivo debe contener como mínimo:

Herramientas utilizadas: lista de las herramientas de IA empleadas.
Registro de uso: entradas individuales para cada interacción significativa, con:
la fecha,
la tarea delegada,
el prompt,
el resultado obtenido y
las modificaciones que realizó el equipo.
Decisiones propias: para cada entrada, una explicación de por qué se aceptó, rechazó o modificó la salida de la IA.
Ausencia del ai-log.md
La ausencia del archivo ai-log.md en el repositorio resultará en una penalización en la evaluación, independientemente de si el equipo usó IA o no. En caso de no haber usado herramientas de IA, el archivo debe indicar explícitamente: “El equipo NOMBRE_DEL_EQUIPO no utilizó herramientas de inteligencia artificial generativa durante el hackathon.”

3.2 Reproducibilidad ante todo
Todo código generado con asistencia de IA debe:

Ejecutarse correctamente en el pipeline del proyecto.
Seguir las convenciones de estilo del equipo (sin mezcla de estilos provenientes de distintos prompts).
Estar documentado con comentarios que demuestren comprensión.
3.3 Narrativa propia
La narrativa del tablero —los textos que contextualizan los datos, conectan las variables con los ODS y formulan argumentos— debe ser producto del trabajo intelectual del equipo. Puede usarse IA como herramienta de revisión o retroalimentación, pero el contenido narrativo final debe reflejar la voz y el criterio del equipo.

La capacidad de responder con solidez forma parte de la evaluación.

4 Rúbrica: Integración estratégica de herramientas
El uso de IA se evalúa como una dimensión independiente en la rúbrica del hackathon. Cuando el equipo usa la IA, se evalúa cómo se integró en el proceso de trabajo.

Nivel	Descriptor	Puntaje
Uso estratégico	La IA fue un acelerador, no un sustituto. Hay una filosofía explícita de uso, los prompts son reproducibles, y las decisiones propias están documentadas en el archivo ai-log.md como se describe en el punto 3.1 de esta declaratoria.	7-10
Uso funcional	La IA se usó para tareas específicas y delimitadas. El equipo puede explicar qué delegó y por qué. Hay registro claro en el archivo ai-log.md pero la reflexión sobre las decisiones es limitada.	4-6
Delegación pasiva	La IA generó el contenido con mínima intervención del equipo. La narrativa es genérica, el código presenta inconsistencias de estilo y el archivo ai-log.md es vago o superficial.	1-3
5 Ejemplos de ai-log.md
A continuación presentamos tres ejemplos para un proyecto hipotético: un tablero sobre el ODS 6 (Agua Limpia y Saneamiento) con datos de CONAGUA. Los tres equipos usan IA; la diferencia está en cómo la usan y documentan.

5.1 Ejemplo: Delegación pasiva
# AI Log - Equipo Aqua

## Herramientas utilizadas
- ChatGPT 4o

## Uso general
Usamos ChatGPT para ayudarnos con el código del tablero
y con algunas partes de la narrativa. También nos ayudó
con las gráficas.

¿Por qué este log es insuficiente?
No hay detalle de tareas específicas, no hay registro de decisiones, no hay trazabilidad del proceso. Un juez no puede distinguir qué hizo el equipo de qué hizo la IA. Este tipo de registro corresponde al nivel de delegación pasiva en la rúbrica.

5.2 Ejemplo: Uso funcional
# AI Log - Equipo Hidro

## Herramientas
- Claude (claude.ai)
- GitHub Copilot

## Registro de uso

### 2026-03-15 | Claude | Limpieza de datos
- **Tarea**: Teníamos el CSV de CONAGUA con columnas mal
  nombradas y valores faltantes. Le pedimos a Claude que
  nos generara un script de limpieza.
- **Resultado**: Nos dio un pipeline con pandas que
  renombraba columnas y hacía imputación con la mediana.
- **Modificación**: Cambiamos la imputación por
  interpolación temporal porque nuestros datos son series
  de tiempo mensuales. La mediana no tenía sentido aquí.

### 2026-03-15 | Copilot | Visualización
- **Tarea**: Autocompletado para generar el código base
  de un mapa interactivo con plotly express.
- **Resultado**: Generó la estructura básica del mapa
  con px.choropleth.
- **Modificación**: Ajustamos la paleta de colores y
  agregamos etiquetas manuales para los estados con
  mayor estrés hídrico.

### 2026-03-16 | Claude | Depuración
- **Tarea**: El render de Quarto fallaba con un error que
   no entendíamos. Pegamos el error en Claude.
- **Resultado**: Identificó un error en uso de comillas.
- **Modificación**: Ninguna, la solución fue directa.

Buen registro, espacio para crecer
Hay trazabilidad clara y una decisión técnica propia (interpolación temporal sobre mediana). Sin embargo, la IA participó en casi todas las tareas técnicas. Un juez exploraría qué tanto domina el equipo su propio pipeline. Este tipo de registro corresponde al nivel de uso funcional en la rúbrica.

5.3 Ejemplo: Uso estratégico
# AI Log - Equipo Cuenca

## Herramientas
- Claude (claude.ai)
- GitHub Copilot (VS Code)

## Filosofía de uso
Decidimos usar IA exclusivamente para tareas mecánicas y
de exploración inicial. La narrativa, la selección de
variables y las decisiones editoriales fueron 100% del
equipo. Nuestro criterio: si la tarea requiere
conocimiento del contexto hídrico de Guerrero, la
hacemos nosotros.

## Registro de uso 

### 2026-03-15 | Claude | Exploración de estructura
- **Tarea**: Le pedimos 3 opciones de layout para un
  tablero de Quarto con 4 secciones temáticas.
- **Prompt**: "Dame 3 estructuras de layout en Quarto
  dashboard para un proyecto con 4 secciones: contexto
  geográfico, acceso a agua, calidad del agua, y
  tendencia temporal"
- **Resultado**: Nos dio layouts con tabs, sidebar y
  scroll vertical.
- **Decisión**: Elegimos sidebar porque nuestro usuario
  objetivo  necesita
  navegar entre secciones sin perder el contexto del mapa
  principal. 

### 2026-03-15 | Copilot | Boilerplate de gráficas
- **Tarea**: Generar código base para 6 gráficas en
  plotly.
- **Resultado**: Templates funcionales para bar, line,
  choropleth, scatter, heatmap, y funnel.
- **Decisión**: Descartamos 3 de las 6. El heatmap no
  comunicaba bien la estacionalidad (probamos y era
  confuso). El scatter no era apropiado para datos
  categóricos por municipio. Nos quedamos con bar, line
  y choropleth. Toda la personalización visual (paleta
  basada en identidad del ODS 6, etiquetas en español,
  anotaciones contextuales) fue manual.

### 2026-03-16 | Claude | Revisión de narrativa
- **Tarea**: Le pedimos que criticara nuestro borrador de
  narrativa de la sección de acceso a agua.
- **Prompt**: "Critica este texto como si fueras un editor
  de datos. ¿La narrativa conecta bien los datos con el
  argumento? ¿Hay saltos lógicos?"
- **Resultado**: Señaló que no conectábamos el dato de
  cobertura municipal con el argumento de desigualdad
  regional.
- **Decisión**: Agregamos un párrafo puente con el
  coeficiente de Gini de acceso hídrico que ya teníamos
  calculado pero no habíamos integrado. El texto final
  es completamente nuestro, la IA solo fungió como
  revisor crítico.

### NO usamos IA para hacer lo siguiente:
- La selección de las 4 variables clave (revisión de
  literatura y discusión en equipo)
- La narrativa del tablero (redacción propia, 3
  iteraciones internas)
- La interpretación de outliers en Acapulco post-Otis
  (conocimiento local del equipo)

Modelo a seguir
Hay una filosofía explícita de uso, prompts reproducibles, decisiones justificadas con conocimiento de contexto, y una sección de lo que deliberadamente no se delegó. Este tipo de registro corresponde al nivel de uso estratégico en la rúbrica. Además, el equipo demuestra capacidad analítica.

HackODS UNAM 2026
 