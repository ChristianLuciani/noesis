# MODEL_PARAMS.md — Vendor-Agnostic Model Configuration

NOESIS no硬编码a ningún modelo, provider, o API key. Este documento define las **capability tiers** requeridas para cada tipo de tarea, y cómo configurar el provider de tu elección.

## Principio BYOK (Bring Your Own Key)

NOESIS es agnóstico de proveedor. Todo contenido generado con LLMs debe ser posible con al menos uno de los siguientes providers:

- **OpenAI** (GPT-4o, GPT-4.1, o1, etc.)
- **Anthropic** (Claude Sonnet, Claude Opus, etc.)
- **Ollama** (local, modelos open-source)
- **LM Studio** (local, OpenAI-compatible API)
- **LiteLLM** (proxy unificado, OpenAI-compatible)

El repositorio nunca asume que tienes acceso a un modelo específico. Si una tarea requiere un tier de capacidad, puedes usar cualquier modelo que satisfaga ese tier.

---

## Capability Tiers

| Tier | Capacidades mínimas | Ejemplos (no exhaustivo, verifica availability) |
|------|-------------------|------------------------------------------------|
| **FAST** | ~8B+ params, sigue instrucciones, ventana ≥8K tokens, generación estructurada (JSON/TOML), determinístico a temperatura 0 | `gpt-4o-mini`, `claude-haiku`, `qwen2.5:7b`, `llama3.1:8b`, `deepseek-coder:6.7b` |
| **MID** | ~70B+ params o frontier-class pequeño, razonamiento multi-step, sigue especificaciones complejas, ventana ≥32K tokens | `gpt-4o`, `claude-sonnet-4`, `qwen2.5:32b`, `deepseek-chat`, `command-r-plus` |
| **STRONG** | Frontier-class, debugging sin repro explícito, diseño creativo con criterios implícitos, ventana ≥100K tokens | `gpt-4.1`, `claude-opus-4`, `deepseek-r1`, `o1` |

**Regla de cascada:** lo que puede hacer un tier más bajo, lo hace el tier más bajo. Solo escalar cuando el tier actual falle dos veces con la misma tarea.

---

## Variables de Entorno

Copia `.env.example` a `.env` y completa las variables para tu provider. NOESIS nunca lee valores hardcodeados.

```bash
# OpenAI
OPENAI_API_KEY=sk-...
OPENAI_BASE_URL=https://api.openai.com/v1

# Anthropic
ANTHROPIC_API_KEY=sk-ant-...

# Ollama (local)
OLLAMA_HOST=http://localhost:11434

# LM Studio (local, OpenAI-compatible)
LM_STUDIO_HOST=http://localhost:1234/v1

# LiteLLM (proxy unificado)
LITELLM_ENDPOINT=http://localhost:4000
LITELLM_MASTER_KEY=sk-...
```

### Configuración mínima

Necesitas **al menos uno** de estos funcionando:

| Si usas... | Variable(s) requerida(s) |
|-----------|------------------------|
| OpenAI | `OPENAI_API_KEY` |
| Anthropic | `ANTHROPIC_API_KEY` |
| Ollama | `OLLAMA_HOST` (default: `http://localhost:11434`) |
| LM Studio | `LM_STUDIO_HOST` (default: `http://localhost:1234/v1`) |
| LiteLLM | `LITELLM_ENDPOINT` + `LITELLM_MASTER_KEY` |

Para Ollama y LM Studio, puedes usar el endpoint OpenAI-compatible con `OPENAI_BASE_URL` apuntando a su host.

---

## Uso en scripts y prompts

Los scripts del repo (CI, build, council) referencian tiers, no modelos:

```bash
# ✅ CORRECTO: referencia al tier
./council/evaluate.sh --tier STRONG --thinker critical

# ❌ INCORRECTO: hardcodear modelo
./council/evaluate.sh --model claude-opus-4-20250514
```

Los prompts para contenido generado con LLM deben declarar el **tier mínimo sugerido**:

```markdown
> **model_tier:** MID — razonamiento multi-step desde especificación completa
```

---

## Verificación

Para verificar que tu configuración funciona:

```bash
 python scripts/check-models.py --tier FAST
# ✓ FAST tier OK (ollama/qwen2.5:7b @ http://localhost:11434)
```

---

## Notas

- Los ejemplos de modelos son ilustrativos y envejecerán. Verifica la disponibilidad actual de cada modelo con tu provider.
- Para Ollama: `ollama pull <model>` antes de usar.
- Para LM Studio: carga el modelo en la UI antes de usar el endpoint.
- LiteLLM ya maneja la cascada y routing — solo configura `LITELLM_ENDPOINT`.
- Ver [model-routing](../../.pi/agent/skills/model-routing/SKILL.md) para la política completa de cascada.
