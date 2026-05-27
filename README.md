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
| [SIN-Hermes-Provider-Bundle](https://github.com/SIN-Hermes-Bundles/SIN-Hermes-Provider-Bundle) | Pool-Router + 412-Retry + UA-Spoof + Config | **Im Complete-Installer enthalten** |
| [SIN-Hermes-Browser-Skills-Bundle](https://github.com/SIN-Hermes-Bundles/SIN-Hermes-Browser-Skills-Bundle) | 23+ Hermes Skills fuer Surveys | **Im Complete-Installer enthalten** |

## Pool-Router

Der Provider-Bundle installiert einen lokalen Router auf `localhost:9998`
mit Auto-Failover zwischen `sinatorpool1/2/3`. Kein manueller Pool-Wechsel mehr.

| Pool | Base URL | Prioritaet |
|------|----------|------------|
| **Pool 1** | `https://sinatorpool1.delqhi.com` | 1 (bevorzugt) |
| **Pool 2** | `https://sinatorpool2.delqhi.com` | 2 (Fallback) |
| **Pool 3** | `https://sinatorpool3.delqhi.com` | 3 (letzter Fallback) |

## Einzeln installieren

```bash
# Nur Provider (Router + Patches + Config)
curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-Provider-Bundle/main/install.sh | bash

# Nur Skills
curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-Browser-Skills-Bundle/main/install.sh | bash
```

## Was der Installer macht

1. **Pool Router** — `pool-router.py` auf `localhost:9998` mit Auto-Failover
2. **Fireworks Config** — `~/.hermes/config.yaml` mit Router-URL
3. **412 Retry Patch** — `error_classifier.py`
4. **UA-Spoof Patch** — `_ua_patch.py`
5. **Unlimited max_turns** — `999999`
6. **23+ Hermes Skills** — nach `~/.hermes/skills/survey/`

## Auth

```bash
hermes auth add custom:fireworks --type api-key --api-key "$FIREWORKS_AI_API_KEY"
```

## SOP

Siehe [SIN-Hermes-Browser-Skills-Bundle/docs/survey-run.md](https://github.com/SIN-Hermes-Bundles/SIN-Hermes-Browser-Skills-Bundle/blob/main/docs/survey-run.md)

## Roadmap (weitere Bundles)

| Bundle | Status | Beschreibung |
|--------|--------|--------------|
| SIN-Hermes-Patches | **Geplant** | Core Hermes Patches (run_agent.py Mods) |
| SIN-Hermes-Survey-CLI | **Geplant** | Standalone survey-cli (ex stealth-runner) |
| SIN-Hermes-Personas | **Geplant** | Persona-Datenbank + Lessons-Learned DB |
