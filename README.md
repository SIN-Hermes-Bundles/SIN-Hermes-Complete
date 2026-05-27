# SIN-Hermes-Complete

**One-Command Meta-Installer for all SIN-Hermes-Bundles.**

Installiert alles was du brauchst fuer vollautonome HeyPiggy-Umfragen mit Hermes Agent.

## Quick Start

```bash
curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-Complete/main/install.sh | bash
```

## Repositories

| Repo | Zweck | Install |
|------|-------|---------|
| [SIN-Hermes-Provider-Bundle](https://github.com/SIN-Hermes-Bundles/SIN-Hermes-Provider-Bundle) | Fireworks Config + 412-Retry-Patch + max_turns | **Im Complete-Installer enthalten** |
| [SIN-Hermes-Browser-Skills-Bundle](https://github.com/SIN-Hermes-Bundles/SIN-Hermes-Browser-Skills-Bundle) | 13+ Hermes Skills fuer Surveys | **Im Complete-Installer enthalten** |

## Einzeln installieren

```bash
# Nur Provider
curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-Provider-Bundle/main/install.sh | bash

# Nur Skills
curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-Browser-Skills-Bundle/main/install.sh | bash
```

## Was der Installer macht

1. Fireworks Provider Config (`~/.hermes/config.yaml`)
2. 412 PRECONDITION_FAILED Retry Patch (`error_classifier.py`)
3. `max_turns=999999` (kein Iterations-Limit)
4. 22+ Hermes Skills nach `~/.hermes/skills/survey/`

## Auth

```bash
hermes auth add custom:fireworks --type api-key --api-key "$FIREWORKS_AI_API_KEY"
```

## SOP

Siehe [SIN-Hermes-Browser-Skills-Bundle/docs/survey-run.md](https://github.com/SIN-Hermes-Bundles/SIN-Hermes-Browser-Skills-Bundle/blob/main/docs/survey-run.md)

## Roadmap (weitere Bundles)

| Bundle | Status | Beschreibung |
|--------|--------|--------------|
| SIN-Hermes-Patches | **Geplant** | Core Hermes Patches (UA-Spoofing, run_agent.py Mods) |
| SIN-Hermes-Survey-CLI | **Geplant** | Standalone survey-cli (ex stealth-runner) |
| SIN-Hermes-Personas | **Geplant** | Persona-Datenbank + Lessons-Learned DB |
