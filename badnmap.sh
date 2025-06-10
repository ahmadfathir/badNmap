#!/usr/bin/env bash

# ============================================================================================================
#                           badNmap - Network Intelligence Framework
#
#                           Next-Generation Reconnaissance Platform
#                           Author: lalatx1 (github.com/ahmadfathir)
#                          Optimized for Advanced Penetration Testing
#                 badNmap - Revolutionary Network Discovery and Threat Assessment
#                       Enhanced Multi-Layer Security Scanning Framework
#============================================================================================================

# Color definitions (Red and Black theme)
CRIM='\e[1;31m'        # Bright Red
GOLD='\e[0;31m'        # Red
CYAN='\e[1;37m'        # Bright White
LIME='\e[1;31m'        # Bright Red
PURPLE='\e[0;31m'      # Red
ORANGE='\e[1;31m'      # Bright Red
PINK='\e[0;31m'        # Red
TEAL='\e[1;37m'        # Bright White
SILVER='\e[0;37m'      # White
BLUE='\e[0;31m'        # Red
GREEN='\e[1;31m'       # Bright Red
RED='\e[1;31m'         # Bright Red
YELLOW='\e[0;31m'      # Red
WHITE='\e[1;37m'       # Bright White
GRAY='\e[0;90m'        # Dark Gray
BLACK='\e[0;30m'       # Black
RESET='\e[0m'          # Reset colors

# Version information
Version='1.0'
Codename='fckingWing'
# Deteksi terminal yang tersedia dan gunakan yang paling kompatibel
if command -v x-terminal-emulator >/dev/null 2>&1; then
    xterm='x-terminal-emulator -e nmap'
elif command -v gnome-terminal >/dev/null 2>&1; then
    xterm='gnome-terminal --wait --tab -- nmap'
elif command -v konsole >/dev/null 2>&1; then
    xterm='konsole --hold -e nmap'
elif command -v xfce4-terminal >/dev/null 2>&1; then
    xterm='xfce4-terminal --hold -e nmap'
elif command -v mate-terminal >/dev/null 2>&1; then
    xterm='mate-terminal --wait --tab -e nmap'
elif command -v lxterminal >/dev/null 2>&1; then
    xterm='lxterminal --command="nmap'
elif command -v terminator >/dev/null 2>&1; then
    xterm='terminator -x nmap'
elif command -v xterm >/dev/null 2>&1; then
    xterm='xterm -hold -e nmap'
else
    echo -e "\e[1;31mError: No compatible terminal emulator found!\e[0m"
    echo -e "\e[1;33mPlease install one of: gnome-terminal, konsole, xfce4-terminal, mate-terminal, lxterminal, terminator, or xterm\e[0m"
    exit 1
fi

# Trap Ctrl+C
trap ctrl_c INT
ctrl_c() {
    echo -e $RED"[*] (Ctrl + C) Detected, Shutting down badNmap..."
    sleep 1
    echo ""
    echo -e $YELLOW"[*] Thank You For Using badNmap =)."
    echo ""
    echo -e $GOLD"[*] Revolutionary Penetration Testing Framework!"
    exit
}

# Check if running as root
if [[ $EUID -ne 0 ]]; then
    echo "ERROR! badNmap requires root privileges!"
    exit 1
fi

# Check if X session is available
if [ -z "${DISPLAY:-}" ]; then
    echo -e "\e[1;31mbadNmap requires a graphical environment to run."$transparent""
    exit 1
fi

# Resize terminal
resize -s 50 84 > /dev/null


###############################################
# Checking dependencies
###############################################

echo -e $GOLD"═══════════════════════════════════════════════════════════════════════════════"
echo -e $GOLD"           (c) 2024 | Network Intelligence Framework | lalatx1"
echo -e $CYAN"       Author: lalatx1 (github.com/ahmadfathir) | Version 1.0 fckingWing"
echo -e $GOLD"═══════════════════════════════════════════════════════════════════════════════"
echo -e ""

if [ $(id -u) != "0" ]; then
    echo -e $RED"    [!] :: [Check Dependencies]"
    sleep 2
    echo -e $GREEN"    [✔] :: [Check User]: $USER"
    sleep 1
    echo -e $RED"    [✗] :: [not root]: you need to be [root] to run badNmap."
    echo ""
    sleep 1
    exit
else
    echo -e $CYAN"    [!] :: [Check Dependencies]"
    sleep 1
    echo -e $GREEN"    [✔] :: [Check User]: $USER"
fi

# Check internet connection
ping -c 1 google.com > /dev/null 2>&1
if [ "$?" != 0 ]; then
    echo -e $RED"    [✗] :: [Internet Connection]: FAILED!"
    echo -e $YELLOW"    [!] :: [warning]: badNmap requires an active internet connection"
    sleep 2
else
    echo -e $GREEN"    [✔] :: [Internet Connection]: connected!"
    sleep 2
fi

# Check nmap if exists
which nmap > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
    echo -e $GREEN"    [✔] :: [nmap]: installation found!"
else
    echo -e $RED"    [✗] :: [warning]: badNmap requires Nmap"
    echo ""
    echo -e $CYAN"    [!] :: [please wait]: installing nmap..."
    apt-get update
    apt-get install nmap
    echo ""
    sleep 2
    exit
fi
sleep 2

# Check for compatible terminal emulator
TERMINAL_FOUND=false
for terminal in x-terminal-emulator gnome-terminal konsole xfce4-terminal mate-terminal lxterminal terminator xterm; do
    if command -v "$terminal" >/dev/null 2>&1; then
        echo -e $GREEN"    [✔] :: [$terminal]: installation found!"
        TERMINAL_FOUND=true
        break
    fi
done

if [ "$TERMINAL_FOUND" = false ]; then
    echo -e $RED"    [✗] :: [warning]: badNmap requires a terminal emulator"
    echo ""
    echo -e $CYAN"    [!] :: [please wait]: installing compatible terminal..."
    # Coba install terminal yang paling umum berdasarkan distribusi
    if command -v apt-get >/dev/null 2>&1; then
        apt-get update && apt-get install -y gnome-terminal
    elif command -v yum >/dev/null 2>&1; then
        yum install -y gnome-terminal
    elif command -v dnf >/dev/null 2>&1; then
        dnf install -y gnome-terminal
    elif command -v pacman >/dev/null 2>&1; then
        pacman -S --noconfirm gnome-terminal
    elif command -v zypper >/dev/null 2>&1; then
        zypper install -y gnome-terminal
    else
        echo -e $RED"    [✗] :: Cannot auto-install terminal. Please install manually:"
        echo -e $YELLOW"           - Ubuntu/Debian: apt install gnome-terminal"
        echo -e $YELLOW"           - CentOS/RHEL: yum install gnome-terminal"
        echo -e $YELLOW"           - Fedora: dnf install gnome-terminal"
        echo -e $YELLOW"           - Arch: pacman -S gnome-terminal"
        echo -e $YELLOW"           - openSUSE: zypper install gnome-terminal"
        exit 1
    fi
    echo ""
    sleep 2
fi
sleep 2

################################################
# SCAN REPORTING FUNCTION
################################################
function scan_reports() {
    echo ""
    echo -e $RED"    ╔══════════════════════════════════════════════════════════════════╗"
    echo -e $RED"    ║                           badNmap Reports                        ║"
    echo -e $RED"    ║                     Generate Professional Reports                ║"
    echo -e $RED"    ╚══════════════════════════════════════════════════════════════════╝"
    echo ""
    echo -e $WHITE"        [$RED"01"$WHITE] Generate XML Report"
    echo -e $WHITE"        [$RED"02"$WHITE] Generate HTML Report"
    echo -e $WHITE"        [$RED"03"$WHITE] Generate Text Report"
    echo -e $WHITE"        [$RED"04"$WHITE] Generate All Formats"
    echo -e $WHITE"        [$RED"05"$WHITE] Return to Main Menu"
    echo ""
    echo -n -e $RED'    ┌─[badNmap@Reports]\n    └─▶ '$WHITE; tput sgr0
    read report_choice

    if test $report_choice == '1'; then
        echo ""
        echo -e $CYAN"    Report Location: /badNmap/Reports/"
        echo ""
        echo -ne $WHITE"    Report Name: "; tput sgr0
        read filename
        echo ""
        echo -ne $WHITE"    Target IP or Host: "; tput sgr0
        read ip
        echo ""
        mkdir -p Reports
        $xterm -A -O -oX Reports/$filename.xml $ip &
        firefox Reports/$filename.xml
    elif test $report_choice == '2'; then
        echo
        echo -ne $CYAN"  Report Location: /badNmap/Reports/"
        echo
        echo -ne "  Report Name:"
        read filename
        echo
        echo -ne "  Target IP or Host: "
        read ip
        echo
        mkdir -p Reports
        $xterm -A -O -oX Reports/$filename.xml $ip &
        xsltproc Reports/$filename.xml -o Reports/$filename.html
        firefox Reports/$filename.html
    elif test $report_choice == '3'; then
        echo
        echo -ne $CYAN"  Report Location: /badNmap/Reports/"
        echo
        echo -ne "  Report Name:"
        read filename
        echo
        echo -ne "  Target IP or Host: "
        read ip
        echo
        mkdir -p Reports
        $xterm -F -oN Reports/$filename.txt $ip
        nano Reports/$filename.txt
    elif test $report_choice == '4'; then
        echo
        echo -ne $CYAN"  Report Location: /badNmap/Reports/"
        echo
        echo -ne "  Report Name:"
        read filename
        echo
        echo -ne "  Target IP or Host: "
        read ip
        echo
        mkdir -p Reports
        $xterm -A -O -oA Reports/$filename $ip &
    elif test $report_choice == '5'; then
        main_menu
    else
        echo -e "  Invalid Selection"
    fi
    echo -n -e "  Return to Reports Menu? ( Yes / No ) :"
    read back
    if [ $back != 'n' ] && [ $back != 'N' ] && [ $back != 'no' ] && [ $back != 'No' ]; then
        main_menu
    elif [ $back != 'y' ] && [ $back != 'Y' ] && [ $back != 'yes' ] && [ $back != 'Yes' ]; then
        scan_reports
    fi
}

################################################
# STEALTH RECONNAISSANCE
################################################
function stealth_recon() {

    echo ""
    echo -e $RED"    ╔═══════════════════════════════════════════════════════════════════╗"
    echo -e $RED"    ║                      badNmap Stealth Operations                   ║"
    echo -e $RED"    ║                        Silent & Evasive Scans                     ║"
    echo -e $RED"    ╚═══════════════════════════════════════════════════════════════════╝"
    echo ""
    echo -e $WHITE"        [$RED"01"$WHITE] SYN Stealth Scan"
    echo -e $WHITE"        [$RED"02"$WHITE] FIN Stealth Scan"
    echo -e $WHITE"        [$RED"03"$WHITE] NULL Stealth Scan"
    echo -e $WHITE"        [$RED"04"$WHITE] XMAS Stealth Scan"
    echo -e $WHITE"        [$RED"05"$WHITE] Idle Scan (Zombie)"
    echo -e $WHITE"        [$RED"06"$WHITE] Fragmented Packets"
    echo -e $WHITE"        [$RED"07"$WHITE] Decoy Scan"
    echo -e $WHITE"        [$RED"08"$WHITE] Return to Main Menu"
    echo ""
    echo -n -e $RED'    ┌─[badNmap@Stealth]\n    └─▶ '$WHITE; tput sgr0
    read stealth_choice
    
    if test $stealth_choice == '1'; then
        echo ""
        echo -ne $WHITE"    Target IP or Host: "; tput sgr0
        read ip
        echo -e $CYAN"    [+] Running SYN Stealth Scan on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: syn_stealth_scan_$(date +%Y%m%d_%H%M%S).txt"
        nmap -sS -T4 $ip | tee syn_stealth_scan_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] SYN Stealth Scan completed!"
    elif test $stealth_choice == '2'; then
        echo ""
        echo -ne $WHITE"    Target IP or Host: "; tput sgr0
        read ip
        echo -e $CYAN"    [+] Running FIN Stealth Scan on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: fin_stealth_scan_$(date +%Y%m%d_%H%M%S).txt"
        nmap -sF -T4 $ip | tee fin_stealth_scan_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] FIN Stealth Scan completed!"
    elif test $stealth_choice == '3'; then
        echo ""
        echo -ne $WHITE"    Target IP or Host: "; tput sgr0
        read ip
        echo -e $CYAN"    [+] Running NULL Stealth Scan on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: null_stealth_scan_$(date +%Y%m%d_%H%M%S).txt"
        nmap -sN -T4 $ip | tee null_stealth_scan_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] NULL Stealth Scan completed!"
    elif test $stealth_choice == '4'; then
        echo ""
        echo -ne $WHITE"    Target IP or Host: "; tput sgr0
        read ip
        echo -e $CYAN"    [+] Running XMAS Stealth Scan on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: xmas_stealth_scan_$(date +%Y%m%d_%H%M%S).txt"
        nmap -sX -T4 $ip | tee xmas_stealth_scan_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] XMAS Stealth Scan completed!"
    elif test $stealth_choice == '5'; then
        echo ""
        echo -ne $WHITE"    Target IP or Host: "; tput sgr0
        read ip
        echo -ne $WHITE"    Zombie Host IP: "; tput sgr0
        read zombie
        echo -e $CYAN"    [+] Running Idle Scan (Zombie) on $ip using $zombie..."
        echo -e $WHITE"    [+] Results will be saved to: idle_scan_$(date +%Y%m%d_%H%M%S).txt"
        nmap -sI $zombie $ip | tee idle_scan_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] Idle Scan completed!"
    elif test $stealth_choice == '6'; then
        echo ""
        echo -ne $WHITE"    Target IP or Host: "; tput sgr0
        read ip
        echo -e $CYAN"    [+] Running Fragmented Packets Scan on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: fragmented_scan_$(date +%Y%m%d_%H%M%S).txt"
        nmap -f -T4 $ip | tee fragmented_scan_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] Fragmented Packets Scan completed!"
    elif test $stealth_choice == '7'; then
        echo ""
        echo -ne $WHITE"    Target IP or Host: "; tput sgr0
        read ip
        echo -ne $WHITE"    Decoy IPs (comma separated): "; tput sgr0
        read decoys
        echo -e $CYAN"    [+] Running Decoy Scan on $ip using decoys: $decoys..."
        echo -e $WHITE"    [+] Results will be saved to: decoy_scan_$(date +%Y%m%d_%H%M%S).txt"
        nmap -D $decoys -T4 $ip | tee decoy_scan_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] Decoy Scan completed!"
    elif test $stealth_choice == '8'; then
        main_menu
    else
        echo -e $RED"    Invalid selection"
    fi
    echo ""
    echo -n -e $WHITE"    Return to Main Menu? ( Yes / No ): "; tput sgr0
    read back
    if [ $back != 'n' ] && [ $back != 'N' ] && [ $back != 'no' ] && [ $back != 'No' ]; then
        main_menu
    elif [ $back != 'y' ] && [ $back != 'Y' ] && [ $back != 'yes' ] && [ $back != 'Yes' ]; then
        stealth_recon
    fi
}

################################################
# VULNERABILITY ASSESSMENT
################################################
function vuln_assessment() {
    echo
    echo -e $RED"    ╔═══════════════════════════════════════════════╗"
    echo -e $RED"    ║          badNmap Vulnerability Scanner        ║"
    echo -e $RED"    ║          Advanced Security Assessment         ║"
    echo -e $RED"    ╚═══════════════════════════════════════════════╝"
    echo
    echo -e $WHITE"\t[$RED"01"$WHITE]$WHITE  SSL/TLS Security Assessment"
    echo -e $WHITE"\t[$RED"02"$WHITE]$WHITE  Web Application Vulnerabilities"
    echo -e $WHITE"\t[$RED"03"$WHITE]$WHITE  Database Security Scan"
    echo -e $WHITE"\t[$RED"04"$WHITE]$WHITE  Network Service Vulnerabilities"
    echo -e $WHITE"\t[$RED"05"$WHITE]$WHITE  SMB/NetBIOS Vulnerabilities"
    echo -e $WHITE"\t[$RED"06"$WHITE]$WHITE  Comprehensive Vulnerability Scan"
    echo -e $WHITE"\t[$RED"07"$WHITE]$WHITE  Custom Script Execution"
    echo -e $WHITE"\t[$RED"08"$WHITE]$WHITE  Return to Main Menu"
    echo -e " "
    echo -n -e $RED'  \033[4mbadNmap@VulnScan:\033[0m>> '; tput sgr0
    read vuln_choice
    
    if test $vuln_choice == '1'; then
        echo
        echo -ne $WHITE " Target IP or Host: " ; tput sgr0
        read ip
        echo -e $CYAN"    [+] Running SSL/TLS Security Assessment on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: ssl_tls_security_$(date +%Y%m%d_%H%M%S).txt"
        nmap -p 443,8443 --script ssl-heartbleed,ssl-poodle,ssl-ccs-injection,ssl-dh-params,ssl-cert $ip | tee ssl_tls_security_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] SSL/TLS Security Assessment completed!"
    elif test $vuln_choice == '2'; then
        echo
        echo -ne $WHITE " Target IP or Host: " ; tput sgr0
        read ip
        echo -e $CYAN"    [+] Running Web Application Vulnerabilities scan on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: web_app_vuln_$(date +%Y%m%d_%H%M%S).txt"
        nmap -p 80,443,8080,8443 --script http-sql-injection,http-xss*,http-csrf,http-shellshock,http-enum $ip | tee web_app_vuln_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] Web Application Vulnerabilities scan completed!"
    elif test $vuln_choice == '3'; then
        echo
        echo -ne $WHITE " Target IP or Host: " ; tput sgr0
        read ip
        echo -e $CYAN"    [+] Running Database Security Scan on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: database_security_$(date +%Y%m%d_%H%M%S).txt"
        nmap -p 3306,1433,5432,1521 --script mysql-vuln*,ms-sql-*,pgsql-*,oracle-* $ip | tee database_security_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] Database Security Scan completed!"
    elif test $vuln_choice == '4'; then
        echo
        echo -ne $WHITE " Target IP or Host: " ; tput sgr0
        read ip
        echo -e $CYAN"    [+] Running Network Service Vulnerabilities scan on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: network_service_vuln_$(date +%Y%m%d_%H%M%S).txt"
        nmap --script vuln -sV $ip | tee network_service_vuln_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] Network Service Vulnerabilities scan completed!"
    elif test $vuln_choice == '5'; then
        echo
        echo -ne $WHITE " Target IP or Host: " ; tput sgr0
        read ip
        echo -e $CYAN"    [+] Running SMB/NetBIOS Vulnerabilities scan on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: smb_netbios_vuln_$(date +%Y%m%d_%H%M%S).txt"
        nmap -p 445,139 --script smb-vuln*,smb-enum* $ip | tee smb_netbios_vuln_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] SMB/NetBIOS Vulnerabilities scan completed!"
    elif test $vuln_choice == '6'; then
        echo
        echo -ne $WHITE " Target IP or Host: " ; tput sgr0
        read ip
        echo -e $CYAN"    [+] Running Comprehensive Vulnerability Scan on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: comprehensive_vuln_$(date +%Y%m%d_%H%M%S).txt"
        nmap -sC --script "default or (discovery and safe)" $ip | tee comprehensive_vuln_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] Comprehensive Vulnerability Scan completed!"
    elif test $vuln_choice == '7'; then
        echo
        echo -ne $WHITE " Target IP or Host: " ; tput sgr0
        read ip
        echo -ne $WHITE " Script Name: " ; tput sgr0
        read script_name
        echo -e $CYAN"    [+] Running Custom Script ($script_name) on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: custom_script_$(date +%Y%m%d_%H%M%S).txt"
        nmap --script $script_name $ip | tee custom_script_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] Custom Script execution completed!"
    elif test $vuln_choice == '8'; then
        main_menu
    else
        echo -e $okegreen " Invalid selection"
    fi
    
    echo ""
    echo -n -e $red " Return to Main Menu? ( Yes / No ) :"
    read back
    if [ $back != 'n' ] && [ $back != 'N' ] && [ $back != 'no' ] && [ $back != 'No' ]; then
        main_menu
    elif [ $back != 'y' ] && [ $back != 'Y' ] && [ $back != 'yes' ] && [ $back != 'Yes' ]; then
        vuln_assessment
    fi
}

################################################
# NETWORK RECONNAISSANCE
################################################
function network_recon() {
    echo -e $cyan " "
    echo -e $RED"    ╔═══════════════════════════════════════════════╗"
    echo -e $RED"    ║           badNmap Network Discovery           ║"
    echo -e $RED"    ║            Intelligence Gathering             ║"
    echo -e $RED"    ╚═══════════════════════════════════════════════╝"
    echo
    echo -e $WHITE"\t[$RED"01"$WHITE]$WHITE  Host Discovery (Network Sweep)"
    echo -e $WHITE"\t[$RED"02"$WHITE]$WHITE  Port Scanning & Service Detection"
    echo -e $WHITE"\t[$RED"03"$WHITE]$WHITE  Operating System Detection"
    echo -e $WHITE"\t[$RED"04"$WHITE]$WHITE  Service Version Enumeration"
    echo -e $WHITE"\t[$RED"05"$WHITE]$WHITE  Aggressive Discovery Scan"
    echo -e $WHITE"\t[$RED"06"$WHITE]$WHITE  UDP Service Discovery"
    echo -e $WHITE"\t[$RED"07"$WHITE]$WHITE  Network Topology Mapping"
    echo -e $WHITE"\t[$RED"08"$WHITE]$WHITE  Return to Main Menu"
    echo -e " "
    echo -n -e $red'  \033[4mbadNmap@Recon:\033[0m>> '; tput sgr0
    read recon_choice
    
    if test $recon_choice == '1'; then
        echo
        echo -ne $WHITE " Network Range (e.g., 192.168.1.0/24): " ; tput sgr0
        read network
        echo -e $CYAN"    [+] Running Host Discovery Scan on $network..."
        echo -e $WHITE"    [+] Results will be saved to: host_discovery_$(date +%Y%m%d_%H%M%S).txt"
        nmap -sn $network | tee host_discovery_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] Host Discovery Scan completed!"
    elif test $recon_choice == '2'; then
        echo
        echo -ne $WHITE " Target IP or Host: " ; tput sgr0
        read ip
        echo -e $CYAN"    [+] Running Port Scanning & Service Detection on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: port_service_scan_$(date +%Y%m%d_%H%M%S).txt"
        nmap -sS -sV -F $ip | tee port_service_scan_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] Port Scanning & Service Detection completed!"
    elif test $recon_choice == '3'; then
        echo
        echo -ne $WHITE " Target IP or Host: " ; tput sgr0
        read ip
        echo -e $CYAN"    [+] Running OS Detection Scan on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: os_detection_$(date +%Y%m%d_%H%M%S).txt"
        nmap -O --osscan-guess $ip | tee os_detection_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] OS Detection Scan completed!"
    elif test $recon_choice == '4'; then
        echo
        echo -ne $WHITE " Target IP or Host: " ; tput sgr0
        read ip
        echo -e $CYAN"    [+] Running Service Version Enumeration on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: service_version_$(date +%Y%m%d_%H%M%S).txt"
        nmap -sV --version-intensity 9 $ip | tee service_version_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] Service Version Enumeration completed!"
    elif test $recon_choice == '5'; then
        echo
        echo -ne $WHITE " Target IP or Host: " ; tput sgr0
        read ip
        echo -e $CYAN"    [+] Running Aggressive Discovery Scan on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: aggressive_scan_$(date +%Y%m%d_%H%M%S).txt"
        nmap -A -T4 $ip | tee aggressive_scan_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] Aggressive Discovery Scan completed!"
    elif test $recon_choice == '6'; then
        echo
        echo -ne $WHITE " Target IP or Host: " ; tput sgr0
        read ip
        echo -e $CYAN"    [+] Running UDP Service Discovery on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: udp_service_scan_$(date +%Y%m%d_%H%M%S).txt"
        nmap -sU --top-ports 1000 $ip | tee udp_service_scan_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] UDP Service Discovery completed!"
    elif test $recon_choice == '7'; then
        echo
        echo -ne $WHITE " Target IP or Host: " ; tput sgr0
        read ip
        echo -e $CYAN"    [+] Running Network Topology Mapping on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: topology_map_$(date +%Y%m%d_%H%M%S).txt"
        nmap --traceroute -sS $ip | tee topology_map_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] Network Topology Mapping completed!"
    elif test $recon_choice == '8'; then
        main_menu
    else
        echo -e $okegreen " Invalid selection"
    fi
    
    echo ""
    echo -n -e $red " Return to Main Menu? ( Yes / No ) :"
    read back
    if [ $back != 'n' ] && [ $back != 'N' ] && [ $back != 'no' ] && [ $back != 'No' ]; then
        main_menu
    elif [ $back != 'y' ] && [ $back != 'Y' ] && [ $back != 'yes' ] && [ $back != 'Yes' ]; then
        network_recon
    fi
}

################################################
# CREDENTIAL HUNTING
################################################
function credential_hunt() {
    echo
    echo -e $RED"    ╔═══════════════════════════════════════════════╗"
    echo -e $RED"    ║           badNmap Credential Hunter           ║"
    echo -e $RED"    ║            Authentication Testing             ║"
    echo -e $RED"    ╚═══════════════════════════════════════════════╝"
    echo
    echo -e $WHITE"\t[$RED"01"$WHITE]$WHITE  SSH Brute Force Attack"
    echo -e $WHITE"\t[$RED"02"$WHITE]$WHITE  FTP Authentication Testing"
    echo -e $WHITE"\t[$RED"03"$WHITE]$WHITE  HTTP Basic Auth Brute Force"
    echo -e $WHITE"\t[$RED"04"$WHITE]$WHITE  MySQL Database Brute Force"
    echo -e $WHITE"\t[$RED"05"$WHITE]$WHITE  SMB Share Authentication"
    echo -e $WHITE"\t[$RED"06"$WHITE]$WHITE  SNMP Community String Testing"
    echo -e $WHITE"\t[$RED"07"$WHITE]$WHITE  Default Credential Check"
    echo -e $WHITE"\t[$RED"08"$WHITE]$WHITE  Return to Main Menu"
    echo -e " "
    echo -n -e $red'  \033[4mbadNmap@CredHunt:\033[0m>> '; tput sgr0
    read cred_choice
    
    if test $cred_choice == '1'; then
        echo
        echo -ne $WHITE " Target IP or Host: " ; tput sgr0
        read ip
        echo -e $CYAN"    [+] Running SSH Brute Force Attack on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: ssh_bruteforce_$(date +%Y%m%d_%H%M%S).txt"
        nmap -p 22 --script ssh-brute $ip | tee ssh_bruteforce_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] SSH Brute Force Attack completed!"
    elif test $cred_choice == '2'; then
        echo
        echo -ne $WHITE " Target IP or Host: " ; tput sgr0
        read ip
        echo -e $CYAN"    [+] Running FTP Authentication Testing on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: ftp_bruteforce_$(date +%Y%m%d_%H%M%S).txt"
        nmap -p 21 --script ftp-brute $ip | tee ftp_bruteforce_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] FTP Authentication Testing completed!"
    elif test $cred_choice == '3'; then
        echo
        echo -ne $WHITE " Target IP or Host: " ; tput sgr0
        read ip
        echo -e $CYAN"    [+] Running HTTP Basic Auth Brute Force on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: http_bruteforce_$(date +%Y%m%d_%H%M%S).txt"
        nmap -p 80,443 --script http-brute $ip | tee http_bruteforce_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] HTTP Basic Auth Brute Force completed!"
    elif test $cred_choice == '4'; then
        echo
        echo -ne $WHITE " Target IP or Host: " ; tput sgr0
        read ip
        echo -e $CYAN"    [+] Running MySQL Database Brute Force on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: mysql_bruteforce_$(date +%Y%m%d_%H%M%S).txt"
        nmap -p 3306 --script mysql-brute $ip | tee mysql_bruteforce_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] MySQL Database Brute Force completed!"
    elif test $cred_choice == '5'; then
        echo
        echo -ne $WHITE " Target IP or Host: " ; tput sgr0
        read ip
        echo -e $CYAN"    [+] Running SMB Share Authentication on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: smb_bruteforce_$(date +%Y%m%d_%H%M%S).txt"
        nmap -p 445 --script smb-brute $ip | tee smb_bruteforce_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] SMB Share Authentication completed!"
    elif test $cred_choice == '6'; then
        echo
        echo -ne $WHITE " Target IP or Host: " ; tput sgr0
        read ip
        echo -e $CYAN"    [+] Running SNMP Community String Testing on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: snmp_bruteforce_$(date +%Y%m%d_%H%M%S).txt"
        nmap -sU -p 161 --script snmp-brute $ip | tee snmp_bruteforce_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] SNMP Community String Testing completed!"
    elif test $cred_choice == '7'; then
        echo
        echo -ne $WHITE " Target IP or Host: " ; tput sgr0
        read ip
        echo -e $CYAN"    [+] Running Default Credential Check on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: default_credentials_$(date +%Y%m%d_%H%M%S).txt"
        nmap --script http-default-accounts,ftp-anon,ssh-auth-methods $ip | tee default_credentials_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] Default Credential Check completed!"
    elif test $cred_choice == '8'; then
        main_menu
    else
        echo -e $okegreen " Invalid selection"
    fi
    
    echo ""
    echo -n -e $red " Return to Main Menu? ( Yes / No ) :"
    read back
    if [ $back != 'n' ] && [ $back != 'N' ] && [ $back != 'no' ] && [ $back != 'No' ]; then
        main_menu
    elif [ $back != 'y' ] && [ $back != 'Y' ] && [ $back != 'yes' ] && [ $back != 'Yes' ]; then
        credential_hunt
    fi
}

################################################
# CREDITS FUNCTION
################################################
function credits() {
    echo -e "
\033[31m##########################################################################\033[m
                             badNmap Credits
\033[31m##########################################################################\033[m"
    echo
    echo -e $white "Special Recognition:"
    echo
    echo -e $red "Nmap Development Team (https://nmap.org)"
    echo -e $okegreen "   - Gordon Lyon (Fyodor) for creating Nmap"
    echo
    echo -e $blue "Security Research Community"
    echo -e $cyan "   - Offensive Security Team"
    echo -e $yellow "   - Kali Linux Development Team"
    echo
    echo -e $purple "Open Source Security Tools"
    echo -e $magenta "   - Metasploit Framework"
    echo -e $green "   - OWASP Foundation"
    echo
    echo -e $red "══════════════════════════════════════════════════════════════"
    echo -e $yellow "badNmap v$Version \"$Codename\" - Fly High!"
    echo -e $red "══════════════════════════════════════════════════════════════"
    echo
}

###################################################
# MAIN MENU FUNCTION
#####################################################
function main_menu() {
    echo ""
    
    echo -e $RED"                   _               _     __                       "
    echo -e $RED"                  | |__   __ _  __| | /\ \ \_ __ ___   __ _ _ __  "
    echo -e $RED"                  | '_ \\ / _\` |/ _\` |/  \\/ / '_ \` _ \\ / _\` | '_ \\ "
    echo -e $RED"                  | |_) | (_| | (_| / /\  /| | | | | | (_| | |_) |"
    echo -e $RED"                  |_.__/ \__,_|\__,_\_\ \/ |_| |_| |_|\__,_| .__/ "
    echo -e $RED"                                                           |_|    "
    
    echo -e $RED"    ═══════════════════════════════════════════════════════════════════════════════"
    echo ""
    echo -e $RED"    ╔═════════════════════════════════════════════════════════════════════════════╗"
    echo -e $RED"    ║                           NETWORK RECONNAISSANCE                            ║"
    echo -e $RED"    ╚═════════════════════════════════════════════════════════════════════════════╝"
    echo ""
    echo -e $WHITE"        Framework       $WHITE: $RED Scanning Intelligence Platform"
    echo -e $WHITE"        Version         $WHITE: $RED 1.0 fckingWing"
    echo -e $WHITE"        Developer       $WHITE: $RED lalatx1 (github.com/ahmadfathir)"
    echo -e $WHITE"        Purpose         $WHITE: $RED Advanced Penetration Testing Framework"
    echo ""
    echo -e $RED"    ╔═════════════════════════════════════════════════════════════════════════════╗"
    echo -e $RED"    ║                              ATTACK MODULES                                 ║"
    echo -e $RED"    ╚═════════════════════════════════════════════════════════════════════════════╝"
    echo ""
    echo -e $WHITE"        [$RED"01"$WHITE] $WHITE LIGHTNING NETWORK SCAN"
    echo -e $WHITE"        [$RED"02"$WHITE] $WHITE RECONNAISSANCE ENGINE"
    echo -e $WHITE"        [$RED"03"$WHITE] $RED VULNERABILITY HUNTER"
    echo -e $WHITE"        [$RED"04"$WHITE] $WHITE PHANTOM STEALTH OPERATIONS"
    echo -e $WHITE"        [$RED"05"$WHITE] $RED CREDENTIAL BREAKER SUITE"
    echo -e $WHITE"        [$RED"06"$WHITE] $WHITE FIREWALL PENETRATION ENGINE"
    echo -e $WHITE"        [$RED"07"$WHITE] $RED PRECISION PORT SCANNER"
    echo -e $WHITE"        [$RED"08"$WHITE] $WHITE ELITE INTELLIGENCE REPORTS"
    echo -e $WHITE"        [$RED"09"$WHITE] $RED CREDITS"
    echo -e $WHITE"        [$RED"10"$WHITE] $WHITE SHUTDOWN badNmap"
    echo ""
    echo -e $RED"    ╔══════════════════════════════════════════════════════════════╗"
    echo -e $RED"    ║     ⚠️  WARNING: AUTHORIZED PENETRATION TESTING ONLY  ⚠️     ║"
    echo -e $RED"    ╚══════════════════════════════════════════════════════════════╝"
    echo ""
    echo -n -e $RED"    ┌─["$WHITE"lalatx1@badNmap"$RED"]─["$WHITE"~"$RED"]\n    └─▶ "$WHITE; tput sgr0
    read badNmap
    
    if test $badNmap == '1'; then
        echo ""
        echo -ne $WHITE"    Target IP or Host: "; tput sgr0
        read ip
        echo -e $CYAN"    [+] Running Lightning Network Scan on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: lightning_scan_$(date +%Y%m%d_%H%M%S).txt"
        nmap -F $ip | tee lightning_scan_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] Scan completed!"
    elif test $badNmap == '2'; then
        network_recon
    elif test $badNmap == '3'; then
        vuln_assessment
    elif test $badNmap == '4'; then
        stealth_recon
    elif test $badNmap == '5'; then
        credential_hunt
    elif test $badNmap == '6'; then
        echo ""
        echo -ne $WHITE"    Target IP or Host: "; tput sgr0
        read ip
        echo -e $CYAN"    [+] Running Firewall Penetration Engine on $ip..."
        echo -e $WHITE"    [+] Results will be saved to: firewall_penetration_$(date +%Y%m%d_%H%M%S).txt"
        nmap -f -D RND:10 -T4 $ip | tee firewall_penetration_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] Firewall Penetration Engine completed!"
    elif test $badNmap == '7'; then
        echo ""
        echo -ne $WHITE"    Target IP or Host: "; tput sgr0
        read ip
        echo -ne $WHITE"    Port Range (e.g., 1-65535): "; tput sgr0
        read ports
        echo -e $CYAN"    [+] Running Precision Port Scanner on $ip (ports: $ports)..."
        echo -e $WHITE"    [+] Results will be saved to: precision_port_scan_$(date +%Y%m%d_%H%M%S).txt"
        nmap -p $ports -T4 $ip | tee precision_port_scan_$(date +%Y%m%d_%H%M%S).txt
        echo -e $GREEN"    [✔] Precision Port Scanner completed!"
    elif test $badNmap == '8'; then
        scan_reports
    elif test $badNmap == '9'; then
        credits
    elif test $badNmap == '10'; then
        sleep 1
        echo ""
        echo -e $RED"    [*] Thank You For Using badNmap =)."
        echo ""
        echo -e $RED"    [*] Remember: Use responsibly and only on authorized targets."
        exit
    else
        echo -e $RED"    Invalid Selection"
    fi
    
    echo ""
    echo -n -e $WHITE"    Return to Main Menu? ( Yes / No ): "; tput sgr0
    read back
    if [ $back != 'n' ] && [ $back != 'N' ] && [ $back != 'no' ] && [ $back != 'No' ]; then
        main_menu
    elif [ $back != 'y' ] && [ $back != 'Y' ] && [ $back != 'yes' ] && [ $back != 'Yes' ]; then
        exit
    fi
}

####################################################
# MAIN EXECUTION START
####################################################

# Show startup banner
sleep 1

echo ""
echo -e $RED"    ╔═════════════════════════════════════════════════════════════════════════════╗"
echo -e $RED"    ║                                                                             ║"
echo -e $RED"    ║                                 badNmap v$Version                                ║"
echo -e $RED"    ║                                                                             ║"
echo -e $RED"    ║                        Advanced Network Security Suite                      ║"
echo -e $RED"    ║                                                                             ║"
echo -e $RED"    ║                                 'Fly High!'                                 ║"
echo -e $RED"    ║                                                                             ║"
echo -e $RED"    ╚═════════════════════════════════════════════════════════════════════════════╝"
echo ""
echo -e $WHITE"    [+] Initializing badNmap Security Suite..."
sleep 1
echo -e $RED"    [+] Loading reconnaissance modules..."
sleep 1
echo -e $WHITE"    [+] Activating stealth capabilities..."
sleep 1
echo -e $RED"    [+] badNmap is ready for operation!"
sleep 2

# Start main menu
main_menu

