#!/usr/bin/env python3
"""Validate all thinker directories against the canonical schema."""

import json
import os
import re
import sys
from pathlib import Path

try:
    import tomllib
except ImportError:
    import tomli as tomllib

try:
    import jsonschema
except ImportError:
    print("ERROR: jsonschema not installed. Run: pip install jsonschema")
    sys.exit(1)

ROOT = Path(__file__).parent.parent
SCHEMA_PATH = ROOT / "schema" / "thinker.toml.schema.json"
THINKERS_DIR = ROOT / "thinkers"

errors = []

# Load schema
with open(SCHEMA_PATH) as f:
    schema = json.load(f)

# Validate each thinker
for thinker_dir in sorted(THINKERS_DIR.iterdir()):
    if not thinker_dir.is_dir():
        continue

    slug = thinker_dir.name
    toml_path = thinker_dir / "thinker.toml"
    examples_path = thinker_dir / "EXAMPLES.md"
    sources_path = thinker_dir / "SOURCES.md"

    # Check required files exist
    for required in [toml_path, examples_path, sources_path]:
        if not required.exists():
            errors.append(f"{slug}: missing {required.name}")
            continue

    if not toml_path.exists():
        continue  # Already reported

    # Validate TOML syntax
    try:
        with open(toml_path, "rb") as f:
            thinker = tomllib.load(f)
    except Exception as e:
        errors.append(f"{slug}: TOML parse error: {e}")
        continue

    # Validate against JSON Schema
    try:
        jsonschema.validate(thinker, schema)
    except jsonschema.ValidationError as e:
        errors.append(f"{slug}: schema violation: {e.message}")
        continue

    # Check EXAMPLES.md has substantial content
    examples_text = examples_path.read_text()
    word_count = len(examples_text.split())
    if word_count < 200:
        errors.append(f"{slug}: EXAMPLES.md has {word_count} words (min 200)")

    # Check SOURCES.md has >= 3 references with DOI
    sources_text = sources_path.read_text()
    doi_pattern = r'https://doi\.org/10\.\S+'
    dois = re.findall(doi_pattern, sources_text)
    if len(dois) < 3:
        errors.append(f"{slug}: SOURCES.md has {len(dois)} DOIs (min 3)")

    # Check slug matches directory name
    if thinker.get("identity", {}).get("slug") != slug:
        errors.append(f"{slug}: identity.slug '{thinker.get('identity', {}).get('slug')}' != directory name")

    # Check self_acknowledged_biases is not empty and not just "none"
    biases = thinker.get("identity", {}).get("self_acknowledged_biases", [])
    if not biases:
        errors.append(f"{slug}: self_acknowledged_biases is empty (min 1)")
    elif len(biases) == 1 and biases[0].lower() in ("none", "n/a", "ninguno"):
        errors.append(f"{slug}: self_acknowledged_biases should not be 'none'")

    # Success
    if not any(e.startswith(slug) for e in errors):
        print(f"  ✓ {slug}")

# Report
if errors:
    print(f"\n❌ {len(errors)} error(s):")
    for e in errors:
        print(f"  • {e}")
    sys.exit(1)
else:
    print(f"\n✅ All {len(list(THINKERS_DIR.iterdir()))} thinkers valid!")
    sys.exit(0)
