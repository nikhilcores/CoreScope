#!/bin/bash

# ==========================================
# network.sh - Network information module
# ==========================================

get_active_interface() {
    ip route get 1.1.1.1 2>/dev/null | awk '{print $5; exit}'
}

get_local_ip() {
    local iface
    iface=$(get_active_interface)

    if [ -n "$iface" ]; then
        ip -4 addr show "$iface" | grep -oP '(?<=inet\s)\d+(\.\d+){3}'
    else
        echo "Not available"
    fi
}

get_default_gateway() {
    ip route | grep default | awk '{print $3; exit}'
}

display_network_info() {
    local iface ip gateway

    iface=$(get_active_interface)
    ip=$(get_local_ip)
    gateway=$(get_default_gateway)

    if [ -z "$iface" ]; then
        log_warn "No active network interface detected"
        return
    fi

    log_info "Active Interface: $iface"
    log_info "Local IP Address: $ip"
    log_info "Default Gateway: $gateway"
}
