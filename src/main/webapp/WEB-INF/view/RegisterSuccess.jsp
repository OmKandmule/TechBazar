<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Successful - TechBazar</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/RegisterSuccess.css">
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-container">
            <div class="logo">
                <i class="fas fa-shopping-bag logo-icon"></i>
                TechBazar
            </div>
            <nav class="nav-menu">
                <ul>
                    <li><a href="home.jsp"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="menu.jsp"><i class="fas fa-laptop"></i> Products</a></li>
                    <li><a href="cart.jsp"><i class="fas fa-shopping-cart"></i> Cart</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!--Main Content -->
    <div class="main-container">
        <div class="success-card">
            <div class="success-animation">
                <div class="success-icon">
                    <i class="fas fa-check-circle"></i>
                </div>
                <div class="confetti-container">
                    <div class="confetti"></div>
                    <div class="confetti"></div>
                    <div class="confetti"></div>
                    <div class="confetti"></div>
                    <div class="confetti"></div>
                    <div class="confetti"></div>
                    <div class="confetti"></div>
                    <div class="confetti"></div>
                    <div class="confetti"></div>
                    <div class="confetti"></div>
                </div>
            </div>
            
            <div class="success-content">
                <h1>Registration Successful!</h1>
                <p>Your account has been created successfully. Welcome to the TechBazar family!</p>
                
                <div class="account-info">
                    <div class="info-item">
                        <i class="fas fa-envelope"></i>
                        <p>A confirmation email has been sent to your email address.</p>
                    </div>
                    <div class="info-item">
                        <i class="fas fa-gift"></i>
                        <p>You've received a 10% discount on your first purchase!</p>
                    </div>
                </div>
                
                <div class="action-buttons">
                    <a href="login" class="btn-login">
                        <i class="fas fa-sign-in-alt"></i> Login to Your Account
                    </a>
                    <a href="home" class="btn-home">
                        <i class="fas fa-home"></i> Go to Homepage
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-column">
                <div class="footer-logo">
                    <i class="fas fa-shopping-bag"></i> TechBazar
                </div>
                <p>Your one-stop shop for all electronics and tech gadgets. Quality products at competitive prices.</p>
            </div>
            <div class="footer-column">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="menu.jsp">Products</a></li>
                    <li><a href="cart.jsp">Cart</a></li>
                    <li><a href="login.jsp">Login</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h3>Customer Service</h3>
                <ul>
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="#">FAQs</a></li>
                    <li><a href="#">Shipping Policy</a></li>
                    <li><a href="#">Return Policy</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h3>Connect With Us</h3>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-youtube"></i></a>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2025 TechBazar. All Rights Reserved.</p>
        </div>
    </footer>

    <script src="${pageContext.request.contextPath}/resources/js/RegisterSuccess.js"></script>
</body>
</html>
