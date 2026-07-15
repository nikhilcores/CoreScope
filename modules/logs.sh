#!/bin/bash

# ==========================================
# logs.sh - Log analysis module
# ==========================================

readonly AUTH_LOG="/var/log/auth.log"

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

    if [ "$failed" -gt 10 ] 2>/dev/null; then
        log_warn "High number of failed login attempts detected!"
    fi
}
