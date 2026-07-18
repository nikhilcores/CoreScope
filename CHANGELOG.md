# Changelog

All notable changes to CoreScope project will be documented in this file.

## [1.0.0] - 2026-07-18

### Added
- Interactive terminal menu with 5 main features
- System Information module (hostname, OS, kernel, architecture, uptime)
- Resource Usage module (CPU, memory, disk monitoring with thresholds)
- Network Summary module (active interfaces, IP addresses, gateway)
- Log Analysis module (failed/successful SSH logins, sudo activity)
- Security Summary with risk-based warnings
- Markdown report generation with custom save location
- Colored terminal output (info, success, warning, error)
- Input validation for user choices
- Graceful error handling for missing files/commands
- Centralized configuration file for easy customization
- Ctrl+C handling for clean exit
- Dependency checking at startup

### Technical
- Modular Bash architecture with single responsibility principle
- Location-independent path handling (SCRIPT_DIR pattern)
- get_* and display_* function separation (data vs presentation)
- Professional logging functions with color codes
- Environment-agnostic design (works on Debian/Ubuntu/Kali)

### Requirements
- Linux (Debian/Ubuntu/Kali-based systems preferred)
- Bash 4+
- Standard utilities: awk, grep, ps, df, free, ip, hostname

## Future Roadmap

### v1.1 (Planned)
- Risk scoring system for findings
- Quick mode (--quick flag for 30-45 second enumeration)
- Environment detection (Docker, Kubernetes, AWS, Azure, GCP)

### v2.0 (Planned)
- Privilege escalation module
- Offensive security features
- JSON/CSV export formats
- Custom module system
