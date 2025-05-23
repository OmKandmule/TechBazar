// Show/Hide Login Popup
const loginBtn = document.getElementById('loginBtn');
const shopNowBtn = document.getElementById('shopNowBtn');
const loginPopup = document.getElementById('loginPopup');
const closePopup = document.getElementById('closePopup');
const productItems = document.querySelectorAll('.product-item');

// Function to show login popup
function showLoginPopup(e) {          
    e.preventDefault();
    loginPopup.classList.add('active');
    document.body.style.overflow = 'hidden';
}

// Add event listener to login button
loginBtn.addEventListener('click', showLoginPopup);

// Add event listener to shop now button
shopNowBtn.addEventListener('click', showLoginPopup);

// Add event listeners to all product items
productItems.forEach(item => {
    item.addEventListener('click', showLoginPopup);
});

// Close popup when clicking the close button
closePopup.addEventListener('click', function() {
    loginPopup.classList.remove('active');
    document.body.style.overflow = 'auto';
});

// Close popup when clicking outside the popup content
loginPopup.addEventListener('click', function(e) {
    if (e.target === loginPopup) {
        loginPopup.classList.remove('active');
        document.body.style.overflow = 'auto';
    }
});

// Testimonial Carousel
const testimonialCards = document.querySelectorAll('.testimonial-card');
const dots = document.querySelectorAll('.dot');
const prevBtn = document.querySelector('.prev');
const nextBtn = document.querySelector('.next');
let currentIndex = 0;
let testimonialInterval;

function showTestimonial(index) {
    testimonialCards.forEach(card => card.classList.remove('active'));
    dots.forEach(dot => dot.classList.remove('active'));
    
    testimonialCards[index].classList.add('active');
    dots[index].classList.add('active');
    currentIndex = index;
}

// Add event listeners to dots
dots.forEach(dot => {
    dot.addEventListener('click', function() {
        const index = parseInt(this.getAttribute('data-index'));
        showTestimonial(index);
        resetInterval();
    });
});

// Add event listeners to prev/next buttons
prevBtn.addEventListener('click', function() {
    currentIndex = (currentIndex - 1 + testimonialCards.length) % testimonialCards.length;
    showTestimonial(currentIndex);
    resetInterval();
});

nextBtn.addEventListener('click', function() {
    currentIndex = (currentIndex + 1) % testimonialCards.length;
    showTestimonial(currentIndex);
    resetInterval();
});

// Auto-rotate testimonials
function startInterval() {
    testimonialInterval = setInterval(() => {
        currentIndex = (currentIndex + 1) % testimonialCards.length;
        showTestimonial(currentIndex);
    }, 5000);
}

function resetInterval() {
    clearInterval(testimonialInterval);
    startInterval();
}

startInterval();

// Back to Top Button
const backToTopBtn = document.querySelector('.back-to-top');

window.addEventListener('scroll', function() {
    if (window.pageYOffset > 300) {
        backToTopBtn.classList.add('active');
    } else {
        backToTopBtn.classList.remove('active');
    }
});

backToTopBtn.addEventListener('click', function() {
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
});

// Product Wishlist Toggle
const wishlistBtns = document.querySelectorAll('.product-wishlist');

wishlistBtns.forEach(btn => {
    btn.addEventListener('click', function(e) {
        e.stopPropagation(); // Prevent triggering the login popup
        const icon = this.querySelector('i');
        if (icon.classList.contains('far')) {
            icon.classList.remove('far');
            icon.classList.add('fas');
            icon.style.color = '#ff006e';
        } else {
            icon.classList.remove('fas');
            icon.classList.add('far');
            icon.style.color = '';
        }
    });
});

// Mobile Menu Toggle
const hamburger = document.querySelector('.hamburger');
const navLinks = document.querySelector('.nav-links');

hamburger.addEventListener('click', function() {
    if (navLinks.style.display === 'flex') {
        navLinks.style.display = 'none';
    } else {
        navLinks.style.display = 'flex';
        navLinks.style.flexDirection = 'column';
        navLinks.style.position = 'absolute';
        navLinks.style.top = '70px';
        navLinks.style.left = '0';
        navLinks.style.width = '100%';
        navLinks.style.backgroundColor = 'white';
        navLinks.style.padding = '20px';
        navLinks.style.boxShadow = '0 5px 15px rgba(0, 0, 0, 0.1)';
        navLinks.style.zIndex = '999';
    }
});

// Responsive adjustments
window.addEventListener('resize', function() {
    if (window.innerWidth > 768) {
        navLinks.style = '';
    }
});

// Form submission prevention (for demo purposes)
const forms = document.querySelectorAll('form');
forms.forEach(form => {
    form.addEventListener('submit', function(e) {
        e.preventDefault();
        alert('This is a demo. Form submission is disabled.');
    });
});

// Smooth scrolling for anchor links
document.querySelectorAll('a[href^="#"]:not(.product-item)').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
        if (this.getAttribute('href') !== '#') {
            e.preventDefault();
            const targetId = this.getAttribute('href');
            const targetElement = document.querySelector(targetId);
            
            if (targetElement) {
                window.scrollTo({
                    top: targetElement.offsetTop - 80,
                    behavior: 'smooth'
                });
            }
        }
    });
});