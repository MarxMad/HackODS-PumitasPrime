"""
Plantilla de extraccion REST para HackODS.

Nota:
- Este script es plantilla. Ajusta endpoint, params y autenticacion
  segun `Guia_ODS/05_guia_servicio_RESTful.pdf`.
"""

from pathlib import Path
import json
import urllib.request


def fetch_json(url: str) -> dict:
    with urllib.request.urlopen(url, timeout=30) as response:
        raw = response.read().decode("utf-8")
    return json.loads(raw)


def main() -> None:
    # TODO: reemplazar por endpoint oficial de indicadores ODS
    endpoint = "https://agenda2030.mx/ODSind.html"
    data = {"status": "template", "endpoint": endpoint}

    out_dir = Path("data")
    out_dir.mkdir(parents=True, exist_ok=True)
    out_file = out_dir / "api_raw_template.json"
    out_file.write_text(json.dumps(data, ensure_ascii=False, indent=2), encoding="utf-8")
    print(f"Archivo generado: {out_file}")


if __name__ == "__main__":
    main()
