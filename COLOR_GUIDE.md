# Accent Color Configuration Guide

## 🎨 How to Change the Website's Accent Color

The entire website's accent color can be changed in **ONE PLACE** at the top of `index.html`.

### Location

Open `index.html` and find the CSS variables section (around line 15-30):

```css
:root {
    /* Emerald Green (current) */
    --accent-main: #10b981;      /* emerald-600 */
    --accent-hover: #34d399;     /* emerald-500 */
    --accent-light: #6ee7b7;     /* emerald-400 */
    --accent-dark: #059669;      /* emerald-700 */
}
```

---

## Quick Color Change Examples

### Option 1: Use Pre-Configured Colors

#### Switch to Blue
```css
:root {
    --accent-main: #3b82f6;      /* blue-600 */
    --accent-hover: #60a5fa;     /* blue-500 */
    --accent-light: #93c5fd;     /* blue-400 */
    --accent-dark: #2563eb;      /* blue-700 */
}
```

#### Switch to Purple
```css
:root {
    --accent-main: #9333ea;      /* purple-600 */
    --accent-hover: #a855f7;     /* purple-500 */
    --accent-light: #c084fc;     /* purple-400 */
    --accent-dark: #7e22ce;      /* purple-700 */
}
```

#### Switch to Orange
```css
:root {
    --accent-main: #ea580c;      /* orange-600 */
    --accent-hover: #f97316;     /* orange-500 */
    --accent-light: #fb923c;     /* orange-400 */
    --accent-dark: #c2410c;      /* orange-700 */
}
```

#### Switch to Red
```css
:root {
    --accent-main: #dc2626;      /* red-600 */
    --accent-hover: #ef4444;     /* red-500 */
    --accent-light: #f87171;     /* red-400 */
    --accent-dark: #b91c1c;      /* red-700 */
}
```

#### Switch to Teal
```css
:root {
    --accent-main: #0d9488;      /* teal-600 */
    --accent-hover: #14b8a6;     /* teal-500 */
    --accent-light: #2dd4bf;     /* teal-400 */
    --accent-dark: #0f766e;      /* teal-700 */
}
```

---

## Option 2: Use Your Brand Color

If you have a specific brand color, you can use that:

```css
:root {
    --accent-main: #YOUR_MAIN_COLOR;      /* Your brand color */
    --accent-hover: #YOUR_HOVER_COLOR;    /* Slightly lighter version */
    --accent-light: #YOUR_LIGHT_COLOR;    /* Even lighter for text */
    --accent-dark: #YOUR_DARK_COLOR;      /* Darker version */
}
```

### How to Create Color Variations

If you have one brand color (e.g., `#FF5733`), you can create variations:

1. **Main**: Your exact brand color
2. **Hover**: Add 10-15% lightness
3. **Light**: Add 20-30% lightness (for text on dark backgrounds)
4. **Dark**: Reduce lightness by 10-15% (rarely used)

**Tools to help:**
- [Coolors.co Color Shades Generator](https://coolors.co/generate)
- [Tailwind Color Palette](https://tailwindcss.com/docs/customizing-colors)
- Browser DevTools color picker

---

## What Gets Updated

When you change these 4 variables, **everything** updates automatically:

### ✅ Updated Elements:
- ✅ All CTA buttons ("Få tilbud", "Ring nu", etc.)
- ✅ Badge colors ("Autoriseret køkkenmontør")
- ✅ Service card icons
- ✅ Service card hover borders
- ✅ Navigation hover states (mobile menu)
- ✅ Link colors
- ✅ Form input focus states
- ✅ Floating info cards
- ✅ Button shadows and glows
- ✅ All hover effects

---

## Testing Your Color Change

After changing the color variables:

1. **Save** `index.html`
2. **Refresh** your browser (Ctrl+F5 or Cmd+Shift+R for hard refresh)
3. **Check these elements:**
   - Primary CTA button in hero
   - Service card icons
   - Mobile menu (open hamburger menu)
   - Form inputs (click to focus)
   - Links on service cards

---

## Accessibility Note

⚠️ **Important**: Ensure your chosen accent color has sufficient contrast:

- **Text on dark backgrounds**: Minimum 4.5:1 contrast ratio
- **Buttons and CTAs**: Should be clearly visible and readable

**Test contrast:** [WebAIM Contrast Checker](https://webaim.org/resources/contrastchecker/)

---

## Example: Changing to Blue (Step-by-Step)

### Current (Green):
```css
:root {
    --accent-main: #10b981;      /* emerald-600 */
    --accent-hover: #34d399;     /* emerald-500 */
    --accent-light: #6ee7b7;     /* emerald-400 */
    --accent-dark: #059669;      /* emerald-700 */
}
```

### New (Blue):
```css
:root {
    --accent-main: #3b82f6;      /* blue-600 */
    --accent-hover: #60a5fa;     /* blue-500 */
    --accent-light: #93c5fd;     /* blue-400 */
    --accent-dark: #2563eb;      /* blue-700 */
}
```

### Result:
- All green buttons → Blue buttons
- All green icons → Blue icons
- All green accents → Blue accents
- **0 other changes needed!**

---

## Reverting to Original

To go back to the original emerald green:

```css
:root {
    --accent-main: #10b981;
    --accent-hover: #34d399;
    --accent-light: #6ee7b7;
    --accent-dark: #059669;
}
```

---

## Advanced: Multiple Brand Colors

If you want multiple accent colors for different sections:

```css
:root {
    /* Primary accent (green) */
    --accent-main: #10b981;
    --accent-hover: #34d399;
    --accent-light: #6ee7b7;
    --accent-dark: #059669;
    
    /* Secondary accent (blue) - for future use */
    --accent-secondary: #3b82f6;
    --accent-secondary-hover: #60a5fa;
}
```

Then manually apply `bg-[var(--accent-secondary)]` where needed.

---

## Need Help?

If you're unsure which colors to use:

1. **Check your logo** - use colors from your branding
2. **Industry standards**:
   - Construction/Craftsman: Earth tones (brown, green, orange)
   - Tech/Modern: Blue, purple
   - Luxury: Gold, deep purple, dark blue
   - Eco-friendly: Green, teal

3. **Emotional impact**:
   - **Green**: Growth, trust, eco-friendly
   - **Blue**: Professional, trustworthy, calm
   - **Orange**: Energetic, friendly, affordable
   - **Purple**: Luxury, creative, unique
   - **Red**: Urgent, exciting, bold

---

**Current Status**: Emerald Green (#10b981)  
**Files to Edit**: Only `index.html` (lines 15-30)  
**Time to Change**: ~30 seconds

