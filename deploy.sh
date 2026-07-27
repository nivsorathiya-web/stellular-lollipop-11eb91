#!/bin/zsh

# PDEU Timetable Deployment Script
# This script deploys your timetable portal to a free web hosting service.
# Once deployed, you will get a web link (URL) that you can share on WhatsApp.
# Clicking the link will open the portal in Safari (on iOS) or Chrome (on Android) automatically.

cd "$(dirname "$0")"

# Create a temporary index.html copy for web servers to locate the home page correctly
cp "CSBS custom timetable.html" index.html

echo "============================================="
echo "   PDEU Timetable Portal Deployment Wizard   "
echo "============================================="
echo ""
echo "Select your deployment method:"
echo "1) Surge (Fastest: ~10 seconds, setup email/pass directly in terminal)"
echo "2) Vercel (Premium: ~30 seconds, opens browser to login to Vercel)"
echo "3) Cancel"
echo ""
read -p "Enter choice [1-3]: " choice

case $choice in
    1)
        echo ""
        echo "Starting Surge deployment..."
        echo "If this is your first time, Surge will ask you to create a free account by entering an email and password."
        echo "Make sure to choose a unique domain (e.g., pdeu-timetable.surge.sh)."
        echo ""
        npx surge ./
        ;;
    2)
        echo ""
        echo "Starting Vercel deployment..."
        echo "Vercel will open a browser tab to log in/register. Once authenticated, just press enter to accept defaults."
        echo ""
        npx vercel --prod
        ;;
    *)
        echo "Deployment cancelled."
        ;;
esac

# Clean up temporary index.html file
rm -f index.html
