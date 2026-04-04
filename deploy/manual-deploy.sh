#!/usr/bin/env bash
# =============================================================================
# Tipss – Manual Deploy Script
# Run from your local machine to push a build directly to the droplet.
# Usage:  bash deploy/manual-deploy.sh <droplet-ip-or-domain>
# =============================================================================
set -euo pipefail

DROPLET="${1:-}"
DEPLOY_USER="deploy"
WEB_ROOT="/var/www/tipss_web"
LOCAL_BUILD="web/out"

if [[ -z "$DROPLET" ]]; then
  echo "Usage: bash deploy/manual-deploy.sh <droplet-ip-or-domain>"
  exit 1
fi

echo "▶ Building Next.js..."
cd web
npm install
npm run build
cd ..

echo "▶ Uploading to $DROPLET:$WEB_ROOT ..."
rsync -avz --delete \
  --exclude='.DS_Store' \
  "$LOCAL_BUILD/" \
  "$DEPLOY_USER@$DROPLET:$WEB_ROOT/"

echo "▶ Reloading Nginx..."
ssh "$DEPLOY_USER@$DROPLET" "sudo nginx -t && sudo systemctl reload nginx"

echo "✅ Deployed to http://$DROPLET"
