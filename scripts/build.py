#!/usr/bin/env python3
"""Compilar documentos independientes con la misma configuración de latexmk."""
import argparse
from pathlib import Path
import re
import shutil
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]


def documents():
    candidates = [ROOT / "ci/smoke/main.tex", ROOT / "template/main.tex"]
    candidates += sorted((ROOT / "essays").glob("*/main.tex"))
    return [path for path in candidates if path.is_file()]


def check_log(document):
    log = document.parent / "build/main.log"
    pdf = document.parent / "build/main.pdf"
    if not log.is_file() or not pdf.is_file():
        raise RuntimeError(f"Faltan PDF o log para {document.relative_to(ROOT)}")
    content = log.read_text(encoding="utf-8", errors="replace")
    patterns = [
        r"(?:Citation|Reference) .+ undefined",
        r"There were undefined (?:references|citations)",
        r"Please \(re\)run Biber",
        r"Missing character:",
    ]
    if any(re.search(pattern, content) for pattern in patterns):
        raise RuntimeError(f"Citas, referencias o caracteres sin resolver: {log}")
    print(f"OK: {pdf.relative_to(ROOT)}", flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("document", nargs="?", help="Ruta de un main.tex desde la raíz")
    parser.add_argument("--list", action="store_true", help="Listar documentos para CI")
    parser.add_argument("--check-logs", action="store_true", help="Comprobar resultados existentes")
    args = parser.parse_args()
    selected = documents()
    if args.document:
        candidate = (ROOT / args.document).resolve()
        if candidate not in selected:
            parser.error("Documento no registrado: use template/main.tex o essays/<slug>/main.tex")
        selected = [candidate]
    if not selected:
        parser.error("No hay documentos para compilar")
    for path in selected:
        relative = path.relative_to(ROOT).as_posix()
        if not re.fullmatch(r"[a-zA-Z0-9_./-]+", relative):
            parser.error("Use nombres de carpetas ASCII sin espacios")
    if args.list:
        print("\n".join(path.relative_to(ROOT).as_posix() for path in selected))
        return
    if not args.check_logs and not shutil.which("latexmk"):
        parser.error("Instale TeX Live 2026 con XeLaTeX, latexmk y Biber")
    for document in selected:
        if not args.check_logs:
            subprocess.run(
                ["latexmk", "-norc", "-r", str(ROOT / "latexmkrc"), document.name],
                cwd=document.parent, check=True,
            )
        check_log(document)


if __name__ == "__main__":
    try:
        main()
    except (RuntimeError, subprocess.CalledProcessError) as error:
        print(error, file=sys.stderr)
        sys.exit(1)

