# AGENTS.md

This file provides guidance to AI coding agents (Claude Code, Cursor, Copilot, etc.) when working with code in this repository.

## Repository Overview

A collection of [agent skills](https://agentskills.io) for working with DeepSource products. Skills are packaged instructions and scripts that extend AI agent capabilities with DeepSource integrations.

## Creating a New Skill

### Directory Structure

```
skills/
  {skill-name}/           # kebab-case directory name
    SKILL.md              # Required: skill definition
    scripts/              # Optional: executable scripts
    references/           # Optional: detailed reference documentation
    assets/               # Optional: static resources (templates, images, etc.)
```

### Naming Conventions

- **Skill directory**: `kebab-case` (e.g., `autofix-bot-api`, `code-health`)
- **SKILL.md**: Always uppercase, always this exact filename
- **Scripts**: `kebab-case.sh` or `snake_case.py` (e.g., `sync-repo.sh`, `poll_analysis.sh`)
- **Skill name must match directory name**

### SKILL.md Format

```markdown
---
name: {skill-name}
description: {What the skill does and when to use it. Include trigger phrases and specific scenarios. Max 1024 chars.}
---

# {Skill Title}

{Brief description of what the skill does.}

## Workflow

{Step-by-step instructions for using the skill}

## Key Patterns

{Important patterns, tips, and gotchas}

## API Reference

{Link to references/ files for detailed documentation}
```

### Best Practices for Context Efficiency

Skills are loaded on-demand — only the skill name and description are loaded at startup. The full `SKILL.md` loads into context only when the agent decides the skill is relevant. To minimize context usage:

- **Keep SKILL.md under 500 lines** — put detailed reference material in `references/`
- **Write specific descriptions** — helps the agent know exactly when to activate the skill
- **Use progressive disclosure** — reference supporting files that get read only when needed
- **Prefer scripts over inline code** — script execution doesn't consume context (only output does)
- **File references one level deep** — link directly from SKILL.md to supporting files, no nesting

### Script Requirements

- Use `#!/usr/bin/env bash` shebang for portability
- Use `set -euo pipefail` for fail-fast behavior
- Write status messages to stderr: `echo "Message" >&2`
- Write machine-readable output (JSON) to stdout where appropriate
- Include a cleanup trap for temp files
- Test scripts with `bash -n` for syntax validation before committing

### Spec Compliance

All skills must conform to the [Agent Skills specification](https://agentskills.io/specification):

- `name`: 1-64 chars, lowercase alphanumeric and hyphens only, no leading/trailing/consecutive hyphens
- `description`: 1-1024 chars, describes what the skill does and when to use it
- Name must match the parent directory name
- Optional fields: `license`, `compatibility`, `metadata`

### End-User Installation

Skills are installed via [skills.sh](https://skills.sh):

```bash
# Install all DeepSource skills
npx skills add deepsource/skills

# Install a specific skill
npx skills add deepsource/skills -s {skill-name}
```

Skills work with 18+ AI agents including Claude Code, GitHub Copilot, Cursor, Cline, Codex, and more.
