# Acta Starter Kit

A customized project starter kit based on the [T3 Turbo](https://github.com/t3-oss/create-t3-turbo) template, tailored for Acta's development workflow and tech stack preferences.

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

## Getting Started
When starting on a new project, make sure you have the required nodejs version installed (using nvm) as well as pnpm version. Once done, follow the [T3 Turbo](https://github.com/t3-oss/create-t3-turbo) quick start. For the postgress provider we work with neon to allow easy branching and local tunnel for dev setup.

## Development Workflow

This starter kit follows Acta's development principles:

### Code Workflow
- **Dev Branch Integration** - All development work goes to `dev` branch
- **Main = Production** - `main` branch represents production-ready code
- **PR for Everything** - Always open PRs to `dev` for squash + merge
- **Regular Releases** - Promote `dev` to `main` every few days
- **Own Your Mistakes** - Be thorough and reliable
- **No Staging** - Local development, dev branch, or production

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

Built with ❤️ by Acta, based on the excellent [T3 Turbo](https://github.com/t3-oss/create-t3-turbo) template.
