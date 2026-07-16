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

show_menu() {
    echo "1) System Information"
    echo "2) Resource Usage"
    echo "3) Network Summary"
    echo "4) Security Summary (Log Analysis)"
    echo "5) Generate Report"
    echo "0) Exit"
    echo ""
    echo -n "Choose an option: "
}

main_menu() {
    local choice

    while true; do
        clear
        show_banner
        show_menu
        read -r choice

        if ! is_valid_choice "$choice" 0 5; then
            log_error "Invalid option. Please choose between 0-5."
            sleep 2
            continue
        fi

        case "$choice" in
            1)
                clear
                display_system_info
                ;;
            2)
                clear
                display_resource_usage
                ;;
            3)
                clear
                display_network_info
                ;;
            4)
                clear
                display_security_summary
                ;;
            5)
                clear
                generate_report
                ;;
            0)
                log_success "Exiting CoreScope. Goodbye!"
                exit 0
                ;;
        esac

        echo ""
        read -n 1 -s -r -p "Press any key to continue..."
    done
}

main_menu
