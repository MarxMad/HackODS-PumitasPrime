# Metadatos de datasets (HackODS 2026)

Este archivo documenta fuente, fecha de descarga, licencia y variables de los datos usados por el tablero.

## Dataset 1: `data/indicadores_ods_demo.csv`

- **Tipo**: Dataset de trabajo para prototipo (pre-corte).
- **Cobertura geográfica**: 32 entidades federativas de Mexico.
- **Cobertura temporal**: corte unico (sin serie temporal).
- **Fuente base conceptual**:
  - Agenda 2030 Mexico (catalogo de indicadores ODS): https://agenda2030.mx
  - Mapeo de metas/indicadores documentado en `Correlacionobjetivos.md`.
- **Fecha de descarga**: 2026-04-06 (construccion del prototipo).
- **Licencia**:
  - El CSV de este repo es una tabla derivada para prototipo del equipo.
  - Para entrega final, cada variable se sustituira por valores descargados de fuentes oficiales y sus terminos de uso.

### Diccionario de variables

- `entidad`: Nombre de la entidad federativa.
- `ods_4_finalizacion_prim_sec_prep`: Indice de finalizacion escolar (proxy ODS 4).
- `ods_8_empleo_informal`: Porcentaje de empleo informal no agropecuario (proxy ODS 8).
- `ods_9_investigadores_millón`: Personas investigadoras por millon de habitantes (proxy ODS 9).
- `ods_10_pobreza_50_mediana`: Proporcion bajo 50% de la mediana de ingreso (proxy ODS 10).
- `ods_11_vivienda_precaria`: Proporcion de vivienda precaria urbana (proxy ODS 11).

## Plan de migracion a datos oficiales (entrega final)

1. Sustituir cada proxy por una serie oficial con URL de consulta o descarga directa.
2. Homologar periodo de referencia entre indicadores.
3. Registrar evidencia de descarga (fecha, URL, licencia) en este mismo archivo.
4. Versionar script de extraccion/limpieza en `scripts/`.
