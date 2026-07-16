#!/bin/bash

# ==========================================
# report.sh - Report generation module
# ==========================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly REPORTS_DIR="$SCRIPT_DIR/../reports"

generate_report() {
    local timestamp
    timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

    local report_file="${REPORTS_DIR}/report-${timestamp}.md"

    if [ ! -d "$REPORTS_DIR" ]; then
        log_error "Reports directory not found: $REPORTS_DIR"
        return 1
    fi

    {
        echo "# CoreScope Security Report"
        echo ""
        echo "**Generated:** $(date +"%Y-%m-%d %H:%M:%S")"
        echo "**Hostname:** $(get_hostname)"
        echo ""
        echo "## System Information"
        echo "- OS: $(get_os_info)"
        echo "- Kernel: $(get_kernel_version)"
        echo "- Architecture: $(get_architecture)"
        echo "- Uptime: $(get_uptime)"
        echo ""
        echo "## Resource Usage"
        echo "- CPU Usage: $(get_cpu_usage)"
        echo "- Memory Usage: $(get_memory_usage)"
        echo "- Disk Usage: $(get_disk_usage)"
        echo ""
        echo "## Network Summary"
        echo "- Active Interface: $(get_active_interface)"
        echo "- Local IP: $(get_local_ip)"
        echo "- Default Gateway: $(get_default_gateway)"
        echo ""
        echo "## Security Summary"
        echo "- Failed SSH Logins: $(get_failed_logins)"
        echo "- Successful SSH Logins: $(get_successful_logins)"
        echo "- Sudo Commands Executed: $(get_sudo_activity)"
        echo "- Last Boot Time: $(get_last_boot)"
    } > "$report_file"

    log_success "Report generated: $report_file"
}
