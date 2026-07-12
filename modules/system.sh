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

# --- Resource Usage Functions ---

get_cpu_usage() {
    top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4"%"}'
}

get_memory_usage() {
    free -m | awk 'NR==2{printf "%.1f%%", $3*100/$2}'
}

get_disk_usage() {
    df -h / | awk 'NR==2{print $5}'
}

display_resource_usage() {
    local cpu mem disk

    cpu=$(get_cpu_usage)
    mem=$(get_memory_usage)
    disk=$(get_disk_usage)

    log_info "CPU Usage: $cpu"
    log_info "Memory Usage: $mem"
    log_info "Disk Usage: $disk"

    # Warning checks
    local cpu_num="${cpu%.*}"
    if [ "$cpu_num" -ge 80 ] 2>/dev/null; then
        log_warn "High CPU usage detected!"
    fi
}
