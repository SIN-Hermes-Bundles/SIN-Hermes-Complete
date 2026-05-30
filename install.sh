#!/usr/bin/env bash
set -euo pipefail

echo "=========================================="
echo " SIN-Hermes-Complete Installer"
echo "=========================================="
echo ""

# --- Infisical Password Manager (Secrets SSOT) ---
echo "[0/5] Installing SIN-Passwordmanager-Infisical-Bundle..."
echo "       (API-Key + Secret-Verwaltung via Infisical)"
echo ""
if command -v infisical &>/dev/null && infisical login status &>/dev/null; then
  curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-Passwordmanager-Infisical-Bundle/main/install.sh 2>/dev/null | bash || echo "   ⚠️  Passwordmanager skipped (kein Repo-Zugriff?)"
else
  echo "   ⏭️  Infisical nicht verfuegbar — Passwordmanager uebersprungen"
fi
echo ""

# --- Provider Bundle (Router + Patches) ---
echo "[1/5] Installing SIN-Hermes-Provider-Bundle..."
echo "       (Pool Router + 412 Patch + UA-Spoof + Config)"
echo ""
curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-Provider-Bundle/main/install.sh | bash
echo ""

# --- V15 Patches (Progressive Tool Loading + 413 Fix) ---
echo "[2/5] Installing SIN-Hermes-V15-Patches..."
echo "       (Progressive Tool Loading + 413 Compression Fix)"
echo ""
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
bash "$SCRIPT_DIR/install-patches.sh"
echo ""

# --- SerpAPI Web Search Pool ---
echo "[3/5] Installing SIN-Hermes-Websearch-SerpAPI-Pool-Bundle..."
echo "       (4 SerpAPI Keys, Round-Robin, 429-Fallback)"
echo ""
curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-Websearch-SerpAPI-Pool-Bundle/main/install.sh 2>/dev/null | bash || echo "   ⚠️  SerpAPI-Bundle skipped (privat? dann manuell)"
echo ""

# --- Skills Bundle ---
echo "[4/5] Installing SIN-Hermes-Browser-Skills-Bundle..."
echo "       (22+ Hermes Agent Skills)"
echo ""
curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-Browser-Skills-Bundle/main/install.sh | bash
echo ""

echo "=========================================="
echo " SIN-Hermes-Complete installed!"
echo "=========================================="
echo ""
echo "Next step:"
echo "  hermes auth add custom:fireworks --type api-key --api-key \"\$FIREWORKS_AI_API_KEY\""
echo ""
echo "Optional:"
echo "  Google:     curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-Google-Bundle/main/install.sh | bash"
echo "  WhatsApp:   curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-WhatsApp-Bundle/main/install.sh | bash"
echo "  TikTok Aff: curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-TikTok-Affiliate-Bundle/main/install.sh | bash"
echo "  Video Gen:  curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-Replicate-Video-Bundle/main/install.sh | bash"
echo "  TikTok Int: curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-TikTok-Intelligence-Bundle/main/install.sh | bash"
echo ""
echo "Pool Router: sinatorpool-router.delqhi.com -> 10 Proxys (auto-failover)"
echo "Secrets:     ~/.hermes/scripts/infisical-get.py <KEY>"
echo "SerpAPI:     ~/.hermes/scripts/serpapi-pool.py rotate"
echo ""
echo "Docs:"
echo "  Provider:  https://github.com/SIN-Hermes-Bundles/SIN-Hermes-Provider-Bundle"
echo "  Skills:    https://github.com/SIN-Hermes-Bundles/SIN-Hermes-Browser-Skills-Bundle"
echo "  V15:       https://github.com/SIN-Rotator/SIN-Hermes-V15-Patches"
echo "  Google:    https://github.com/SIN-Hermes-Bundles/SIN-Hermes-Google-Bundle"
echo "  WhatsApp:  https://github.com/SIN-Hermes-Bundles/SIN-Hermes-WhatsApp-Bundle"
echo "  SerpAPI:   https://github.com/SIN-Hermes-Bundles/SIN-Hermes-Websearch-SerpAPI-Pool-Bundle"
echo "  Infisical: https://github.com/SIN-Hermes-Bundles/SIN-Passwordmanager-Infisical-Bundle"
echo ""
echo "Done!"
