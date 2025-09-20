#!/bin/bash

# Acta Studios Project Generator
# Based on T3 Turbo template with Acta customizations

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if project name is provided
if [ -z "$1" ]; then
    print_error "Please provide a project name"
    echo "Usage: ./scripts/create-project.sh <project-name>"
    exit 1
fi

PROJECT_NAME="$1"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STARTER_KIT_ROOT="$(dirname "$SCRIPT_DIR")"
TEMPLATE_DIR="$STARTER_KIT_ROOT/template"

# Check if template directory exists
if [ ! -d "$TEMPLATE_DIR" ]; then
    print_error "Template directory not found at $TEMPLATE_DIR"
    print_status "Run 'git subtree pull --prefix=template https://github.com/t3-oss/create-t3-turbo.git main --squash' to update the template"
    exit 1
fi

# Create project directory
if [ -d "$PROJECT_NAME" ]; then
    print_error "Directory '$PROJECT_NAME' already exists"
    exit 1
fi

print_status "Creating new project: $PROJECT_NAME"
print_status "Copying template from: $TEMPLATE_DIR"

# Copy template
cp -r "$TEMPLATE_DIR" "$PROJECT_NAME"
cd "$PROJECT_NAME"

print_status "Applying Acta customizations..."

# Remove git history from template
rm -rf .git

# Initialize new git repo
git init
git add .
git commit -m "Initial commit: Acta project based on T3 Turbo template"

# Apply Acta-specific customizations
"$SCRIPT_DIR/customize-template.sh"

print_success "Project '$PROJECT_NAME' created successfully!"
print_status "Next steps:"
echo "  1. cd $PROJECT_NAME"
echo "  2. Copy .env.example to .env and fill in your environment variables"
echo "  3. Run 'pnpm install' to install dependencies"
echo "  4. Run 'pnpm dev' to start development"
echo ""
print_status "Don't forget to:"
echo "  - Update the project name in package.json files"
echo "  - Configure your database connection"
echo "  - Set up your authentication provider"
echo "  - Review and update the README.md"
