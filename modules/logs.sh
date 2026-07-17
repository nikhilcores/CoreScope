#!/bin/bash

# ==========================================
# logs.sh - Log analysis module
# ==========================================


get_failed_logins() {
    if [ -f "$AUTH_LOG" ]; then
        grep "Failed password" "$AUTH_LOG" 2>/dev/null | wc -l
    else
        echo "N/A"
    fi
}

get_successful_logins() {
    if [ -f "$AUTH_LOG" ]; then
        grep "Accepted password\|Accepted publickey" "$AUTH_LOG" 2>/dev/null | wc -l
    else
        echo "N/A"
    fi
}

display_login_summary() {
    if [ ! -f "$AUTH_LOG" ]; then
        log_warn "Auth log not found at $AUTH_LOG — skipping login analysis"
        return
    fi

    local failed successful
    failed=$(get_failed_logins)
    successful=$(get_successful_logins)

    log_info "Failed Login Attempts: $failed"
    log_info "Successful Logins: $successful"

    if [ "$failed" -gt "$FAILED_LOGIN_WARN_THRESHOLD" ] 2>/dev/null; then
        log_warn "High number of failed login attempts detected!"
    fi
}

# --- Sudo Activity ---

get_sudo_activity() {
    if [ -f "$AUTH_LOG" ]; then
        grep "sudo:" "$AUTH_LOG" 2>/dev/null | grep "COMMAND=" | wc -l
    else
        echo "N/A"
    fi
}

# --- Last Boot Time ---

get_last_boot() {
    who -b 2>/dev/null | awk '{print $3, $4}'
}

display_security_summary() {
    local failed successful sudo_count last_boot

    failed=$(get_failed_logins)
    successful=$(get_successful_logins)
    sudo_count=$(get_sudo_activity)
    last_boot=$(get_last_boot)

    log_info "===== Security Summary ====="
    log_info "Failed SSH Logins: $failed"
    log_info "Successful SSH Logins: $successful"
    log_info "Sudo Commands Executed: $sudo_count"
    log_info "Last Boot Time: $last_boot"

    if [ "$failed" -gt "$FAILED_LOGIN_WARN_THRESHOLD" ] 2>/dev/null; then
        log_warn "High number of failed login attempts — possible brute-force activity!"
    fi
}
