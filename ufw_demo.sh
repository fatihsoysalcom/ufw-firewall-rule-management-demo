#!/bin/bash

echo "--- UFW Firewall Configuration Demonstration ---"
echo "This script demonstrates common UFW commands for managing firewall rules."
echo "It will add, list, and then reset UFW rules. It does NOT permanently enable UFW."
echo "Requires 'sudo' privileges to run UFW commands."
echo ""

# Check if UFW is installed
if ! command -v ufw &> /dev/null
then
    echo "UFW is not installed. Please install it first (e.g., sudo apt install ufw)."
    exit 1
fi

echo "1. Current UFW Status (before any changes):"
sudo ufw status verbose
echo ""
read -p "Press Enter to continue..."

echo "2. Setting Default Policies (deny incoming, allow outgoing)."
echo "   These policies apply when UFW is enabled. They don't activate UFW immediately."
sudo ufw default deny incoming # Inline comment: Sets the default policy for incoming connections to deny
sudo ufw default allow outgoing # Inline comment: Sets the default policy for outgoing connections to allow
echo "   Default policies set."
echo ""
read -p "Press Enter to continue..."

echo "3. Adding Common Allow Rules:"
echo "   Allowing SSH (port 22/tcp)."
sudo ufw allow ssh # Inline comment: Allows incoming connections on the standard SSH port
echo "   Allowing HTTP (port 80/tcp)."
sudo ufw allow http # Inline comment: Allows incoming connections on the standard HTTP port
echo "   Allowing HTTPS (port 443/tcp)."
sudo ufw allow https # Inline comment: Allows incoming connections on the standard HTTPS port
echo "   Allow rules added."
echo ""
read -p "Press Enter to continue..."

echo "4. Adding a Deny Rule (example: deny Telnet on port 23/tcp):"
sudo ufw deny 23/tcp # Inline comment: Denies incoming connections on Telnet port 23
echo "   Deny rule for Telnet (23/tcp) added."
echo ""
read -p "Press Enter to continue..."

echo "5. Current UFW Rules (numbered list):"
echo "   Note: Rules are not active unless UFW is enabled."
sudo ufw status numbered # Inline comment: Displays UFW rules with numbers, useful for deletion
echo ""
read -p "Press Enter to continue..."

echo "6. Deleting a Rule (example: deleting the HTTP (80/tcp) allow rule)."
sudo ufw delete allow http # Inline comment: Deletes the previously added rule that allows HTTP
echo "   HTTP (80/tcp) allow rule deleted."
echo ""
read -p "Press Enter to continue..."

echo "7. Current UFW Rules after deletion:"
sudo ufw status numbered
echo ""
read -p "Press Enter to continue..."

echo "8. Resetting UFW to its initial state."
echo "   This will delete all rules and reset default policies."
sudo ufw reset -f # Inline comment: Resets UFW to its default, unconfigured state, removing all rules and policies
echo "   UFW has been reset."
echo ""
read -p "Press Enter to continue..."

echo "9. Final UFW Status (after reset):"
sudo ufw status verbose
echo ""

echo "--- UFW Demonstration Complete ---"
echo "Remember: To make UFW rules active, you must enable UFW with 'sudo ufw enable'."
echo "Be cautious when enabling UFW, especially on remote servers, to avoid locking yourself out."
