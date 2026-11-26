#!/bin/bash
# Linux Security & ANSSI Quick Audit Script by Wariboko Praise (@tellydrax)

REPORT="security_audit_$(date +%Y%m%d_%H%M%S).txt"

echo "==========================================" | tee "$REPORT"
echo "  LINUX SECURITY AUDIT - $(hostname)" | tee -a "$REPORT"
echo "  Date: $(date)" | tee -a "$REPORT"
echo "==========================================" | tee -a "$REPORT"

echo -e "\n[+] 1. Checking Root SSH Login..." | tee -a "$REPORT"
grep -i "^PermitRootLogin" /etc/ssh/sshd_config 2>/dev/null || echo "PermitRootLogin not explicitly set" | tee -a "$REPORT"

echo -e "\n[+] 2. Checking SSH Password Authentication..." | tee -a "$REPORT"
grep -i "^PasswordAuthentication" /etc/ssh/sshd_config 2>/dev/null || echo "PasswordAuthentication not explicitly set" | tee -a "$REPORT"

echo -e "\n[+] 3. Checking Firewall Status (UFW)..." | tee -a "$REPORT"
if command -v ufw >/dev/null 2>&1; then
    ufw status | tee -a "$REPORT"
else
    echo "UFW not installed" | tee -a "$REPORT"
fi

echo -e "\n[+] 4. Listing Open Listening Ports..." | tee -a "$REPORT"
ss -tulnp | tee -a "$REPORT"

echo -e "\n[+] 5. Checking Users with Root Privileges (UID 0)..." | tee -a "$REPORT"
awk -F: '($3 == "0") {print $1}' /etc/passwd | tee -a "$REPORT"

echo -e "\n[+] 6. Recent Failed SSH Login Attempts..." | tee -a "$REPORT"
grep "Failed password" /var/log/auth.log 2>/dev/null | tail -n 10 | tee -a "$REPORT"

echo -e "\n[✓] Audit complete. Report saved to $REPORT"
