# INSTALL.md — SIN-Hermes-Complete

## Prerequisites

- macOS (Tested on macOS 14+)
- `bash` shell
- `curl` installed
- Hermes Agent (`pip install hermes-agent`)
- Optional: `infisical` CLI for secret management

## Installation

### Quick Start (One-Command)

```bash
curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-Complete/main/install.sh | bash
```

### Manual Step-by-Step

```bash
# 1. Clone repository
cd ~/dev
git clone https://github.com/SIN-Hermes-Bundles/SIN-Hermes-Complete.git
cd SIN-Hermes-Complete

# 2. Run installer
./install.sh
```

## What Gets Installed

| Step | Bundle | Purpose |
|------|--------|---------|
| 0 | SIN-Passwordmanager-Infisical-Bundle | API Keys + Secrets via Infisical (SSOT) |
| 1 | SIN-Hermes-Provider-Bundle | Pool Router + 412 Retry + UA-Spoof + Config |
| 2 | SIN-Hermes-V15-Patches | Progressive Tool Loading + 413 Compression Fix |
| 3 | SIN-Hermes-Websearch-SerpAPI-Pool-Bundle | 4 SerpAPI Keys, Round-Robin, 429-Fallback |
| 4 | SIN-Hermes-Browser-Skills-Bundle | 22+ Hermes Agent Skills |

## Verification

```bash
# Check Pool Router (via public endpoint)
curl -s https://sinatorpool-router.delqhi.com/inference/v1/models | python3 -m json.tool | head -20

# Check Hermes config
grep "tool_search" ~/.hermes/config.yaml

# List installed skills
ls ~/.hermes/skills/survey/

# Check SerpAPI pool
~/.hermes/scripts/serpapi-pool.py status
```

## Optional Bundles

```bash
# Google Workspace (Gmail/Drive/Calendar)
curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-Google-Bundle/main/install.sh | bash

# WhatsApp Gateway
curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-WhatsApp-Bundle/main/install.sh | bash

# TikTok Affiliate
curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-TikTok-Affiliate-Bundle/main/install.sh | bash

# AI Video Generator
curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-Replicate-Video-Bundle/main/install.sh | bash

# TikTok Intelligence
curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-TikTok-Intelligence-Bundle/main/install.sh | bash
```

## Post-Install

```bash
# Add Fireworks API key
hermes auth add custom:fireworks --type api-key --api-key "$FIREWORKS_AI_API_KEY"

# Verify provider
hermes model

# Test web search
hermes chat -Q -q "search web for latest news"
```

## Troubleshooting

### Pool Router not running
```bash
launchctl load ~/Library/LaunchAgents/com.sinator.pool-router.plist
```

### Missing skills
```bash
# Re-install skills bundle
curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-Browser-Skills-Bundle/main/install.sh | bash
```

### Config issues
```bash
# Reset config
curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-Provider-Bundle/main/config/fireworks-router.yaml -o ~/.hermes/config.yaml
```

---
*Last updated: 2026-05-30*
