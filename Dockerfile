# ── Stage 1: Build Flutter web ─────────────────────────────────────────────────
FROM ghcr.io/cirruslabs/flutter:stable AS builder

WORKDIR /app

# Copy project files
COPY tipss_web/ ./

# Fetch dependencies and build
RUN flutter pub get
RUN flutter build web --web-renderer html --release --no-tree-shake-icons

# ── Stage 2: Serve with Nginx ──────────────────────────────────────────────────
FROM nginx:alpine AS runner

# Remove default Nginx page
RUN rm -rf /usr/share/nginx/html/*

# Copy Flutter build output
COPY --from=builder /app/build/web /usr/share/nginx/html

# Copy our Nginx config
COPY deploy/nginx/tipss.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
