# Configuration Guide

## Overview

The SIN-Hermes-Complete installer orchestrates multiple bundles. This guide explains configuration for each component.

## Main Config Files

### ~/.hermes/config.yaml

This is the primary Hermes configuration file. It is managed by the bundles but you can customize it:

```yaml
# Provider Configuration
provider:
  name: custom:fireworks
  base_url: http://localhost:9998/inference/v1
  
# Pool Router Configuration
pool_router:
  port: 9998
  proxies:
    - port: 8888
    - port: 8889
    - port: 8890
    - port: 8891
    - port: 8892
    - port: 8893
    - port: 8894
    - port: 8895
    - port: 8896
    - port: 8897
```

### Bundle Configuration

Each bundle has its own config:

| Bundle | Config File | Location |
|--------|-------------|----------|
| Provider Bundle | fireworks-router.yaml | ~/.hermes/config.yaml |
| V15 Patches | config.yaml | ~/.hermes/config.yaml |
| SerpAPI Pool | serpapi-pool.yaml | ~/.hermes/scripts/ |
| Infisical | infisical.json | ~/.hermes/scripts/ |

## Provider Configuration

### Fireworks AI

```bash
# Add provider
hermes auth add custom:fireworks --type api-key --api-key "$FIREWORKS_AI_API_KEY"

# Verify
hermes auth list
```

### Pool Router

```bash
# Router config
export POOL_ROUTER_URL=http://localhost:9998

# Check health
curl $POOL_ROUTER_URL/health
```

## SerpAPI Configuration

### Key Pool

```bash
# Configure keys
~/.hermes/scripts/serpapi-pool.py setup

# Check status
~/.hermes/scripts/serpapi-pool.py status

# Rotate keys
~/.hermes/scripts/serpapi-pool.py rotate
```

### Search Backend

```yaml
# In ~/.hermes/config.yaml
search:
  backend: serpapi
  serpapi:
    pool_size: 4
    rotate_interval: 900
```

## Infisical Configuration

### Login

```bash
# Login to Infisical
infisical login

# Check status
infisical login status
```

### Secret Management

```bash
# Get secret
infisical-get.py <SECRET_NAME>

# List secrets
infisical-list.py
```

## Tool Search Configuration

### Pinned Tools

```yaml
# In ~/.hermes/config.yaml
tool_search:
  mode: auto
  threshold: 0.10
  pinned_tools:
    - tool_search
    - tool_details
    - execute_code
    - todo
    - web_search
    - read_file
    - write_file
    - skills_list
    - skill_view
    - skill_manage
    - browser_navigate
    - browser_snapshot
    - browser_click
    - browser_type
    - browser_scroll
    - browser_console
    - browser_press
    - browser_get_images
    - browser_vision
    - browser_back
```

## Advanced Configuration

### Custom Proxies

```bash
# Add custom proxy
export PROXY_PORT=8898
~/.hermes/scripts/pool-router.py add-proxy $PROXY_PORT
```

### Logging

```yaml
# In ~/.hermes/config.yaml
logging:
  level: INFO
  file: ~/.hermes/logs/hermes.log
```

### Auto-Start

```bash
# Enable auto-start
launchctl load ~/Library/LaunchAgents/com.sinator.pool-router.plist

# Disable auto-start
launchctl unload ~/Library/LaunchAgents/com.sinator.pool-router.plist
```

## Environment Variables

### Required

```bash
export FIREWORKS_AI_API_KEY="your-key"
export GITHUB_TOKEN="your-token"
export SERPAPI_KEY="your-key"
```

### Optional

```bash
export POOL_ROUTER_PORT=9998
export PROXY_COUNT=10
export LOG_LEVEL=INFO
```

## Troubleshooting

### Config not loading

```bash
# Validate config
hermes config validate

# Reset config
rm ~/.hermes/config.yaml
./install.sh
```

### Router not starting

```bash
# Check logs
tail -f ~/.hermes/logs/pool-router.log

# Restart
launchctl unload ~/Library/LaunchAgents/com.sinator.pool-router.plist
launchctl load ~/Library/LaunchAgents/com.sinator.pool-router.plist
```

## Migration

### From v1 to v2

```bash
# Backup
mv ~/.hermes/config.yaml ~/.hermes/config.yaml.bak

# Reinstall
./install.sh

# Verify
hermes config validate
```

---
*Last updated: 2026-05-30*
