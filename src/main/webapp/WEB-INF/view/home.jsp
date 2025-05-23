<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.electronics.model.Category" %>
<%@ page import="com.electronics.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TechBazar - Your Electronics Destination</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <% 
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    String username = (loggedInUser != null) ? loggedInUser.getFirstName() : "Guest";
    %>

    <!-- Header -->
    <header class="header">
        <div class="header-container">
            <div class="logo">
                <i class="fas fa-bolt logo-icon"></i>
                <span>TechBazar</span>
            </div>
            <div class="search-bar">
                <input type="text" placeholder="Search for products, brands...">
                <button type="submit"><i class="fas fa-search"></i></button>
            </div>
            <nav class="nav-menu">
                <ul>
                    <li class="active"><a href="<%=request.getContextPath()%>/home"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="<%=request.getContextPath()%>/cart"><i class="fas fa-shopping-cart"></i> My Cart</a></li>
                    <li><a href="<%=request.getContextPath()%>/logout"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
                    <li><a href="<%=request.getContextPath()%>/MyOrders"> MyOrders</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="hero-content">
            <div class="welcome-message">
                <h1>Welcome to TechBazar, <span class="username"><%= username %>!</span></h1>
                <p>Discover the latest in technology and electronics</p>
                <a href="#categories" class="cta-button">Shop Now <i class="fas fa-arrow-right"></i></a>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features">
        <div class="feature">
            <i class="fas fa-truck"></i>
            <h3>Free Shipping</h3>
            <p>On orders over $50</p>
        </div>
        <div class="feature">
            <i class="fas fa-undo"></i>
            <h3>Easy Returns</h3>
            <p>30 day return policy</p>
        </div>
        <div class="feature">
            <i class="fas fa-shield-alt"></i>
            <h3>Secure Payment</h3>
            <p>100% secure checkout</p>
        </div>
        <div class="feature">
            <i class="fas fa-headset"></i>
            <h3>24/7 Support</h3>
            <p>Customer support</p>
        </div>
    </section>

    <!-- Categories Section -->
    <section id="categories" class="categories-section">
        <div class="section-header">
            <h2>Shop by Category</h2>
            <p>Browse our wide selection of electronics</p>
        </div>

        <div class="category-container">
            <% 
            List<Category> categories = (List<Category>) request.getAttribute("categories");
            if (categories != null && !categories.isEmpty()) { 
                for (Category category : categories) { 
            %>
            <a href="<%= request.getContextPath() %>/menu?categoryId=<%= category.getId() %>&categoryName=<%= category.getName() %>"
               class="category-card">
                <div class="category-image">
                    <img src="<%= request.getContextPath() %>/resources/<%= category.getImgUrl() %>" alt="<%= category.getName() %>">
                </div>
                <div class="category-info">
                    <h3><%= category.getName() %></h3>
                    <p><%= category.getDescription() %></p>
                    <span class="shop-now">Shop Now <i class="fas fa-chevron-right"></i></span>
                </div>
            </a>
            <% 
                } 
            } else { 
            %>
            <div class="no-categories">
                <i class="fas fa-exclamation-circle"></i>
                <p>No categories available at the moment.</p>
                <p>Please check back later for our exciting product range!</p>
            </div>
            <% } %>
        </div>
    </section>

    <!-- Trending Products Section (Placeholder) -->
    <section class="trending-section">
        <div class="section-header">
            <h2>Trending Products</h2>
            <p>Our most popular items this week</p>
        </div>
        <div class="trending-slider">
            <div class="trending-card">
                <div class="badge">New</div>
                <img src="<%=request.getContextPath()%>/placeholder.svg?height=200&width=200" alt="Smartphone">
                <h3>Latest Smartphone</h3>
                <div class="rating">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                    <span>(4.5)</span>
                </div>
                <p class="price">$899.99</p>
            </div>
            <div class="trending-card">
                <div class="badge">Sale</div>
                <img src="<%=request.getContextPath()%>/placeholder.svg?height=200&width=200" alt="Laptop">
                <h3>Ultra Slim Laptop</h3>
                <div class="rating">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="far fa-star"></i>
                    <span>(4.0)</span>
                </div>
                <p class="price"><span class="old-price">$1299.99</span> $999.99</p>
            </div>
            <div class="trending-card">
                <img src="<%=request.getContextPath()%>/placeholder.svg?height=200&width=200" alt="Headphones">
                <h3>Wireless Headphones</h3>
                <div class="rating">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <span>(5.0)</span>
                </div>
                <p class="price">$199.99</p>
            </div>
            <div class="trending-card">
                <div class="badge">Hot</div>
                <img src="<%=request.getContextPath()%>/placeholder.svg?height=200&width=200" alt="Smartwatch">
                <h3>Smart Watch Pro</h3>
                <div class="rating">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="far fa-star"></i>
                    <span>(4.2)</span>
                </div>
                <p class="price">$249.99</p>
            </div>
        </div>
    </section>

    <!-- Newsletter Section -->
    <section class="newsletter">
        <div class="newsletter-content">
            <h2>Subscribe to Our Newsletter</h2>
            <p>Get the latest updates on new products and special promotions</p>
            <form class="newsletter-form">
                <input type="email" placeholder="Your email address">
                <button type="submit">Subscribe</button>
            </form>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-column">
                <div class="footer-logo">
                    <i class="fas fa-bolt logo-icon"></i>
                    <span>TechBazar</span>
                </div>
                <p>Your one-stop destination for all electronics needs. Quality products, competitive prices, and exceptional service.</p>
                <div class="social-icons">
                    <a href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a>
                    <a href="https://x.com/"><i class="fab fa-twitter"></i></a>
                    <a href="https://www.instagram.com/accounts/login/?hl=en"><i class="fab fa-instagram"></i></a>
                    <a href="https://www.youtube.com/"><i class="fab fa-youtube"></i></a>
                </div>
            </div>
            <div class="footer-column">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Products</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h3>Customer Service</h3>
                <ul>
                    <li><a href="#">My Account</a></li>
                    <li><a href="#">Order History</a></li>
                    <li><a href="#">Shipping Policy</a></li>
                    <li><a href="#">Returns & Refunds</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h3>Contact Us</h3>
                <ul class="contact-info">
                    <li><i class="fas fa-map-marker-alt"></i> 123 Tech Street, Digital City</li>
                    <li><i class="fas fa-phone"></i> +1 (555) 123-4567</li>
                    <li><i class="fas fa-envelope"></i> support@techbazar.com</li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2025 TechBazar. All Rights Reserved.</p>
            <div class="payment-methods">
                <i class="fab fa-cc-visa"></i>
                <i class="fab fa-cc-mastercard"></i>
                <i class="fab fa-cc-amex"></i>
                <i class="fab fa-cc-paypal"></i>
            </div>
        </div>
    </footer>

    <script src="${pageContext.request.contextPath}/resources/js/home.js"></script>
</body>
</html>
