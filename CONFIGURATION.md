# Configuration — Hermes Agent: Permission-Free Mode

> **Ziel:** Hermes fragt NIE nach Bestätigung. Volle Automation. Null Allow-Klicks.

---

## 1. Config ändern (`~/.hermes/config.yaml`)

**`approvals.mode: auto`** — Hermes führt ALLE Aktionen sofort aus, keine Rückfragen.

```yaml
approvals:
  mode: auto
  timeout: 0
  cron_mode: auto
  mcp_reload_confirm: false
  destructive_slash_confirm: false

agent:
  max_turns: 999999
  max_iterations: 999999

delegation:
  subagent_auto_approve: true
```

**Effekt:**
| Vorher | Nachher |
|--------|---------|
| `"Tool X möchte … Allow/Deny?"` | **Stille Ausführung** |
| Cron-Jobs blockiert | Läuft durch |
| MCP-Reload bestätigen | Keine Unterbrechung |
| Subagent-Freigabe | Auto-approve |

---

## 2. CLI: `--yolo` (temporär)

Einmalig pro Session:

```bash
hermes chat --yolo
```

Bypasst alle "dangerous command approval prompts". Nicht persistent.

---

## 3. Vollautomation (Survey/Handy/Fernsteuerung)

Nach Config-Änderung Hermes neustarten:

```bash
hermes chat
# → nie wieder Allow-Fragen
```

---

## Troubleshooting

### Config wird ignoriert?
```bash
hermes config validate
hermes doctor
grep -A10 "approvals:" ~/.hermes/config.yaml
```

### Immer noch Allow?
`hermes status` zeigt ob `approvals.mode: auto` aktiv ist.
