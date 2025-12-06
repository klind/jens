# Tømrer Jens Justesen - Website

Modern, responsive website redesign for Tømrerfirmaet Jens Justesen ApS.

## 🚀 Quick Start

Simply open `index.html` in your browser to view the website locally.

```bash
# Option 1: Direct open
open index.html

# Option 2: Using Python local server (recommended)
python3 -m http.server 8000
# Then visit http://localhost:8000

# Option 3: Using Node/npx
npx serve .
```

## 📋 What's Included

- **index.html** - Complete redesigned homepage with all sections
- **DESIGN_README.md** - Detailed design and UX documentation
- **README.md** - This file

## ✨ Features

### Design
- ✅ Scandinavian clean aesthetic
- ✅ Modern typography (Inter font)
- ✅ Light color palette with neutral tones
- ✅ Consistent 8px grid spacing system
- ✅ Smooth animations and transitions

### Responsive
- ✅ Mobile-first approach
- ✅ Breakpoints: 375px, 768px, 1024px, 1440px
- ✅ Hamburger menu on mobile
- ✅ Sticky header on all devices
- ✅ No horizontal scrolling

### Sections
- ✅ Hero with clear CTAs
- ✅ Services overview grid (6 cards)
- ✅ Why Choose Us section
- ✅ Portfolio/Gallery (6 projects)
- ✅ Testimonials (3 reviews)
- ✅ Contact form + info
- ✅ Comprehensive footer

### Technical
- ✅ HTML5 semantic markup
- ✅ Tailwind CSS (via CDN)
- ✅ Vanilla JavaScript (no dependencies)
- ✅ WCAG AA accessible
- ✅ Lightweight (~40KB HTML)

## ✅ Real Images Integrated!

All images from the original site have been downloaded and integrated into the design. See `IMAGES_REFERENCE.md` for details.

## 🔧 Before Launch

### 1. ✅ ~~Add Real Images~~ **DONE!**
~~Replace the gray placeholder sections with actual project photos:~~

```html
<!-- Current placeholder: -->
<div class="w-full h-full bg-gradient-to-br from-gray-200 to-gray-300">...</div>

<!-- Replace with: -->
<img src="images/project-1.jpg" alt="Køkkenmontering i Odense" loading="lazy">
```

**Recommended image specs:**
- Format: WebP with JPG fallback
- Sizes: 800x600px minimum (4:3 ratio)
- Optimized: <200KB per image
- Responsive srcset for different screen sizes

### 2. ✅ ~~Add Logo~~ **DONE!**
~~Replace the "JJ" text logo with your actual logo:~~

```html
<!-- Find this in header: -->
<div class="w-12 h-12 bg-charcoal-800 rounded-md flex items-center justify-center">
    <span class="text-white font-bold text-xl">JJ</span>
</div>

<!-- Replace with: -->
<img src="images/logo.svg" alt="Tømrerfirmaet Jens Justesen" class="w-12 h-12">
```

### 3. Insert CVR Number
Add your CVR number in the contact section:

```html
<!-- Find: -->
<p>CVR: [Insert CVR]</p>

<!-- Replace with actual CVR -->
```

### 4. Set Up Form Backend
The contact form currently shows a JavaScript alert. Integrate with:

**Option A - Formspree (Easiest)**
```html
<form action="https://formspree.io/f/YOUR_FORM_ID" method="POST">
```

**Option B - EmailJS**
```javascript
// Replace the form submit handler with EmailJS code
```

**Option C - Custom PHP**
Create `submit-form.php` and update form action.

### 5. Add Cookie Consent (GDPR)
If using analytics or cookies, add a consent banner. The original site used Cookiebot.

### 6. Analytics
Add Google Analytics or privacy-focused alternative:

```html
<!-- Before </head> -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

## 📱 Testing Checklist

- [ ] Test on Chrome, Safari, Firefox, Edge
- [ ] Test on iOS (iPhone SE, iPhone 14)
- [ ] Test on Android (various screen sizes)
- [ ] Test form submission
- [ ] Test all phone/email links work
- [ ] Test navigation (smooth scroll)
- [ ] Test mobile menu open/close
- [ ] Run Lighthouse audit (aim for 90+ on all metrics)
- [ ] Validate HTML (https://validator.w3.org/)
- [ ] Check accessibility (WAVE tool)

## 🎨 Customization

### Change Accent Color (Easy!)

**The entire site's accent color can be changed in ONE PLACE!**

Open `index.html` and find the CSS variables (around line 15):

```css
:root {
    --accent-main: #10b981;      /* Current: Emerald Green */
    --accent-hover: #34d399;
    --accent-light: #6ee7b7;
    --accent-dark: #059669;
}
```

**To change to blue:**
```css
:root {
    --accent-main: #3b82f6;      /* Blue */
    --accent-hover: #60a5fa;
    --accent-light: #93c5fd;
    --accent-dark: #2563eb;
}
```

See `COLOR_GUIDE.md` for more color options and detailed instructions.

### Colors (Advanced)
Modify the Tailwind config in `index.html`:

```javascript
tailwind.config = {
  theme: {
    extend: {
      colors: {
        sand: { /* your colors */ },
        charcoal: { /* your colors */ }
      }
    }
  }
}
```

### Fonts
Change the Google Fonts import in `<head>`:

```html
<link href="https://fonts.googleapis.com/css2?family=YourFont:wght@300;400;600;700&display=swap" rel="stylesheet">
```

Then update CSS:
```css
* {
  font-family: 'YourFont', sans-serif;
}
```

### Spacing
The site uses an 8px grid. Adjust spacing classes:
- `p-4` = 16px padding
- `mb-8` = 32px margin-bottom
- `gap-6` = 24px gap

## 📊 Performance Tips

1. **Optimize Images**
   - Use WebP format
   - Compress with TinyPNG or similar
   - Add `loading="lazy"` attribute
   - Use responsive `srcset`

2. **Minimize CSS** (for production)
   - Use Tailwind CLI to generate minimal CSS
   - Remove unused styles

3. **Enable Caching**
   - Set proper cache headers on server
   - Use CDN for static assets

4. **Compress Files**
   - Enable Gzip/Brotli compression on server

## 🌐 Browser Support

- Chrome/Edge: Latest 2 versions
- Safari: Latest 2 versions
- Firefox: Latest 2 versions
- Mobile Safari: iOS 13+
- Chrome Mobile: Android 8+

## 📞 Support

For questions about this redesign, refer to `DESIGN_README.md` for detailed documentation on:
- Design decisions
- UX strategy
- Technical implementation
- Accessibility features
- Responsive behavior

## 📄 License

This website is for Tømrerfirmaet Jens Justesen ApS.

---

**Version**: 1.0  
**Last Updated**: December 2024  
**Status**: Ready for content integration and launch

