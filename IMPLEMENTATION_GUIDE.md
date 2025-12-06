# Implementation Guide

Quick reference for launching the new Tømrer Jens Justesen website.

## 📦 Files Delivered

```
/Users/kristian/workspace1/jens/
├── index.html                  ← Main website (READY TO USE)
├── styles.css                  ← Optional: Extracted CSS
├── script.js                   ← Optional: Extracted JavaScript
├── README.md                   ← Getting started guide
├── DESIGN_README.md            ← Full design documentation
└── IMPLEMENTATION_GUIDE.md     ← This file
```

## 🚀 Option 1: Use As-Is (Recommended)

The `index.html` file is **completely self-contained** and ready to use:

✅ All CSS embedded (via Tailwind CDN + custom styles)  
✅ All JavaScript embedded  
✅ Single file deployment  
✅ Works offline (except for fonts)  

**To use:**
```bash
# Just open it
open index.html

# Or serve it
python3 -m http.server 8000
```

## 🔧 Option 2: Use Modular Files

If you prefer separate files for better organization:

1. **Extract embedded `<style>` from `index.html`**
   - Copy all content between `<style>` tags
   - Already done → `styles.css`
   - Link in HTML: `<link rel="stylesheet" href="styles.css">`

2. **Extract embedded `<script>` from `index.html`**
   - Copy all content from bottom `<script>` tag
   - Already done → `script.js`
   - Link in HTML: `<script src="script.js"></script>`

3. **Update `index.html`**
   - Remove embedded `<style>` and `<script>` sections
   - Add the `<link>` and `<script>` tags instead

## ✅ Pre-Launch Checklist

### Critical (Must Do)
- [ ] Add real project images (replace gray placeholders)
- [ ] Insert actual logo (replace "JJ" placeholder)
- [ ] Add CVR number in footer
- [ ] Set up form backend (Formspree/EmailJS/custom)
- [ ] Test on mobile devices (iOS & Android)
- [ ] Test all links (phone, email, navigation)

### Important (Should Do)
- [ ] Add cookie consent banner (GDPR)
- [ ] Install analytics (Google Analytics, Plausible, etc.)
- [ ] Set up proper hosting (not just local files)
- [ ] Configure SSL certificate (HTTPS)
- [ ] Test cross-browser (Chrome, Safari, Firefox)
- [ ] Run Lighthouse audit
- [ ] Validate HTML (validator.w3.org)

### Optional (Nice to Have)
- [ ] Add meta tags for social sharing (Open Graph)
- [ ] Create favicon and app icons
- [ ] Set up 404 page
- [ ] Create sitemap.xml
- [ ] Add structured data (Schema.org)
- [ ] Optimize for local SEO

## 🖼️ Image Requirements

### Project Gallery Images
- **Format**: WebP (with JPG fallback for older browsers)
- **Dimensions**: 800x600px minimum (4:3 aspect ratio)
- **File size**: < 200KB each (optimized)
- **Naming**: `project-1.jpg`, `project-2.jpg`, etc.
- **Alt text**: Descriptive (e.g., "Køkkenmontering i moderne villa, Odense")

### Logo
- **Format**: SVG (scalable, crisp at any size)
- **Fallback**: PNG at 2x resolution (96x96px for 48x48 display)
- **Background**: Transparent
- **Colors**: Works on both light and dark backgrounds

### Hero Image
- **Format**: WebP with JPG fallback
- **Dimensions**: 1200x900px minimum
- **File size**: < 300KB
- **Content**: Professional photo showing craftsmanship

## 📧 Form Integration Options

### Option A: Formspree (Easiest)
1. Sign up at https://formspree.io
2. Create a form and get your endpoint
3. Update form tag:
```html
<form action="https://formspree.io/f/YOUR_FORM_ID" method="POST">
```

### Option B: EmailJS (No backend needed)
1. Sign up at https://www.emailjs.com/
2. Follow their setup guide
3. Replace form submit handler in JavaScript

### Option C: Custom Backend
Create a simple PHP handler:

```php
<?php
// submit-form.php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['name'];
    $phone = $_POST['phone'];
    $email = $_POST['email'];
    $message = $_POST['message'];
    
    $to = "jens@toemrerjustesen.dk";
    $subject = "Ny henvendelse fra website";
    $body = "Navn: $name\nTelefon: $phone\nEmail: $email\nBesked: $message";
    
    mail($to, $subject, $body);
    
    echo "success";
}
?>
```

## 🌐 Hosting Options

### Recommended Hosts
1. **Netlify** (free tier, easy)
   - Drag & drop deployment
   - Free SSL
   - Custom domain support
   
2. **Vercel** (free tier, modern)
   - Git integration
   - Automatic HTTPS
   - Edge network

3. **Traditional Hosting**
   - One.com, Hostgator, or current provider
   - Upload via FTP
   - Configure domain DNS

### Deployment Steps (Netlify Example)
1. Create account at netlify.com
2. Drag `index.html` (and images folder) to Netlify
3. Add custom domain (toemrerjustesen.dk)
4. Configure DNS at your domain registrar
5. Netlify auto-provisions SSL certificate

## 📊 Analytics Setup

### Google Analytics 4
```html
<!-- Add before </head> in index.html -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

### Privacy-Focused Alternative: Plausible
```html
<script defer data-domain="toemrerjustesen.dk" src="https://plausible.io/js/script.js"></script>
```

## 🔍 SEO Checklist

### On-Page SEO
- [x] Semantic HTML (header, nav, main, footer)
- [x] Descriptive title tag
- [x] Meta description
- [ ] Open Graph tags (social sharing)
- [ ] Canonical URL
- [ ] Structured data (LocalBusiness schema)

### Technical SEO
- [ ] XML sitemap
- [ ] robots.txt
- [ ] 301 redirects from old URLs (if migrating)
- [ ] Page speed optimization (target < 3s load time)
- [ ] Mobile-friendly test (Google)

### Local SEO
- [ ] Google Business Profile (formerly Google My Business)
- [ ] Consistent NAP (Name, Address, Phone) across web
- [ ] Local citations (Krak, DBA, etc.)
- [ ] Customer reviews on Google

## 🧪 Testing

### Browser Testing
- [ ] Chrome (Windows, Mac, Android)
- [ ] Safari (Mac, iOS)
- [ ] Firefox (Windows, Mac)
- [ ] Edge (Windows)

### Device Testing
- [ ] iPhone SE (smallest modern iPhone)
- [ ] iPhone 14 Pro
- [ ] iPad
- [ ] Samsung Galaxy (Android)
- [ ] Desktop (1920x1080)

### Functionality Testing
- [ ] All navigation links work
- [ ] Mobile menu opens/closes properly
- [ ] Form validation works
- [ ] Form submission works
- [ ] Phone links open phone app
- [ ] Email links open email client
- [ ] Smooth scroll works
- [ ] No console errors

### Performance Testing
Run Lighthouse audit (Chrome DevTools):
- **Performance**: Target 90+
- **Accessibility**: Target 95+
- **Best Practices**: Target 95+
- **SEO**: Target 95+

## 🐛 Common Issues & Fixes

### Issue: Images not showing
**Fix**: Check file paths are correct relative to index.html

### Issue: Form not submitting
**Fix**: Check form action URL and method="POST"

### Issue: Mobile menu not closing
**Fix**: Verify JavaScript is loading (check browser console)

### Issue: Fonts not loading
**Fix**: Check internet connection (Google Fonts requires online access)

### Issue: Horizontal scroll on mobile
**Fix**: Check for elements with fixed width > 100vw

## 📞 Support

If you need help:
1. Check `README.md` for basic setup
2. Check `DESIGN_README.md` for design decisions
3. Check browser console for JavaScript errors
4. Validate HTML at https://validator.w3.org/

## 🎉 Launch Day

1. **Backup old site** (if replacing existing)
2. Upload new files to hosting
3. Test live site on multiple devices
4. Update any printed materials with new URL
5. Announce on social media
6. Monitor form submissions and analytics

## 📈 Post-Launch

Week 1:
- Monitor for any bugs or issues
- Check analytics are tracking properly
- Respond to form submissions promptly

Month 1:
- Review analytics data
- A/B test CTA button text/colors
- Add more project images
- Collect customer testimonials

Quarter 1:
- Review and optimize based on user behavior
- Update content (seasonal services?)
- Improve based on customer feedback

---

**Questions?** Review the documentation files or contact your developer.

**Status**: Ready for image integration and launch 🚀

