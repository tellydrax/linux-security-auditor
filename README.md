# 🛡️ Linux Security & ANSSI Quick Auditor

A lightweight Bash security auditing tool designed to inspect Linux servers against core hardening guidelines (inspired by **ANSSI** recommendations) and generate a timestamped audit report.

## 🔍 Security Checks Performed
- **SSH Root Login (`PermitRootLogin`)**: Verifies whether direct root login over SSH is disabled.
- **SSH Password Authentication (`PasswordAuthentication`)**: Checks if key-based authentication is enforced.
- **Firewall Status (`UFW`)**: Audits active firewall state and filtering rules.
- **Open Listening Ports**: Enumerates active TCP/UDP network sockets and bound processes (`ss -tulnp`).
- **Privileged Accounts (`UID 0`)**: Identifies all local accounts with root-level privileges in `/etc/passwd`.
- **Brute-Force Detection**: Extracts the latest failed SSH authentication attempts from `/var/log/auth.log`.

## 🚀 Usage

    git clone https://github.com/tellydrax/linux-security-auditor.git
    cd linux-security-auditor
    chmod +x audit.sh
    sudo ./audit.sh

The script outputs results directly in the terminal and saves a timestamped report (`security_audit_YYYYMMDD_HHMMSS.txt`).

## 👤 Author
**Wariboko Praise** ([@tellydrax](https://github.com/tellydrax)) — Bachelor 3 Cybersécurité & Réseaux | [Portfolio](https://tellydrax.github.io)
