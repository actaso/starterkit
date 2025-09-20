#!/bin/bash

# Update T3 Turbo template to latest version

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${BLUE}[UPDATE]${NC} $1"
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

print_status "Updating T3 Turbo template..."

# Check if we're in the right directory
if [ ! -d "template" ]; then
    print_error "Template directory not found. Make sure you're in the starter kit root."
    exit 1
fi

# Check for uncommitted changes
if ! git diff-index --quiet HEAD --; then
    print_warning "You have uncommitted changes. Please commit or stash them first."
    git status --porcelain
    exit 1
fi

# Update the subtree
print_status "Pulling latest changes from T3 Turbo..."
git subtree pull --prefix=template https://github.com/t3-oss/create-t3-turbo.git main --squash

print_success "Template updated successfully!"
print_status "You may want to:"
echo "  1. Test project generation with: ./scripts/create-project.sh test-project"
echo "  2. Review any conflicts or changes in the template/"
echo "  3. Update customizations if needed"
echo "  4. Commit the template update"
