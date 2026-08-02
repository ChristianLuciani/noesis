#!/usr/bin/env python3
"""Generate Zola content from /thinkers/ directory.

Creates site/content/ with thinker pages, family pages, and index.
Reads thinker.toml, EXAMPLES.md, and TAXONOMY.md.
"""

import os
import re
import shutil
import sys
from pathlib import Path

try:
    import tomllib
except ImportError:
    import tomli as tomllib

ROOT = Path(__file__).parent.parent
THINKERS_DIR = ROOT / "thinkers"
CONTENT_DIR = ROOT / "site" / "content"
FAMILIES = {
    "Processing Mode": "How thought initiates and processes — the fast/slow axis of Kahneman.",
    "Reasoning Direction": "Where thinking moves — divergent, convergent, lateral.",
    "Analytical Lenses": "Disciplined lenses for analyzing problems — consolidated academic traditions.",
    "Temporal Orientation": "Time horizon of thinking — the short/long-term axis.",
    "Meta & Structural": "Thinking about thinking — modes that operate on other modes.",
}

# Clean and recreate content
if CONTENT_DIR.exists():
    shutil.rmtree(CONTENT_DIR)
CONTENT_DIR.mkdir(parents=True)

# Create thinkers content directory
thinkers_content = CONTENT_DIR / "thinkers"
thinkers_content.mkdir()

# Create families content directory
families_content = CONTENT_DIR / "families"
families_content.mkdir()

# Process each thinker
thinkers_meta = {}

for thinker_dir in sorted(THINKERS_DIR.iterdir()):
    if not thinker_dir.is_dir():
        continue
    
    slug = thinker_dir.name
    toml_path = thinker_dir / "thinker.toml"
    examples_path = thinker_dir / "EXAMPLES.md"
    
    if not toml_path.exists():
        print(f"  SKIP {slug}: no thinker.toml")
        continue
    
    with open(toml_path, "rb") as f:
        data = tomllib.load(f)
    
    identity = data.get("identity", {})
    profile = data.get("cognitive_profile", {})
    skills = data.get("skills", {})
    memory = data.get("memory", {})
    context = data.get("context", {})
    runtime = data.get("runtime", {})
    taxonomy = data.get("taxonomy", {})
    
    display_name = identity.get("display_name", slug)
    tagline = identity.get("tagline", "")
    tradition = identity.get("tradition", "")
    biases = identity.get("self_acknowledged_biases", [])
    
    # Build frontmatter
    fm = {
        "title": display_name,
        "slug": slug,
        "template": "thinker.html",
    }
    
    # Taxonomies
    family_list = taxonomy.get("family", [])
    if family_list:
        fm["taxonomies"] = {"family": family_list}
    
    # Extra metadata
    fm["extra"] = {
        "tagline": tagline,
        "tradition": tradition,
        "biases": biases,
        "characteristic_questions": profile.get("characteristic_questions", []),
        "heuristics": profile.get("heuristics", []),
        "epistemic_vices": profile.get("epistemic_vices", []),
        "stops_when": profile.get("stops_when", ""),
        "ignores": profile.get("ignores", []),
        "skills": skills.get("declared", []),
        "memory_type": memory.get("type", "ephemeral"),
        "memory_retention": memory.get("retention", "session"),
        "context_strategy": context.get("strategy", "full_context"),
        "runtime_execution": runtime.get("preferred_execution", "chain_of_thought"),
        "related": taxonomy.get("related", []),
    }
    
    # Build TOML frontmatter string
    fm_lines = ["+++"]
    fm_lines.append(f'title = "{display_name}"')
    fm_lines.append(f'slug = "{slug}"')
    fm_lines.append('template = "thinker.html"')
    
    if family_list:
        families_str = ", ".join(f'"{f}"' for f in family_list)
        fm_lines.append(f'\n[taxonomies]')
        fm_lines.append(f'family = [{families_str}]')
    
    fm_lines.append("\n[extra]")
    fm_lines.append(f'tagline = """{tagline}"""')
    fm_lines.append(f'tradition = """{tradition}"""')
    
    # Lists in extra
    for key in ["characteristic_questions", "heuristics", "epistemic_vices", "ignores", "skills", "biases"]:
        vals = fm["extra"][key]
        items = ", ".join(f'"""{v}"""' for v in vals)
        fm_lines.append(f'{key} = [{items}]')
    
    for key in ["stops_when"]:
        val = fm["extra"][key]
        if val:
            fm_lines.append(f'{key} = """{val}"""')
    
    # Scalar extras
    for key in ["memory_type", "memory_retention", "context_strategy", "runtime_execution"]:
        fm_lines.append(f'{key} = "{fm["extra"][key]}"')
    
    # Related thinkers
    related = taxonomy.get("related", [])
    if related:
        for rel in related:
            fm_lines.append("\n[[extra.related]]")
            fm_lines.append(f'thinker = "{rel.get("thinker", "")}"')
            fm_lines.append(f'relationship = "{rel.get("relationship", "")}"')
            fm_lines.append(f'note = """{rel.get("note", "")}"""')
    
    fm_lines.append("+++\n")
    
    # Read examples content
    examples = ""
    if examples_path.exists():
        examples = examples_path.read_text()
    
    # Write thinker page
    thinker_page = thinkers_content / f"{slug}.md"
    with open(thinker_page, "w") as f:
        f.write("\n".join(fm_lines))
        f.write(examples)
    
    thinkers_meta[slug] = {
        "display_name": display_name,
        "families": family_list,
        "tagline": tagline,
        "tradition": tradition,
    }
    
    print(f"  ✓ {slug} → {display_name}")

# Create thinkers index
with open(thinkers_content / "_index.md", "w") as f:
    f.write("+++\n")
    f.write('title = "Thinkers"\n')
    f.write('template = "thinkers-list.html"\n')
    f.write("sort_by = \"title\"\n")
    f.write("page_template = \"thinker.html\"\n")
    f.write("+++\n")

# Create family pages
for family_name, family_desc in FAMILIES.items():
    family_slug = family_name.lower().replace(" ", "-").replace("&", "and")
    with open(families_content / f"{family_slug}.md", "w") as f:
        f.write("+++\n")
        f.write(f'title = "{family_name}"\n')
        f.write("+++\n\n")
        f.write(f"{family_desc}\n\n")
        f.write("## Thinkers\n\n")
        for slug, meta in thinkers_meta.items():
            if family_name in meta["families"]:
                f.write(f"- [{meta['display_name']}](/thinkers/{slug}/)\n")

# Create families index
with open(families_content / "_index.md", "w") as f:
    f.write("+++\n")
    f.write('title = "Families"\n')
    f.write("sort_by = \"title\"\n")
    f.write("+++\n")

# Create root index
with open(CONTENT_DIR / "_index.md", "w") as f:
    f.write("+++\n")
    f.write("+++\n")

print(f"\n  ✅ Generated {len(thinkers_meta)} thinkers + 5 families")
