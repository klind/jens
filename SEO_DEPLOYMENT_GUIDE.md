# SEO Deployment Guide - Tømrer Jens Justesen

## Overview
This guide covers the comprehensive SEO implementation for toemrerjustesen.dk, targeting carpenter keywords in the Langeskov/Odense area on Fyn.

## What Has Been Implemented

### 1. Enhanced Meta Tags & Structured Data
- **Title**: Optimized for "Tømrer Langeskov | Køkkenmontør Odense"
- **Meta Description**: 150-160 characters with location keywords and CTA
- **Open Graph Tags**: For social media sharing
- **Geo-targeting**: Coordinates for Langeskov
- **Schema.org JSON-LD**:
  - LocalBusiness with full business info
  - 6 Service schemas (one per service)
  - Organization schema
  - BreadcrumbList for navigation

### 2. Content Optimization
All pages now include location-targeted keywords:
- **Primary Keywords**: tømrer Langeskov, tømrer Odense, køkkenmontør Fyn
- **Secondary Keywords**: renovering Langeskov, vinduer Odense, tagarbejde Fyn, gulvlægning Odense
- **Service Area**: Langeskov, Odense, Kerteminde, Nyborg, Ullerslev mentioned throughout

### 3. Technical SEO Files
- **robots.txt**: Allows all crawlers, points to sitemap
- **sitemap.xml**: Includes all pages with proper priority and changefreq

### 4. Service Pages (6 pages)
Each page is 800-1200 words, SEO-optimized:
1. **koekkenmontering.html** - Kitchen installation
2. **vinduer-doere.html** - Windows & doors
3. **renovering-ombygning.html** - Renovation
4. **tag-tagarbejde.html** - Roofing
5. **gulvlaegning.html** - Flooring
6. **terrasse-udestue.html** - Terraces & outdoor

Each service page includes:
- Unique title tag with service + location keywords
- FAQPage schema (where applicable)
- Service-specific structured data
- Multiple CTAs to contact section
- Internal links
- Breadcrumb navigation

### 5. Blog Foundation
- Blog not included (removed per client request)
- Can be added in the future if needed for content marketing

## Files Changed/Created

### Modified Files:
- `index.html` - Enhanced with meta tags, structured data, and location keywords
- `deploy.sh` - Updated to include all new files

### New Files:
- `robots.txt`
- `sitemap.xml`
- `koekkenmontering.html`
- `vinduer-doere.html`
- `renovering-ombygning.html`
- `tag-tagarbejde.html`
- `gulvlaegning.html`
- `terrasse-udestue.html`

## Deployment Instructions

### Step 1: Deploy to S3
The `deploy.sh` script has been updated to include all new files:

```bash
cd /Users/kristian/workspace1/jens
./deploy.sh
```

The script will:
1. Upload all HTML files
2. Upload robots.txt and sitemap.xml
3. Upload blog posts
4. Upload images
5. Invalidate CloudFront cache (ID: EMY9JM5WARPC9)

### Step 2: Submit to Google Search Console
After deployment:

1. **Verify site ownership** (if not done):
   - Go to https://search.google.com/search-console
   - Add property: https://toemrerjustesen.dk
   - Use DNS or HTML tag verification

2. **Submit sitemap**:
   - In Search Console, go to "Sitemaps"
   - Submit: `https://toemrerjustesen.dk/sitemap.xml`

3. **Request indexing**:
   - Request indexing for key pages:
     - Homepage
     - All 6 service pages
     - Blog post

### Step 3: Google Business Profile
Ensure your Google Business Profile is optimized:
- **Name**: Tømrerfirmaet Jens Justesen ApS
- **Category**: Carpenter, Kitchen Remodeler
- **Service Area**: Langeskov, Odense, Kerteminde, Nyborg, Ullerslev
- **Website**: https://toemrerjustesen.dk
- **Phone**: 2856 5867
- **Description**: Use keywords naturally
- **Photos**: Upload photos from your projects

### Step 4: Bing Webmaster Tools
1. Go to https://www.bing.com/webmasters
2. Verify site (BingSiteAuth.xml is already deployed)
3. Submit sitemap: `https://toemrerjustesen.dk/sitemap.xml`

## Target Keywords & Expected Rankings

### Primary Keywords (Focus)
- tømrer Langeskov
- tømrer Odense
- køkkenmontør Langeskov
- køkkenmontør Odense
- køkkenmontør Fyn

### Secondary Keywords
- renovering Langeskov
- renovering Odense
- vinduer og døre Odense
- tagarbejde Fyn
- tagarbejde Langeskov
- gulvlægning Odense
- terrasse Fyn
- håndværker Langeskov

## Monitoring & Maintenance

### Week 1-2 After Launch
- Monitor Google Search Console for indexing
- Check for any crawl errors
- Verify all pages are indexed

### Month 1
- Track keyword rankings using tools like:
  - Google Search Console (free)
  - Ahrefs, SEMrush, or Moz (paid)
- Monitor organic traffic in Google Analytics

### Ongoing
- Add new blog posts monthly (recommended)
- Update service pages with customer testimonials
- Keep NAP (Name, Address, Phone) consistent across all platforms
- Build local citations (business directories)
- Encourage customer reviews on Google

## Local SEO Checklist

### Completed ✓
- [x] Location keywords throughout website
- [x] LocalBusiness schema with service area
- [x] Geo-targeting meta tags
- [x] Service area mentioned prominently
- [x] Contact information on every page

### Next Steps (Optional)
- [ ] Google Business Profile optimization
- [ ] Get listed on Danish business directories (krak.dk, degulesider.dk)
- [ ] Build backlinks from local partners (HTH, suppliers)
- [ ] Create location-specific landing pages for each city
- [ ] Set up Google Analytics 4
- [ ] Implement conversion tracking

## Content Marketing Strategy (Optional)

Blog functionality was removed per client request but can be added in the future if needed for content marketing and long-tail SEO.

## Technical Notes

### Sitemap Updates
When adding new pages, update `sitemap.xml`:
1. Add new `<url>` entry
2. Set appropriate `<priority>` (0.0-1.0)
3. Set `<changefreq>` (weekly, monthly, etc.)
4. Update `<lastmod>` to current date

### Schema Maintenance
- Keep review count and rating updated in LocalBusiness schema
- Update service descriptions as offerings change
- Add new services to schema when expanded

## Contact for SEO Questions
All SEO implementation is documented in this guide. For technical questions about the website structure, refer to:
- `README.md` - General setup
- `IMPLEMENTATION_GUIDE.md` - Deployment guide

## Success Metrics (KPIs)

Track these metrics monthly:
1. **Organic Traffic**: Total visits from search engines
2. **Keyword Rankings**: Position for target keywords
3. **Impressions**: How often your site appears in search
4. **Click-Through Rate (CTR)**: Impressions to clicks ratio
5. **Local Pack Visibility**: Appearing in Google Maps 3-pack
6. **Conversion Rate**: Visitors to contact form submissions

### Realistic Timeline
- **Week 1-2**: Pages indexed by Google
- **Month 1**: Initial ranking positions established
- **Month 3**: Noticeable improvement in rankings
- **Month 6**: Strong presence for primary keywords
- **Month 12**: Top 3 positions for "tømrer Langeskov"

## Final Checklist Before Going Live

- [x] All meta tags implemented
- [x] Structured data validated (use schema.org validator)
- [x] robots.txt in place
- [x] sitemap.xml created and accurate
- [x] All service pages complete
- [x] Blog infrastructure ready
- [x] Deploy script updated
- [x] Internal linking implemented
- [ ] Test all pages on mobile
- [ ] Verify all links work
- [ ] Check page load speed
- [ ] Submit to Google Search Console
- [ ] Submit to Bing Webmaster Tools

---

**Last Updated**: December 18, 2024
**Status**: Ready for deployment

