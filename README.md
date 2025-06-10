# badNmap v1.0 "fckingWing"

## Advanced Network Security Suite

![badNmap Logo](https://img.shields.io/badge/badNmap-v1.0-red?style=for-the-badge&logo=security)
![Platform](https://img.shields.io/badge/Platform-Linux-purple?style=for-the-badge)
![Terminal](https://img.shields.io/badge/Terminal-Multi--Compatible-green?style=for-the-badge)

### 🔥 "Fly High!"

badNmap is a revolutionary network reconnaissance and security assessment framework designed for professional penetration testers and security researchers. This advanced nmap wrapper features an intuitive red/black themed interface with comprehensive attack modules and intelligent scanning capabilities.

## ✨ Features

### 🎯 Core Attack Modules
- **Lightning Network Scan** - Fast target identification and port scanning
- **Reconnaissance Engine** - Deep intelligence gathering and enumeration
- **Vulnerability Hunter** - Comprehensive security assessment and vuln detection
- **Phantom Stealth Operations** - Silent & evasive scanning techniques
- **Credential Breaker Suite** - Authentication testing and brute force attacks
- **Firewall Penetration Engine** - Advanced evasion and bypass techniques
- **Precision Port Scanner** - Custom port range scanning with timing control
- **Elite Intelligence Reports** - Professional report generation in multiple formats

### 🔍 Reconnaissance Capabilities
- Host Discovery (Network Sweep)
- Port Scanning & Service Detection
- Operating System Detection
- Service Version Enumeration
- Aggressive Discovery Scan
- UDP Service Discovery
- Network Topology Mapping

### 🛡️ Vulnerability Assessment
- SSL/TLS Security Assessment
- Web Application Vulnerabilities
- Database Security Scan
- Network Service Vulnerabilities
- SMB/NetBIOS Vulnerabilities
- Comprehensive Vulnerability Scan
- Custom Script Execution

### 👻 Phantom Stealth Operations
- SYN Stealth Scan
- FIN Stealth Scan
- NULL Stealth Scan
- XMAS Stealth Scan
- Idle Scan (Zombie)
- Fragmented Packets
- Decoy Scan

### 🔐 Credential Breaker Suite
- SSH Brute Force Attack
- FTP Authentication Testing
- HTTP Basic Auth Brute Force
- MySQL Database Brute Force
- SMB Share Authentication
- SNMP Community String Testing
- Default Credential Check

### 📊 Elite Intelligence Reports
- XML Format Reports
- HTML Format Reports
- Text Format Reports
- All Formats Generation
- Automated Report Opening

## 🛠️ Requirements

### System Requirements
- **OS**: Linux distributions (Kali Linux, Ubuntu, Debian, CentOS, Fedora, Arch, openSUSE)
- **Architecture**: x86_64
- **RAM**: Minimum 2GB
- **Storage**: 100MB free space
- **Network**: Active internet connection for dependency validation and auto-installation

### Dependencies
- `nmap` - Network exploration tool and scanning engine (auto-installed if missing)
- **Terminal Emulator** (auto-detected and installed):
  - `gnome-terminal` (preferred)
  - `konsole` (KDE)
  - `xfce4-terminal` (XFCE)
  - `mate-terminal` (MATE)
  - `lxterminal` (LXDE)
  - `terminator`
  - `xterm` (fallback)
  - `x-terminal-emulator` (system default)
- `firefox` - Web browser for report viewing (optional)
- `xsltproc` - XSLT processor for HTML report conversion
- Root privileges (required for raw socket operations)
- X11 graphical environment (DISPLAY variable must be set)
- Active internet connection for dependency validation

## 📦 Installation

### Automatic Installation (Recommended)
badNmap features intelligent auto-installation that detects your system and installs missing dependencies automatically.

```bash
# Download badNmap
git clone https://github.com/ahmadfathir/badnmap.git
cd badnmap

# Make executable
chmod +x badnmap.sh

# Run badNmap (dependencies will be auto-installed)
sudo ./badnmap.sh
```

## 🚀 Usage

### Basic Usage
```bash
# Run badNmap
sudo ./badnmap.sh
```

### Quick Examples

#### 1. Lightning Network Scan
- Select option `[01] LIGHTNING NETWORK SCAN`
- Enter target IP or hostname
- badNmap will perform a fast comprehensive port scan

#### 2. Vulnerability Hunter
- Select option `[03] VULNERABILITY HUNTER`
- Choose from SSL/TLS, Web Apps, Database, SMB, or Custom scripts
- Enter target and wait for vulnerability assessment results

#### 3. Phantom Stealth Operations
- Select option `[04] PHANTOM STEALTH OPERATIONS`
- Choose from SYN, FIN, NULL, XMAS, Idle, Fragmented, or Decoy scans
- Perfect for evading detection systems

#### 4. Elite Intelligence Reports
- Select option `[08] ELITE INTELLIGENCE REPORTS`
- Choose report format (XML, HTML, Text, or All Formats)
- Reports will be automatically saved in Reports/ folder


## 🔧 Advanced Configuration

### Automatic File Naming
badNmap automatically generates timestamped output files for all scans:
```bash
# Examples of auto-generated filenames:
lightning_scan_20241210_143052.txt
ssl_tls_security_20241210_143125.txt
ssh_bruteforce_20241210_143200.txt
stealth_syn_scan_20241210_143245.txt
```

### Custom Nmap Scripts
badNmap supports custom nmap script execution:
```bash
# In Vulnerability Hunter menu
# Choose option [07] Custom Script Execution
# Enter script name, example: http-sql-injection
```

### Output Directories
Scans are saved in the current working directory with descriptive names:
```bash
./
├── lightning_scan_YYYYMMDD_HHMMSS.txt
├── ssl_tls_security_YYYYMMDD_HHMMSS.txt
├── web_app_vuln_YYYYMMDD_HHMMSS.txt
├── syn_stealth_scan_YYYYMMDD_HHMMSS.txt
└── Reports/
    ├── custom_report.xml
    ├── custom_report.html
    └── custom_report.txt
```

## ⚠️ Legal Disclaimer

**IMPORTANT**: badNmap is developed for educational ONLY.

### ✅ Legal Usage
- Penetration testing on your own systems
- Authorized security assessments
- Educational and research purposes
- Bug bounty programs with proper authorization
- Security audits with written permission

### ❌ Illegal Usage
- Scanning systems without authorization
- Unauthorized access attempts
- Malicious activities
- Violation of laws and regulations

**Users are fully responsible for the use of this tool. Developers are not responsible for misuse.**

## 🏆 Credits & Acknowledgments

### Special Recognition
- **Nmap Development Team** - Gordon Lyon (Fyodor) for creating Nmap (https://nmap.org)
- **Security Research Community** - For continuous improvements and feedback
- **Offensive Security Team** - For Kali Linux and penetration testing methodologies
- **Kali Linux Development Team** - For the advanced security platform
- **Open Source Security Tools** - Metasploit Framework, OWASP Foundation

### Technical Features
badNmap incorporates advanced features including:
- **Multi-Distribution Support** - Auto-detection and installation across Linux distros
- **Terminal Compatibility** - Support for 8+ different terminal emulators
- **Intelligent Dependency Management** - Automatic detection and installation
- **Advanced Stealth Capabilities** - Multiple evasion techniques
- **Professional Reporting** - Multiple output formats with timestamping
- **User-Friendly Interface** - Intuitive menu system with comprehensive modules

## 📞 Support & Contact

### Get Help
- **Documentation**: Read this README thoroughly
- **Issues**: Report bugs through GitHub issues

### Stay Updated
- ⭐ Star the repository for updates
- 👁️ Watch for notifications
- 🍴 Fork for personal development

---

**badNmap v1.0 "fckingWing" - Advanced Network Security Suite! 🔥**

*Revolutionary Penetration Testing Framework*

*Developed with ❤️ by lalatx1 (github.com/ahmadfathir)*

**"Fly your damn wings!"**

---
