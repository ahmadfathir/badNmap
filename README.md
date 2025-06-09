# badNmap v1.0 "fckingWing"

## Network Intelligence Framework

![badNmap Logo](https://img.shields.io/badge/badNmap-v1.0-red?style=for-the-badge&logo=security)
![Platform](https://img.shields.io/badge/Platform-Kali%20Linux-purple?style=for-the-badge)

### 🔥 "Fly High!"

badNmap is an advanced network reconnaissance and security assessment framework developed for professional penetration testers and security researchers. This tool serves as a revolutionary nmap wrapper with an intuitive red/black themed interface and comprehensive attack modules.

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
- **OS**: Kali Linux, Ubuntu, Parrot OS, or other Linux distributions
- **Architecture**: x86_64
- **RAM**: Minimum 2GB
- **Storage**: 100MB free space
- **Network**: Active internet connection for dependency validation

### Dependencies
- `nmap` - Network exploration tool and scanning engine
- `xterm` - Terminal emulator for scan execution
- `firefox` - Web browser for report viewing (optional)
- `xsltproc` - XSLT processor for HTML report conversion
- Root privileges (required for raw socket operations)
- X11 graphical environment
- Active internet connection for dependency validation

## 📦 Installation
### Manual Install
```bash
# Ensure dependencies are installed
sudo apt update
sudo apt install nmap xterm firefox xsltproc

# Download badNmap
git clone https://github.com/ahmadfathir/badnmap.git
cd badnmap

# Make executable
chmod +x badnmap.sh

# Run badNmap
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

## 🎛️ Menu Structure

```
badNmap Main Menu
├── [01] Lightning Network Scan
├── [02] Reconnaissance Engine
│   ├── Host Discovery (Network Sweep)
│   ├── Port Scanning & Service Detection
│   ├── Operating System Detection
│   ├── Service Version Enumeration
│   ├── Aggressive Discovery Scan
│   ├── UDP Service Discovery
│   └── Network Topology Mapping
├── [03] Vulnerability Hunter
│   ├── SSL/TLS Security Assessment
│   ├── Web Application Vulnerabilities
│   ├── Database Security Scan
│   ├── Network Service Vulnerabilities
│   ├── SMB/NetBIOS Vulnerabilities
│   ├── Comprehensive Vulnerability Scan
│   └── Custom Script Execution
├── [04] Phantom Stealth Operations
│   ├── SYN Stealth Scan
│   ├── FIN Stealth Scan
│   ├── NULL Stealth Scan
│   ├── XMAS Stealth Scan
│   ├── Idle Scan (Zombie)
│   ├── Fragmented Packets
│   └── Decoy Scan
├── [05] Credential Breaker Suite
│   ├── SSH Brute Force Attack
│   ├── FTP Authentication Testing
│   ├── HTTP Basic Auth Brute Force
│   ├── MySQL Database Brute Force
│   ├── SMB Share Authentication
│   ├── SNMP Community String Testing
│   └── Default Credential Check
├── [06] Firewall Penetration Engine
├── [07] Precision Port Scanner
├── [08] Elite Intelligence Reports
├── [09] Hall of Fame & Credits
└── [10] Shutdown badNmap
```

## 🔧 Advanced Configuration

### Custom Nmap Scripts
badNmap supports custom nmap script execution:
```bash
# In Vulnerability Hunter menu
# Choose option [07] Custom Script Execution
# Enter script name, example: http-sql-injection
```

### Output Directory
All scan reports are saved to:
```
./Reports/
├── scan_report.xml
├── scan_report.html
├── scan_report.txt
└── scan_report.grep
```

### Timing Templates
badNmap uses optimized timing templates:
- `-T4`: Aggressive timing (default for most scans)
- `-T3`: Normal timing
- `-T5`: Insane timing (very fast, may be detected)

### Stealth Features
badNmap includes advanced evasion techniques:
- Fragmented packet scanning
- Decoy host randomization
- Multiple stealth scan types (SYN, FIN, NULL, XMAS)
- Idle scan using zombie hosts

## ⚠️ Legal Disclaimer

**IMPORTANT**: badNmap is developed for educational and authorized penetration testing purposes ONLY.

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

## 🐛 Troubleshooting

### Common Issues

#### 1. Permission Denied
```bash
# Solution:
sudo chmod +x badnmap.sh
sudo ./badnmap.sh
```

#### 2. Dependencies Missing
```bash
# Install missing dependencies:
sudo apt update
sudo apt install nmap xterm firefox xsltproc
```

#### 3. Display Issues
```bash
# Ensure X11 forwarding if using SSH:
ssh -X username@hostname

# Or run in local graphical environment
# badNmap requires DISPLAY variable to be set
export DISPLAY=:0
```

#### 4. Nmap Not Found
```bash
# Install nmap:
sudo apt install nmap

# Verify installation:
which nmap
nmap --version
```

## 🤝 Contributing

We welcome contributions from the security community!

### How to Contribute
1. Fork the repository
2. Create a feature branch
3. Implement improvements
4. Test thoroughly
5. Submit a pull request

### Areas for Contribution
- New scanning modules
- Enhanced reporting features
- Performance optimizations
- Bug fixes
- Documentation improvements
- Translation to other languages


## 🏆 Credits & Acknowledgments

### Special Recognition
- **Nmap Development Team** - Gordon Lyon (Fyodor) for creating Nmap
- **Offensive Security Team** - For Kali Linux and security tools
- **Security Research Community** - For continuous improvements
- **Open Source Security Tools** - Metasploit, OWASP, and others

### Inspiration
badNmap is inspired by the need for reconnaissance tools that are:
- User-friendly yet powerful
- Comprehensive attack modules in one interface
- Professional reporting capabilities
- Advanced stealth and evasion techniques
- Educational for learning penetration testing

## 📞 Support & Contact

### Get Help
- **Documentation**: Read this README thoroughly
- **Issues**: Report bugs through GitHub issues
- **Security**: Report security issues privately

### Stay Updated
- ⭐ Star the repository for updates
- 👁️ Watch for notifications
- 🍴 Fork for personal development

---

**badNmap v1.0 "fckingWing" - Network Intelligence Framework! 🔥**

*Developed with ❤️ by lalatx1 (github.com/ahmadfathir)*

---
