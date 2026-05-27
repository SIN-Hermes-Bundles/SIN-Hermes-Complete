#!/usr/bin/env bash
set -euo pipefail

echo "=========================================="
echo " SIN-Hermes-Complete Installer"
echo "=========================================="
echo ""

# --- Provider Bundle ---
echo "[1/2] Installing SIN-Hermes-Provider-Bundle..."
echo "       (Fireworks Config + 412 Retry Patch + max_turns)"
echo ""
curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-Provider-Bundle/main/install.sh | bash
echo ""

# --- Skills Bundle ---
echo "[2/2] Installing SIN-Hermes-Browser-Skills-Bundle..."
echo "       (13+ Hermes Agent Skills)"
echo ""
curl -fsSL https://raw.githubusercontent.com/SIN-Hermes-Bundles/SIN-Hermes-Browser-Skills-Bundle/main/install.sh | bash
echo ""

echo "=========================================="
echo " SIN-Hermes-Complete installed!"
echo "=========================================="
echo ""
echo "Next step:"
echo "  hermes auth add custom:fireworks --type api-key --api-key \"\$FIREWORKS_AI_API_KEY\""
echo "  hermes chat -q 'Oeffne heypiggy.com, starte Umfrage, beantworte alle Fragen.'"
echo ""
echo "Docs: https://github.com/SIN-Hermes-Bundles/SIN-Hermes-Browser-Skills-Bundle/blob/main/docs/survey-run.md"
