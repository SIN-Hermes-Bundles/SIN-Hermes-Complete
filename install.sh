#!/usr/bin/env bash
set -euo pipefail

echo "=========================================="
echo " SIN-Hermes-Complete Installer"
echo "=========================================="
echo ""

# --- Provider Bundle (Router + Patches) ---
echo "[1/3] Installing SIN-Hermes-Provider-Bundle..."
echo "       (Pool Router + 412 Patch + UA-Spoof + Config)"
echo ""
curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-Provider-Bundle/main/install.sh | bash
echo ""

# --- V15 Patches (Progressive Tool Loading + 413 Fix) ---
echo "[2/3] Installing SIN-Hermes-V15-Patches..."
echo "       (Progressive Tool Loading + 413 Compression Fix)"
echo ""
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
bash "$SCRIPT_DIR/install-patches.sh"
echo ""

# --- Skills Bundle ---
echo "[3/3] Installing SIN-Hermes-Browser-Skills-Bundle..."
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
echo "Optional: Google Workspace (Gmail/Drive/Calendar)"
echo "  curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-Google-Bundle/main/install.sh | bash"
echo ""
echo "Optional: WhatsApp Gateway (Bot-Modus, QR-Scan)"
echo "  curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-WhatsApp-Bundle/main/install.sh | bash"
echo ""
echo "Pool Router: localhost:9998 -> sinatorpool1/2/3 (auto-failover)"
echo ""
echo "Docs:"
echo "  Provider: https://github.com/SIN-Hermes-Bundles/SIN-Hermes-Provider-Bundle"
echo "  Skills:   https://github.com/SIN-Hermes-Bundles/SIN-Hermes-Browser-Skills-Bundle"
echo "  V15:      https://github.com/SIN-Rotator/SIN-Hermes-V15-Patches"
echo "  Google:   https://github.com/SIN-Hermes-Bundles/SIN-Hermes-Google-Bundle"
echo "  WhatsApp: https://github.com/SIN-Hermes-Bundles/SIN-Hermes-WhatsApp-Bundle"
echo ""
echo "Done!"
