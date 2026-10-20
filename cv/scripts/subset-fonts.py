"""Regenerate the committed Iosevka web subsets; not needed for normal builds.

Run: uv run --with fonttools --with brotli python scripts/subset-fonts.py
"""
from pathlib import Path
from fontTools import subset

root = Path(__file__).resolve().parents[1]
source = root / "node_modules/@fontsource/iosevka"
destination = root / "src/assets/fonts"
destination.mkdir(parents=True, exist_ok=True)
license_path = root / "public/fonts/OFL.txt"
license_path.parent.mkdir(parents=True, exist_ok=True)

# Stable ranges cover future English edits, accented names, and terminal symbols.
ranges = "U+0000-024F,U+0370-052F,U+1E00-1EFF,U+2000-206F,U+2190-21FF,U+2500-257F"
for weight, label in [(400, "regular"), (700, "bold")]:
    output = destination / f"iosevka-{label}.woff2"
    subset.main([
        str(source / f"files/iosevka-latin-{weight}-normal.woff2"),
        f"--output-file={output}",
        "--flavor=woff2",
        f"--unicodes={ranges}",
        "--name-IDs+=13,14",
    ])
    print(f"{output.name}: {output.stat().st_size:,} bytes")
license_text = (source / "LICENSE").read_text()
license_path.write_text("\n".join(line.rstrip() for line in license_text.splitlines()) + "\n")
