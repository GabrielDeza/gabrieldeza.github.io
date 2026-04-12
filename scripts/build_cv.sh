#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LOG_DIR="$ROOT_DIR/log"
TEX_FILE="$ROOT_DIR/cv/gabriel-deza-cv.tex"
OUTPUT_NAME="gabriel-deza-cv"
OUTPUT_PDF="$ROOT_DIR/assets/pdf/$OUTPUT_NAME.pdf"

mkdir -p "$LOG_DIR" "$ROOT_DIR/assets/pdf"

for _ in 1 2; do
  pdflatex \
    -interaction=nonstopmode \
    -halt-on-error \
    -file-line-error \
    -output-directory="$LOG_DIR" \
    -jobname="$OUTPUT_NAME" \
    "$TEX_FILE"
done

cp "$LOG_DIR/$OUTPUT_NAME.pdf" "$OUTPUT_PDF"
echo "Built $OUTPUT_PDF"
