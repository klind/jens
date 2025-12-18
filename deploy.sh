#!/bin/bash

# Toemrer Justesen Website Deployment Script
# This script uploads the website files to S3 and invalidates CloudFront cache

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
S3_BUCKET="toemrerjustesen-prod-website"
CLOUDFRONT_DISTRIBUTION_ID="EMY9JM5WARPC9"

echo -e "${BLUE}Toemrer Justesen Website Deployment${NC}"
echo "=========================================="

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo -e "${RED}AWS CLI is not installed. Please install it first.${NC}"
    exit 1
fi

# Check if we're in the right directory
if [ ! -f "index.html" ]; then
    echo -e "${RED}index.html not found. Please run this script from the jens directory.${NC}"
    exit 1
fi

echo -e "${YELLOW}Uploading website files to S3...${NC}"

# Upload website files to S3 (excluding markdown docs and git)
aws s3 sync . s3://$S3_BUCKET \
    --exclude '*' \
    --include 'index.html' \
    --include 'styles.css' \
    --include 'script.js' \
    --include 'BingSiteAuth.xml' \
    --include 'images/*' \
    --delete

if [ $? -eq 0 ]; then
    echo -e "${GREEN}Website files uploaded successfully!${NC}"
else
    echo -e "${RED}Failed to upload website files${NC}"
    exit 1
fi

# Only invalidate CloudFront if distribution ID is set
if [ "$CLOUDFRONT_DISTRIBUTION_ID" != "YOUR_DISTRIBUTION_ID" ]; then
    echo -e "${YELLOW}Invalidating CloudFront cache...${NC}"

    aws cloudfront create-invalidation \
        --distribution-id $CLOUDFRONT_DISTRIBUTION_ID \
        --paths "/*" \
        --output text > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}CloudFront cache invalidation initiated!${NC}"
    else
        echo -e "${RED}Failed to invalidate CloudFront cache${NC}"
        exit 1
    fi
else
    echo -e "${YELLOW}Skipping CloudFront invalidation (no distribution ID configured)${NC}"
fi

echo ""
echo -e "${GREEN}Deployment completed successfully!${NC}"
echo "=========================================="
echo -e "${BLUE}Your website is available at:${NC}"
echo -e "${GREEN}S3 Website: http://${S3_BUCKET}.s3-website-us-west-2.amazonaws.com${NC}"
echo ""
echo -e "${YELLOW}Note: If using CloudFront, cache invalidation may take 5-10 minutes to complete.${NC}"
