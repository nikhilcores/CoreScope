<!-- ============================================================ -->
<!--                    SECTION 1: TITLE + BADGES                 -->
<!-- ============================================================ -->

<h1 align="center">
  <br>
  CoreScope
  <br>
</h1>

<h4 align="center">
  A Linux System Inspection & Log Analysis Toolkit
</h4>

<p align="center">
  <img src="https://img.shields.io/badge/Version-1.0.0-brightgreen.svg" alt="Version">
  <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="License">
  <img src="https://img.shields.io/badge/Language-Bash-orange.svg" alt="Language">
  <img src="https://img.shields.io/badge/Platform-Linux-lightgrey.svg" alt="Platform">
  <img src="https://img.shields.io/badge/Focus-Offensive%20Security-red.svg" alt="Focus">
</p>

<p align="center">
  <a href="#features">Features</a> •
  <a href="#installation">Installation</a> •
  <a href="#usage">Usage</a> •
  <a href="#configuration">Configuration</a> •
  <a href="#roadmap">Roadmap</a>
</p>

---

<!-- ============================================================ -->
<!--                    SECTION 2: ABOUT                          -->
<!-- ============================================================ -->

## About

CoreScope is a **fast, modular, and professional** Bash-based toolkit
designed for Linux system inspection and security analysis.

Whether you are a **system administrator** performing routine audits or
a **security professional** conducting post-exploitation enumeration,
CoreScope gives you a complete picture of a Linux system in seconds —
without running 20 different commands manually.

Built with clean engineering practices: modular design, centralized
configuration, graceful error handling, and zero external dependencies.

**Why CoreScope?**

- ⚡ Fast — results in under 60 seconds
- 🔧 Modular — easy to extend with new modules
- 🛡️ Safe — read-only, no system modifications
- 📄 Reportable — generates professional Markdown reports
- 🎯 Actionable — focused output, no information overload

---

<!-- ============================================================ -->
<!--                    SECTION 3: FEATURES                       -->
<!-- ============================================================ -->

## Features

### 🖥️ System Information
- Hostname, username, OS distribution, kernel version
- System architecture and uptime tracking

### 📊 Resource Monitoring
- CPU usage with configurable warning thresholds
- Memory utilization tracking
- Disk space analysis on root partition
- Color-coded alerts when thresholds are exceeded

### 🌐 Network Summary
- Active network interface detection
- Local IPv4 address retrieval
- Default gateway identification
- Graceful handling when no network is available

### 🔐 Security & Log Analysis
- Failed SSH login attempt counting
- Successful SSH login tracking
- Sudo command execution history
- Last system boot time
- Risk-based warnings for suspicious activity

### 📝 Report Generation
- Professional Markdown-formatted reports
- Timestamped filenames (no overwrites)
- Custom save location support
- Auto-creates target directories if missing

### 🎨 Professional Output
- Color-coded terminal output (info, success, warning, error)
- Interactive menu with input validation
- Graceful Ctrl+C handling
- Clean error messages (no cryptic crashes)

---

<!-- ============================================================ -->
<!--                    SECTION 4: REQUIREMENTS                   -->
<!-- ============================================================ -->

## Requirements

| Component | Requirement | Notes |
|-----------|-------------|-------|
| **OS** | Linux (Debian-based) | Tested on Kali Linux, Ubuntu, Debian |
| **Shell** | Bash 4.0+ | Bash 5.x recommended |
| **Tools** | awk, grep, ps, df, free | Included in most distributions |
| **Tools** | ip, hostname, uname | Standard Linux utilities |
| **Permissions** | Read access to /var/log/auth.log | May require sudo on some systems |

> ✅ No external dependencies required.
> All tools used are part of standard Linux installations.

---

<!-- ============================================================ -->
<!--                    SECTION 5: INSTALLATION                   -->
<!-- ============================================================ -->

## Installation

### Option 1: Clone from GitHub (Recommended)

```bash
# Clone the repository
git clone https://github.com/YOUR-USERNAME/CoreScope.git

# Navigate into project directory
cd CoreScope

# Make main script executable
chmod +x corescope.sh

./corescope.sh
