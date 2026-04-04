#!/usr/bin/env bash
# =============================================================================
# Tipss – DigitalOcean Droplet First-Time Setup
# Run once as root on a fresh Ubuntu 22.04 / 24.04 droplet.
# Usage:  bash server-setup.sh
# =============================================================================
set -euo pipefail

DOMAIN="tipss.io"
WEB_ROOT="/var/www/tipss_web"
DEPLOY_USER="deploy"          # non-root user that GitHub Actions SSHs in as

echo "──────────────────────────────────────────"
echo " Tipss – Server Setup"
echo "──────────────────────────────────────────"

# 1 ── System update
apt-get update -y && apt-get upgrade -y

# 2 ── Install Nginx & Certbot
apt-get install -y nginx certbot python3-certbot-nginx ufw

# 3 ── Create deploy user (used by GitHub Actions)
if ! id "$DEPLOY_USER" &>/dev/null; then
  useradd -m -s /bin/bash "$DEPLOY_USER"
  echo "Created user: $DEPLOY_USER"
fi

# Give deploy user passwordless sudo for nginx reload only
echo "$DEPLOY_USER ALL=(ALL) NOPASSWD: /usr/bin/systemctl reload nginx, /usr/sbin/nginx -t" \
  > /etc/sudoers.d/deploy-nginx
chmod 440 /etc/sudoers.d/deploy-nginx

# 4 ── Set up web root
mkdir -p "$WEB_ROOT"
chown -R "$DEPLOY_USER":www-data "$WEB_ROOT"
chmod -R 755 "$WEB_ROOT"

# 5 ── Nginx site config
cp "$(dirname "$0")/nginx/tipss.conf" /etc/nginx/sites-available/tipss.conf
ln -sf /etc/nginx/sites-available/tipss.conf /etc/nginx/sites-enabled/tipss.conf
rm -f /etc/nginx/sites-enabled/default

nginx -t
systemctl enable nginx
systemctl restart nginx

# 6 ── Firewall: allow SSH, HTTP, HTTPS
ufw allow OpenSSH
ufw allow 'Nginx Full'
ufw --force enable

echo ""
echo "──────────────────────────────────────────"
echo " ✅ Base setup complete."
echo ""
echo " Next steps:"
echo "  1. Add the deploy user's SSH public key:"
echo "     mkdir -p /home/$DEPLOY_USER/.ssh"
echo "     echo '<YOUR_GITHUB_ACTIONS_PUBLIC_KEY>' >> /home/$DEPLOY_USER/.ssh/authorized_keys"
echo "     chmod 700 /home/$DEPLOY_USER/.ssh"
echo "     chmod 600 /home/$DEPLOY_USER/.ssh/authorized_keys"
echo "     chown -R $DEPLOY_USER:$DEPLOY_USER /home/$DEPLOY_USER/.ssh"
echo ""
echo "  2. Point your DNS A record for $DOMAIN to this server's IP."
echo ""
echo "  3. Issue an SSL certificate:"
echo "     certbot --nginx -d $DOMAIN -d www.$DOMAIN"
echo ""
echo "  4. Add these GitHub Actions secrets in your repo Settings → Secrets:"
echo "     DO_HOST  = <droplet IP or domain>"
echo "     DO_USER  = $DEPLOY_USER"
echo "     DO_SSH_KEY = <contents of the deploy user's private SSH key>"
echo "──────────────────────────────────────────"
