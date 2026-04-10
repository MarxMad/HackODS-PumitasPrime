from pathlib import Path


def main() -> None:
    dashboard = Path("dashboard/index.qmd")
    if dashboard.exists():
        print("Proyecto listo. Ejecuta: quarto render")
        print(f"Tablero: {dashboard}")
    else:
        print("No se encontró dashboard/index.qmd")


if __name__ == "__main__":
    main()
