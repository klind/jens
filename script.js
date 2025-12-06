/**
 * Tømrer Jens Justesen - Interactive Scripts
 * Vanilla JavaScript - No dependencies
 */

// ============================================
// HEADER SCROLL EFFECT
// ============================================
(function initHeaderScroll() {
    const header = document.getElementById('header');
    let lastScroll = 0;

    window.addEventListener('scroll', () => {
        const currentScroll = window.pageYOffset;
        
        // Add shadow when scrolled down
        if (currentScroll > 50) {
            header.classList.add('header-shadow');
        } else {
            header.classList.remove('header-shadow');
        }
        
        lastScroll = currentScroll;
    });
})();

// ============================================
// MOBILE MENU TOGGLE
// ============================================
(function initMobileMenu() {
    const hamburger = document.getElementById('hamburger');
    const mobileMenu = document.getElementById('mobile-menu');
    const closeMenu = document.getElementById('close-menu');
    const mobileMenuLinks = document.querySelectorAll('.mobile-menu-link');

    // Open mobile menu
    function openMobileMenu() {
        mobileMenu.classList.add('active');
        hamburger.classList.add('active');
        document.body.style.overflow = 'hidden'; // Prevent background scrolling
    }

    // Close mobile menu
    function closeMobileMenu() {
        mobileMenu.classList.remove('active');
        hamburger.classList.remove('active');
        document.body.style.overflow = ''; // Restore scrolling
    }

    // Event listeners
    if (hamburger) {
        hamburger.addEventListener('click', openMobileMenu);
    }
    
    if (closeMenu) {
        closeMenu.addEventListener('click', closeMobileMenu);
    }
    
    // Close menu when clicking on navigation links
    mobileMenuLinks.forEach(link => {
        link.addEventListener('click', closeMobileMenu);
    });

    // Close menu on escape key
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && mobileMenu.classList.contains('active')) {
            closeMobileMenu();
        }
    });

    // Close menu when clicking outside
    mobileMenu.addEventListener('click', (e) => {
        if (e.target === mobileMenu) {
            closeMobileMenu();
        }
    });
})();

// ============================================
// SMOOTH SCROLL FOR ANCHOR LINKS
// ============================================
(function initSmoothScroll() {
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            const href = this.getAttribute('href');
            
            // Ignore if it's just "#"
            if (href === '#') {
                e.preventDefault();
                return;
            }
            
            const target = document.querySelector(href);
            
            if (target) {
                e.preventDefault();
                
                // Account for fixed header height (80px)
                const offsetTop = target.offsetTop - 80;
                
                window.scrollTo({
                    top: offsetTop,
                    behavior: 'smooth'
                });
            }
        });
    });
})();

// ============================================
// FORM HANDLING
// ============================================
(function initFormHandling() {
    const forms = document.querySelectorAll('form');
    
    forms.forEach(form => {
        form.addEventListener('submit', (e) => {
            e.preventDefault();
            
            // Get form data
            const formData = new FormData(form);
            const name = formData.get('name');
            const phone = formData.get('phone');
            const email = formData.get('email');
            const message = formData.get('message');
            
            // Basic validation
            if (!name || !phone) {
                alert('Udfyld venligst navn og telefonnummer.');
                return;
            }
            
            // TODO: Replace with actual backend integration
            // Options:
            // 1. Formspree: form.action = "https://formspree.io/f/YOUR_ID"
            // 2. EmailJS: emailjs.send(...)
            // 3. Custom PHP/Node backend
            
            console.log('Form submitted:', {
                name,
                phone,
                email,
                message
            });
            
            // Show success message
            alert('Tak for din henvendelse! Vi kontakter dig hurtigst muligt.');
            
            // Reset form
            form.reset();
            
            // Optional: Track conversion in analytics
            if (typeof gtag !== 'undefined') {
                gtag('event', 'form_submission', {
                    'event_category': 'Contact',
                    'event_label': 'Contact Form'
                });
            }
        });
    });
})();

// ============================================
// LAZY LOAD IMAGES (Optional Enhancement)
// ============================================
(function initLazyLoad() {
    // Modern browsers support native lazy loading via loading="lazy"
    // This is a fallback/enhancement for older browsers
    
    if ('IntersectionObserver' in window) {
        const images = document.querySelectorAll('img[data-src]');
        
        const imageObserver = new IntersectionObserver((entries, observer) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const img = entry.target;
                    img.src = img.dataset.src;
                    img.removeAttribute('data-src');
                    imageObserver.unobserve(img);
                }
            });
        });
        
        images.forEach(img => imageObserver.observe(img));
    }
})();

// ============================================
// TRACK OUTBOUND LINKS (Optional)
// ============================================
(function initOutboundTracking() {
    // Track phone and email clicks for analytics
    const phoneLinks = document.querySelectorAll('a[href^="tel:"]');
    const emailLinks = document.querySelectorAll('a[href^="mailto:"]');
    
    phoneLinks.forEach(link => {
        link.addEventListener('click', () => {
            if (typeof gtag !== 'undefined') {
                gtag('event', 'click', {
                    'event_category': 'Contact',
                    'event_label': 'Phone',
                    'value': link.getAttribute('href')
                });
            }
        });
    });
    
    emailLinks.forEach(link => {
        link.addEventListener('click', () => {
            if (typeof gtag !== 'undefined') {
                gtag('event', 'click', {
                    'event_category': 'Contact',
                    'event_label': 'Email',
                    'value': link.getAttribute('href')
                });
            }
        });
    });
})();

// ============================================
// ANIMATION ON SCROLL (Optional Enhancement)
// ============================================
(function initScrollAnimations() {
    // Add fade-in animations to elements as they scroll into view
    
    if ('IntersectionObserver' in window) {
        const animatedElements = document.querySelectorAll('.animate-on-scroll');
        
        const animationObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animated');
                }
            });
        }, {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        });
        
        animatedElements.forEach(el => animationObserver.observe(el));
    }
})();

// ============================================
// UTILITY: Detect if user prefers reduced motion
// ============================================
function prefersReducedMotion() {
    return window.matchMedia('(prefers-reduced-motion: reduce)').matches;
}

// Disable animations if user prefers reduced motion
if (prefersReducedMotion()) {
    document.documentElement.style.setProperty('--animation-duration', '0.01ms');
    
    // Disable smooth scroll
    document.documentElement.style.scrollBehavior = 'auto';
}

// ============================================
// CONSOLE WELCOME MESSAGE
// ============================================
console.log('%c👷 Tømrer Jens Justesen', 'font-size: 20px; font-weight: bold; color: #27272a;');
console.log('%cWebsite by [Your Agency]', 'color: #666;');
console.log('Interested in the code? Visit: https://github.com/...');

