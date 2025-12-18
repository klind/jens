// Component Loader - Loads header and footer from separate files
(function() {
    // Load header
    fetch('components/header.html')
        .then(response => response.text())
        .then(html => {
            document.getElementById('header-placeholder').outerHTML = html;
        })
        .catch(error => console.error('Error loading header:', error));

    // Load footer
    fetch('components/footer.html')
        .then(response => response.text())
        .then(html => {
            document.getElementById('footer-placeholder').outerHTML = html;
        })
        .catch(error => console.error('Error loading footer:', error));
})();

