#!/bin/bash

# ==========================================
# system.sh - System information module
# ==========================================

get_hostname() {
    hostname
}

get_username() {
    whoami
}

get_os_info() {
    if [ -f /etc/os-release ]; then
        grep "^PRETTY_NAME=" /etc/os-release | cut -d '"' -f2
    else
        echo "Unknown OS"
    fi
}

get_kernel_version() {
    uname -r
}

get_architecture() {
    uname -m
}

get_uptime() {
    uptime -p
}

# --- Display functions (with colors) ---

display_system_info() {
    log_info "Hostname: $(get_hostname)"
    log_info "User: $(get_username)"
    log_info "OS: $(get_os_info)"
    log_info "Kernel: $(get_kernel_version)"
    log_info "Architecture: $(get_architecture)"
    log_info "Uptime: $(get_uptime)"
}

