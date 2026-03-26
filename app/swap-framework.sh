#!/bin/bash
# Swap Flutter.framework between device and simulator (macOS 26 Tahoe workaround)

FLUTTER_DIR="ios/Flutter/Flutter.framework"
XCFW="$HOME/fvm/versions/3.35.3/bin/cache/artifacts/engine/ios/Flutter.xcframework"

case "${1:-}" in
  device|d)
    rm -rf "$FLUTTER_DIR"
    cp -R "$XCFW/ios-arm64/Flutter.framework" "$FLUTTER_DIR"
    echo "✓ Switched to DEVICE (arm64)"
    ;;
  sim|s)
    rm -rf "$FLUTTER_DIR"
    cp -R "$XCFW/ios-arm64_x86_64-simulator/Flutter.framework" "$FLUTTER_DIR"
    echo "✓ Switched to SIMULATOR (arm64_x86_64)"
    ;;
  *)
    echo "Usage: ./swap-framework.sh [device|sim]"
    echo "  device (d) — iPhone physique"
    echo "  sim    (s) — Simulateur iOS"
    ;;
esac
