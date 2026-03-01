# DeepSource Skills

A collection of [agent skills](https://agentskills.io) for working with DeepSource products. Skills are packaged instructions and scripts that extend AI coding agents with DeepSource capabilities.

## Available Skills

### [autofix-bot-api](skills/autofix-bot-api)

Scan repositories for security vulnerabilities, leaked secrets, and dependency issues using the [Autofix Bot API](https://autofix.bot), and auto-fix detected issues.

- **Use when:** you want to run a security scan on a repository or codebase using Autofix Bot
- **Use when:** you want to analyze code changes or pull requests for vulnerabilities
- **Use when:** you want to auto-fix security issues detected by Autofix Bot
- **Includes:** sync and polling scripts for automated workflows, full API reference

### [deepsource](skills/deepsource)

Retrieve code health data from DeepSource using the [DeepSource CLI](https://deepsource.com/cli) — issues, vulnerabilities, report cards, and analysis runs.

- **Use when:** you want to list code health issues, bugs, or security findings for a repository
- **Use when:** you want to check dependency vulnerabilities or CVE status
- **Use when:** you want to get code health grades, coverage metrics, or report cards
- **Use when:** you want to view analysis run history

## Installation

Install all skills:

```
npx skills add deepsource/skills
```

Install a specific skill:

```
npx skills add deepsource/skills -s autofix-bot-api
npx skills add deepsource/skills -s deepsource
```

Skills work with [18+ AI agents](https://skills.sh) including Claude Code, GitHub Copilot, Cursor, Cline, Codex, and more.

## Usage

Once installed, skills are automatically available to your AI agent. Just ask naturally:

- "Scan this repo for security vulnerabilities using Autofix Bot"
- "Run Autofix Bot on my latest changes and fix any issues"
- "Upload this repository to Autofix Bot and analyze it"
- "Show me the critical code issues in this repo"
- "Check for dependency vulnerabilities"
- "What's the report card for this repository?"

## Skill Structure

Each skill follows the [Agent Skills specification](https://agentskills.io/specification):

```
skill-name/
├── SKILL.md           # Instructions and metadata (required)
├── scripts/           # Executable helper scripts (optional)
├── references/        # Detailed reference documentation (optional)
└── assets/            # Static resources (optional)
```

## License

MIT
