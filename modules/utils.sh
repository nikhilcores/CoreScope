#!/bin/bash

# ==========================================
# utils.sh - Shared helper functions for CoreScope
# ==========================================

# --- Color Codes ---
readonly COLOR_RED='\033[0;31m'
readonly COLOR_GREEN='\033[0;32m'
readonly COLOR_YELLOW='\033[0;33m'
readonly COLOR_BLUE='\033[0;34m'
readonly COLOR_RESET='\033[0m'

# --- Logging Functions ---

log_info() {
    echo -e "${COLOR_BLUE}[INFO]${COLOR_RESET} $1"
}

log_success() {
    echo -e "${COLOR_GREEN}[SUCCESS]${COLOR_RESET} $1"
}

log_warn() {
    echo -e "${COLOR_YELLOW}[WARNING]${COLOR_RESET} $1"
}

log_error() {
    echo -e "${COLOR_RED}[ERROR]${COLOR_RESET} $1"
}

# --- Dependency Checking ---

command_exists() {
    command -v "$1" &>/dev/null
}

check_dependencies() {
    local missing_deps=()
    local required_commands=("awk" "grep" "ps" "df" "free")

    for cmd in "${required_commands[@]}"; do
        if ! command_exists "$cmd"; then
            missing_deps+=("$cmd")
        fi
    done

    if [ ${#missing_deps[@]} -gt 0 ]; then
        log_error "Missing required commands: ${missing_deps[*]}"
        log_error "Please install these before running CoreScope."
        return 1
    fi

    return 0
}

# --- Input Validation ---

is_valid_choice() {
    local choice="$1"
    local min="$2"
    local max="$3"

    if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge "$min" ] && [ "$choice" -le "$max" ]; then
        return 0
    else
        return 1
    fi
}
