document.addEventListener('DOMContentLoaded', function() {
    // Try Again button
    const tryAgainBtn = document.querySelector('.primary-btn');
    tryAgainBtn.addEventListener('click', function(e) {
        // No need to prevent default - let the link work naturally
        // The href="login" in the HTML will handle the redirection
    });
    
    // Register button
    const registerBtn = document.querySelector('.secondary-btn');
    registerBtn.addEventListener('click', function(e) {
        // No need to prevent default - let the link work naturally
        // The href="register" in the HTML will handle the redirection
    });
    
    // Home link
    const homeLink = document.querySelector('.home-link');
    homeLink.addEventListener('click', function(e) {
        // No need to prevent default - let the link work naturally
        // The href="home.jsp" in the HTML will handle the redirection
    });
    
    // This file can be empty or removed entirely if you don't need 
    // any special JavaScript behavior for the links
});