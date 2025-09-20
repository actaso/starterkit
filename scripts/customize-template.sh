#!/bin/bash

# Acta Studios Template Customization Script
# This script applies Acta-specific modifications to the T3 Turbo template

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${BLUE}[CUSTOMIZE]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_status "Applying Acta Studios customizations..."

# 1. Update package.json with Acta branding
if [ -f "package.json" ]; then
    print_status "Updating root package.json..."
    # You can use jq or sed to modify package.json
    # For now, we'll create a note for manual updates
fi

# 2. Add Acta-specific environment variables to .env.example
if [ -f ".env.example" ]; then
    print_status "Adding Acta-specific environment variables..."
    cat >> .env.example << 'EOF'

# Acta Studios specific configurations
# PostHog Analytics
NEXT_PUBLIC_POSTHOG_KEY=
NEXT_PUBLIC_POSTHOG_HOST=https://app.posthog.com

# BetterStack (Logtail)
BETTERSTACK_TOKEN=

# Modal for AI inference
MODAL_TOKEN_ID=
MODAL_TOKEN_SECRET=

# Neon Database (already configured above as POSTGRES_URL)
# POSTGRES_URL=

# Mintlify Docs (if using)
MINTLIFY_API_KEY=
EOF
fi

# 3. Create Acta-specific configuration files
print_status "Creating Acta configuration files..."

# PostHog configuration
mkdir -p "packages/analytics"
cat > "packages/analytics/package.json" << 'EOF'
{
  "name": "@acta/analytics",
  "version": "0.1.0",
  "private": true,
  "main": "./src/index.ts",
  "types": "./src/index.ts",
  "scripts": {
    "clean": "rm -rf .turbo node_modules",
    "lint": "eslint .",
    "type-check": "tsc --noEmit"
  },
  "dependencies": {
    "posthog-js": "^1.96.1",
    "posthog-node": "^3.6.3"
  },
  "devDependencies": {
    "@acta/eslint-config": "workspace:*",
    "@acta/typescript-config": "workspace:*",
    "eslint": "^8.57.0",
    "typescript": "^5.3.3"
  }
}
EOF

cat > "packages/analytics/src/index.ts" << 'EOF'
// PostHog Analytics Configuration for Acta Studios
export * from "./posthog";
EOF

cat > "packages/analytics/src/posthog.ts" << 'EOF'
import { PostHog } from "posthog-node";

// Server-side PostHog client
export const posthog = new PostHog(process.env.NEXT_PUBLIC_POSTHOG_KEY!, {
  host: process.env.NEXT_PUBLIC_POSTHOG_HOST || "https://app.posthog.com",
});

// Client-side PostHog configuration
export const posthogConfig = {
  api_host: process.env.NEXT_PUBLIC_POSTHOG_HOST || "https://app.posthog.com",
  loaded: (posthog: any) => {
    if (process.env.NODE_ENV === "development") posthog.debug();
  },
};
EOF

# 4. Add CHANGELOG.md template
print_status "Creating CHANGELOG.md template..."
cat > "CHANGELOG.md" << 'EOF'
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Initial project setup based on T3 Turbo template
- Acta Studios customizations and configurations

### Changed

### Deprecated

### Removed

### Fixed

### Security

## [0.1.0] - $(date +%Y-%m-%d)

### Added
- Initial release
- T3 Stack with Next.js, tRPC, Tailwind CSS
- Expo mobile app setup
- PostHog analytics integration
- BetterStack monitoring setup
- Neon database configuration
EOF

# 5. Update workspace configuration to include new packages
if [ -f "pnpm-workspace.yaml" ]; then
    print_status "Updating pnpm workspace configuration..."
    # Add analytics package to workspace if not already present
    if ! grep -q "packages/analytics" pnpm-workspace.yaml; then
        echo "  - \"packages/analytics\"" >> pnpm-workspace.yaml
    fi
fi

# 6. Create Acta-specific README additions
print_status "Creating Acta-specific documentation..."
cat > "ACTA_SETUP.md" << 'EOF'
# Acta Studios Project Setup

This project is based on the T3 Turbo template with Acta Studios customizations.

## Acta-Specific Features

### Analytics (PostHog)
- Configured for both client and server-side tracking
- Environment variables: `NEXT_PUBLIC_POSTHOG_KEY`, `NEXT_PUBLIC_POSTHOG_HOST`

### Monitoring (BetterStack)
- Integrated for error tracking and performance monitoring
- Environment variable: `BETTERSTACK_TOKEN`

### AI Inference (Modal)
- Ready for serverless GPU workloads
- Environment variables: `MODAL_TOKEN_ID`, `MODAL_TOKEN_SECRET`

### Database (Neon)
- PostgreSQL database with connection pooling
- Environment variable: `POSTGRES_URL`

## Development Workflow

Follow the Acta team workflow as defined in the starter kit:

1. All work lives in Linear
2. Use estimates (8=full day, 1=~1 hour)
3. Self-assign issues
4. Default to async solutions
5. Main = prod, everyone can push to main
6. Always open PRs for squash + merge
7. Update CHANGELOG.md with every merge

## Deployment

### Next.js (Vercel)
1. Connect your GitHub repo to Vercel
2. Set environment variables in Vercel dashboard
3. Deploy automatically on push to main

### Expo
1. Configure EAS Build: `eas build:configure`
2. Create production build: `eas build --platform ios --profile production`
3. Submit to app stores: `eas submit --platform ios --latest`

## Additional Tools

- **Docs**: Use Mintlify for documentation
- **Auth**: Configured for Clerk or BetterAuth
- **Styling**: Tailwind CSS with shadcn/ui components
EOF

print_success "Acta customizations applied successfully!"
print_status "Review ACTA_SETUP.md for Acta-specific configuration details"
