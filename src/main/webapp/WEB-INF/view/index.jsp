<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TechBazar - Your Ultimate Electronics Destination</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
    
</head>               
<body> 	
    <!-- Header -->
    <header>
        <nav class="navbar">
            <a href="#" class="logo">Tech<span>Bazar</span></a>
            <ul class="nav-links">
                <li><a href="#">Home</a></li>
                <li><a href="#categories">Categories</a></li>
                <li><a href="#featured-products">Products</a></li>
                <li><a href="#testimonials">Testimonials</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
            <div class="nav-icons">
                <a href="#"><i class="fas fa-search"></i></a>
                <a href="#"><i class="fas fa-shopping-cart"></i></a>
                <a href="#" id="loginBtn"><i class="fas fa-user"></i></a>
            </div>
            <div class="hamburger">
                <i class="fas fa-bars"></i>
            </div>
        </nav>
    </header>

    <!-- Hero Section -->
    <section id="hero" class="hero">
        <div class="hero-content">
            <h1>Welcome to TechBazar</h1>
            <p>Your ultimate destination for cutting-edge electronics</p>
            <div class="cta-buttons">
                <a href="#" class="cta-button primary-btn" id="shopNowBtn">Shop Now <i class="fas fa-arrow-right btn-icon"></i></a>
                <a href="#featured-products" class="cta-button secondary-btn">Explore Products</a>
            </div>
        </div>
    </section>

    <!-- Categories Section -->
    <section id="categories" class="categories section-padding">
        <div class="section-header">
            <h2 class="section-title">Shop by Category</h2>
            <p class="section-subtitle">Browse our wide selection of products by category</p>
        </div>
        <div class="category-grid">
            <div class="category-box product-item">
                <i class="fas fa-laptop category-icon"></i>
                <h3>Laptops</h3>
                <p>High-performance laptops for work and play</p>
                <a href="#" class="category-link">View All <i class="fas fa-chevron-right"></i></a>
            </div>
            <div class="category-box product-item">
                <i class="fas fa-mobile-alt category-icon"></i>
                <h3>Smartphones</h3>
                <p>Latest smartphones with cutting-edge features</p>
                <a href="#" class="category-link">View All <i class="fas fa-chevron-right"></i></a>
            </div>
            <div class="category-box product-item">
                <i class="fas fa-headphones category-icon"></i>
                <h3>Audio</h3>
                <p>Premium audio equipment for the best sound experience</p>
                <a href="#" class="category-link">View All <i class="fas fa-chevron-right"></i></a>
            </div>
            <div class="category-box product-item">
                <i class="fas fa-camera category-icon"></i>
                <h3>Cameras</h3>
                <p>Professional cameras to capture your precious moments</p>
                <a href="#" class="category-link">View All <i class="fas fa-chevron-right"></i></a>
            </div>
            <div class="category-box product-item">
                <i class="fas fa-tv category-icon"></i>
                <h3>TVs</h3>
                <p>Smart TVs with crystal-clear display and smart features</p>
                <a href="#" class="category-link">View All <i class="fas fa-chevron-right"></i></a>
            </div>
        </div>
    </section>

    <!-- Featured Products Section -->
    <section id="featured-products" class="featured-products section-padding">
        <div class="section-header">
            <h2 class="section-title">Featured Products</h2>
            <p class="section-subtitle">Check out our most popular products</p>
        </div>
        <div class="product-grid">
            <div class="product-card product-item">
                <div class="product-image">
                    <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" alt="Laptop">
                    <span class="product-badge">New</span>
                    <div class="product-wishlist">
                        <i class="far fa-heart"></i>
                    </div>
                </div>
                <div class="product-details">
                    <div class="product-category">Laptops</div>
                    <h3 class="product-title">MacBook Pro 16"</h3>
                    <div class="product-rating">
                        <div class="rating-stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                        <span class="rating-count">(128)</span>
                    </div>
                    <div class="product-price">
                        <span class="current-price">$1,999</span>
                        <span class="old-price">$2,199</span>
                    </div>
                    <div class="product-actions">
                        <button class="add-to-cart product-item"><i class="fas fa-shopping-cart"></i> Add to Cart</button>
                        <button class="quick-view product-item">Quick View</button>
                    </div>
                </div>
            </div>
            <div class="product-card product-item">
                <div class="product-image">
                    <img src="https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" alt="Smartphone">
                    <span class="product-badge">Sale</span>
                    <div class="product-wishlist">
                        <i class="far fa-heart"></i>
                    </div>
                </div>
                <div class="product-details">
                    <div class="product-category">Smartphones</div>
                    <h3 class="product-title">iPhone 13 Pro</h3>
                    <div class="product-rating">
                        <div class="rating-stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <span class="rating-count">(256)</span>
                    </div>
                    <div class="product-price">
                        <span class="current-price">$999</span>
                        <span class="old-price">$1,099</span>
                    </div>
                    <div class="product-actions">
                        <button class="add-to-cart product-item"><i class="fas fa-shopping-cart"></i> Add to Cart</button>
                        <button class="quick-view product-item">Quick View</button>
                    </div>
                </div>
            </div>
            <div class="product-card product-item">
                <div class="product-image">
                    <img src="https://images.unsplash.com/photo-1546435770-a3e426bf472b?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" alt="Headphones">
                    <div class="product-wishlist">
                        <i class="far fa-heart"></i>
                    </div>
                </div>
                <div class="product-details">
                    <div class="product-category">Audio</div>
                    <h3 class="product-title">Sony WH-1000XM4</h3>
                    <div class="product-rating">
                        <div class="rating-stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="far fa-star"></i>
                        </div>
                        <span class="rating-count">(98)</span>
                    </div>
                    <div class="product-price">
                        <span class="current-price">$349</span>
                        <span class="old-price">$399</span>
                    </div>
                    <div class="product-actions">
                        <button class="add-to-cart product-item"><i class="fas fa-shopping-cart"></i> Add to Cart</button>
                        <button class="quick-view product-item">Quick View</button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Dashboard Section -->
    <section class="dashboard section-padding">
        <div class="section-header">
            <h2 class="section-title">Our Performance</h2>
            <p class="section-subtitle">See how we're growing and serving our customers</p>
        </div>
        <div class="dashboard-grid">
            <div class="dashboard-card">
                <i class="fas fa-chart-line dashboard-icon"></i>
                <h3>Total Sales</h3>
                <p class="dashboard-number">$1,254,230</p>
                <p class="dashboard-label">Last 30 days</p>
            </div>
            <div class="dashboard-card">
                <i class="fas fa-shopping-bag dashboard-icon"></i>
                <h3>Orders</h3>
                <p class="dashboard-number">3,259</p>
                <p class="dashboard-label">Last 30 days</p>
            </div>
            <div class="dashboard-card">
                <i class="fas fa-box-open dashboard-icon"></i>
                <h3>Products</h3>
                <p class="dashboard-number">5,542</p>
                <p class="dashboard-label">In stock</p>
            </div>
            <div class="dashboard-card">
                <i class="fas fa-users dashboard-icon"></i>
                <h3>Customers</h3>
                <p class="dashboard-number">12,892</p>
                <p class="dashboard-label">Total registered</p>
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section id="testimonials" class="testimonials section-padding">
        <div class="section-header">
            <h2 class="section-title">What Our Customers Say</h2>
            <p class="section-subtitle">Read testimonials from our satisfied customers</p>
        </div>
        <div class="testimonial-container">
            <div class="testimonial-carousel">
                <div class="testimonial-card active">
                    <p class="testimonial-quote">TechBazar offers an incredible selection of electronics at competitive prices. Their customer service is top-notch! I've never had a better online shopping experience.</p>
                    <div class="testimonial-author">
                        <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="John Doe">
                        <div class="author-info">
                            <h4>John Doe</h4>
                            <small>Tech Enthusiast</small>
                        </div>
                    </div>
                </div>
                <div class="testimonial-card">
                    <p class="testimonial-quote">I've been a loyal customer for years. TechBazar always has the latest gadgets and their delivery is super fast! The product quality is consistently excellent.</p>
                    <div class="testimonial-author">
                        <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="Jane Smith">
                        <div class="author-info">
                            <h4>Jane Smith</h4>
                            <small>Gadget Lover</small>
                        </div>
                    </div>
                </div>
                <div class="testimonial-card">
                    <p class="testimonial-quote">The product quality and after-sales support at TechBazar are unmatched. Highly recommended! Their technical team is always ready to help with any issues.</p>
                    <div class="testimonial-author">
                        <img src="https://randomuser.me/api/portraits/men/67.jpg" alt="Mike Johnson">
                        <div class="author-info">
                            <h4>Mike Johnson</h4>
                            <small>IT Professional</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="testimonial-controls">
                <button class="control-btn prev"><i class="fas fa-chevron-left"></i></button>
                <button class="control-btn next"><i class="fas fa-chevron-right"></i></button>
            </div>
            <div class="testimonial-dots">
                <span class="dot active" data-index="0"></span>
                <span class="dot" data-index="1"></span>
                <span class="dot" data-index="2"></span>
            </div>
        </div>
    </section>

    <!-- Newsletter Section -->
    <section class="newsletter">             
        <div class="newsletter-content">
            <h2>Subscribe to Our Newsletter</h2>
            <p>Stay updated with our latest products, offers, and tech news</p>
            <form class="newsletter-form">
                <input type="email" class="newsletter-input" placeholder="Enter your email address" required>
                <button type="submit" class="newsletter-btn">Subscribe</button>
            </form>
        </div>
    </section>

    <!-- Footer -->
    <footer id="contact">
        <div class="footer-container">
            <div class="footer-column">
                <h3>TechBazar</h3>
                <p>Your ultimate destination for cutting-edge electronics and tech products. We offer the best prices and exceptional customer service.</p>
                <div class="footer-social">
                    <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
            <div class="footer-column">
                <h3>Quick Links</h3>
                <ul class="footer-links">
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Home</a></li>
                    <li><a href="#categories"><i class="fas fa-chevron-right"></i> Categories</a></li>
                    <li><a href="#featured-products"><i class="fas fa-chevron-right"></i> Products</a></li>
                    <li><a href="#testimonials"><i class="fas fa-chevron-right"></i> Testimonials</a></li>
                    <li><a href="#"><i class="fas fa-chevron-right"></i> About Us</a></li>
                    <li><a href="#contact"><i class="fas fa-chevron-right"></i> Contact</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h3>Customer Service</h3>
                <ul class="footer-links">
                    <li><a href="#"><i class="fas fa-chevron-right"></i> My Account</a></li>
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Order Tracking</a></li>
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Wishlist</a></li>
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Customer Service</a></li>
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Returns & Exchanges</a></li>
                    <li><a href="#"><i class="fas fa-chevron-right"></i> FAQs</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h3>Contact Us</h3>
                <div class="footer-contact">
                    <p><i class="fas fa-map-marker-alt"></i> 123 Tech Street, Silicon Valley, CA 94043</p>
                    <p><i class="fas fa-phone-alt"></i> +1 (123) 456-7890</p>
                    <p><i class="fas fa-envelope"></i> info@techbazar.com</p>
                    <p><i class="fas fa-clock"></i> Monday-Friday: 9am to 5pm</p>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2025 TechBazar. All Rights Reserved.</p>
        </div>
    </footer>

    <!-- Login Popup -->
    <div id="loginPopup" class="popup">
    <div class="popup-content">
        <i class="fas fa-times close-popup" id="closePopup"></i>
        <h2 class="popup-title">Login to Shop</h2>
        <p class="popup-message">Please login to continue shopping.</p>
        <div class="popup-buttons">
            <a href="login" class="login-btn">Go to Login</a>
            <div class="signup-link">
                Don't have an account? <a href="register">Register</a>
            </div>
        </div>
    </div>
</div>


    <!-- Back to Top Button -->
    <div class="back-to-top">
        <i class="fas fa-arrow-up"></i>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
    
</body>
</html>