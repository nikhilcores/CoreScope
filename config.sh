#!/bin/bash

# ===============================================
# config.sh - Central configuration for CoreScope
# ===============================================

# --- Resource Usage Thresholds (percentage) ---
readonly CPU_WARN_THRESHOLD=80
readonly MEM_WARN_THRESHOLD=80
readonly DISK_WARN_THRESHOLD=90

# --- Security Thresholds ---
readonly FAILED_LOGIN_WARN_THRESHOLD=10

# --- Log File Paths ---
readonly AUTH_LOG="/var/log/auth.log"

# --- Report Settings ---
readonly REPORT_DATE_FORMAT="%Y-%m-%d_%H-%M-%S"
