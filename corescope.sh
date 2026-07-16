#!/bin/bash

# =============================================
# corescope.sh - Main entry point for CoreScope
# =============================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- Source all modules ---
source "$SCRIPT_DIR/modules/utils.sh"
source "$SCRIPT_DIR/modules/system.sh"
source "$SCRIPT_DIR/modules/network.sh"
source "$SCRIPT_DIR/modules/logs.sh"
source "$SCRIPT_DIR/modules/report.sh"

# --- Check dependencies before starting ---
if ! check_dependencies; then
    exit 1
fi

show_banner() {
    echo "=========================================="
    echo "         CoreScope v1.0"
    echo "  Linux System Inspection & Log Toolkit"
    echo "=========================================="
    echo ""
}
