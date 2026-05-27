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
| [SIN-Hermes-Browser-Skills-Bundle](https://github.com/SIN-Hermes-Bundles/SIN-Hermes-Browser-Skills-Bundle) | 22+ Hermes Skills fuer Surveys | **Im Complete-Installer enthalten** |

## Pool-Router

Der Provider-Bundle installiert einen lokalen Router auf `localhost:9998`
mit Auto-Failover zwischen `sinatorpool1/2/3`.

- **429 Rate Limit** -> sofort naechster Pool
- **412 Suspended** -> sofort naechster Pool
- **5xx Server Error** -> sofort naechster Pool
- **Auto-Start** via launchd (startet bei Login, restartet bei Crash)

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
3. **412 Retry Patch** — `error_classifier.py`: 412 + "suspended" -> `billing` + retryable
4. **UA-Spoof Patch** — `_ua_patch.py`: Chrome Mac User-Agent + `max_retries=0` (Router uebernimmt Retry)
5. **Unlimited max_turns** — `999999`
6. **22+ Hermes Skills** — nach `~/.hermes/skills/survey/`
7. **Provider-Setup-Skill** — `sin-hermes-provider-setup` im Provider-Bundle fuer neue Macs

## Auth

```bash
hermes auth add custom:fireworks --type api-key --api-key "$FIREWORKS_AI_API_KEY"
```

## SOP / Survey-Run-Guide

Siehe [SIN-Hermes-Browser-Skills-Bundle/docs/survey-run.md](https://github.com/SIN-Hermes-Bundles/SIN-Hermes-Browser-Skills-Bundle/blob/main/docs/survey-run.md)

## Neue Proxies hinzufuegen

Pool-Liste erweitern, Router neustarten:

```bash
# 1. Config editieren
~/.hermes/scripts/pool-router.py
# -> POOLS-Liste erweitern

# 2. Router neustarten (launchd managed)
launchctl unload ~/Library/LaunchAgents/com.sinhermes.poolrouter.plist
launchctl load ~/Library/LaunchAgents/com.sinhermes.poolrouter.plist

# ODER Hermes Skill sagen:
# "installiere provider bundle"
```

## Management

```bash
# Router laeuft?
pgrep -f pool-router.py

# Stoppen
launchctl unload ~/Library/LaunchAgents/com.sinhermes.poolrouter.plist

# Starten
launchctl load ~/Library/LaunchAgents/com.sinhermes.poolrouter.plist

# Logs
tail -f ~/.hermes/logs/pool-router.log
```

## Architektur

```
SIN-Hermes-Bundles (Org)
├── SIN-Hermes-Complete (Meta-Installer) <- Du bist hier
├── SIN-Hermes-Provider-Bundle
│   ├── Config (localhost:9998)
│   ├── Pool-Router (auto-failover)
│   ├── 412-Patch
│   ├── UA-Spoof (max_retries=0)
│   └── sin-hermes-provider-setup Skill
└── SIN-Hermes-Browser-Skills-Bundle
    └── 22+ Survey Skills (Browser-native)
```
