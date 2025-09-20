# Acta Studios Starter Kit

A customized project starter kit based on the [T3 Turbo](https://github.com/t3-oss/create-t3-turbo) template, tailored for Acta Studios' development workflow and tech stack preferences.

## What's Included

This starter kit provides a complete monorepo setup with:

### Core Stack
- **Next.js** - Web application with API routes
- **Expo** - React Native mobile apps
- **Tauri** - Native desktop apps (template ready)
- **tRPC** - End-to-end typesafe APIs
- **Tailwind CSS** - Utility-first CSS framework
- **shadcn/ui** - Beautiful, accessible components

### Acta-Specific Integrations
- **PostHog** - Product analytics and feature flags
- **BetterStack** - Error tracking and performance monitoring
- **Modal** - AI inference and serverless GPU compute
- **Neon** - Serverless PostgreSQL database
- **Mintlify** - Documentation platform
- **Clerk/BetterAuth** - Authentication solutions

### Development Tools
- **Turborepo** - High-performance build system
- **TypeScript** - Type safety across the entire stack
- **ESLint & Prettier** - Code formatting and linting
- **Changesets** - Version management and changelog generation

## Quick Start

### Create a New Project

```bash
# Clone this starter kit (if you haven't already)
git clone <your-starter-kit-repo> acta-starter-kit
cd acta-starter-kit

# Create a new project
./scripts/create-project.sh my-awesome-project

# Navigate to your new project
cd my-awesome-project

# Install dependencies
pnpm install

# Set up environment variables
cp .env.example .env
# Edit .env with your actual values

# Start development
pnpm dev
```

### What the Script Does

The `create-project.sh` script:
1. Copies the T3 Turbo template
2. Applies Acta-specific customizations
3. Sets up analytics, monitoring, and other integrations
4. Creates a clean git repository
5. Generates Acta-specific documentation

## Project Structure

```
my-awesome-project/
├── apps/
│   ├── expo/          # React Native mobile app
│   └── nextjs/        # Next.js web app + API
├── packages/
│   ├── analytics/     # PostHog integration (Acta custom)
│   ├── api/          # tRPC API definitions
│   ├── auth/         # Authentication logic
│   ├── db/           # Database schema and client
│   └── ui/           # Shared UI components
├── tooling/          # ESLint, TypeScript configs
└── scripts/          # Build and deployment scripts
```

## Development Workflow

This starter kit follows Acta's development principles:

### Code Workflow
- **Main = Production** - Everyone can push to main
- **PR for Everything** - Always open PRs for squash + merge
- **Own Your Mistakes** - Be thorough and reliable
- **No Staging** - Local development or production

### Task Management
- All work lives in Linear
- Use estimates (8=full day, 1=~1 hour)
- Self-assign issues
- Default to async solutions

### Quality Standards
- [ ] Code follows existing patterns
- [ ] Changes tested rigorously
- [ ] CHANGELOG.md updated
- [ ] Lints and builds pass

## Environment Setup

Copy `.env.example` to `.env` and configure:

```bash
# Database
POSTGRES_URL="postgresql://..."

# Authentication (choose one)
CLERK_SECRET_KEY="..."
# OR
BETTER_AUTH_SECRET="..."

# Analytics
NEXT_PUBLIC_POSTHOG_KEY="..."
NEXT_PUBLIC_POSTHOG_HOST="https://app.posthog.com"

# Monitoring
BETTERSTACK_TOKEN="..."

# AI/ML (if using Modal)
MODAL_TOKEN_ID="..."
MODAL_TOKEN_SECRET="..."
```

## Deployment

### Next.js (Vercel)
1. Connect your repo to Vercel
2. Set environment variables in dashboard
3. Deploy automatically on push to main

### Mobile (Expo)
```bash
# Configure EAS
cd apps/expo
eas build:configure

# Build for production
eas build --platform ios --profile production

# Submit to app stores
eas submit --platform ios --latest
```

### Desktop (Tauri)
```bash
# Build desktop app
cd apps/tauri
pnpm tauri build
```

## Updating the Template

To get the latest updates from T3 Turbo:

```bash
# From the starter kit root
git subtree pull --prefix=template https://github.com/t3-oss/create-t3-turbo.git main --squash
```

Then regenerate projects with the updated template.

## Customization

### Adding New Integrations
1. Update `scripts/customize-template.sh`
2. Add environment variables to `.env.example`
3. Create packages in `packages/` if needed
4. Update this README

### Modifying the Template
1. Make changes in the `template/` directory
2. Test with a new project generation
3. Commit changes to preserve customizations

## Support

- **Internal**: Check Acta's team workflow documentation
- **T3 Stack**: [T3 Turbo Documentation](https://turbo.t3.gg)
- **Issues**: Open issues in this starter kit repository

## Contributing

1. Follow Acta's development workflow
2. Update CHANGELOG.md with changes
3. Test project generation before merging
4. Keep customizations minimal and well-documented

---

Built with ❤️ by Acta Studios, based on the excellent [T3 Turbo](https://github.com/t3-oss/create-t3-turbo) template.
