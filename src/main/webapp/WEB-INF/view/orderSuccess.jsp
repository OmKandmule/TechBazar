<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Successful - TechBazar</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderSuccess.css">
    <script src="${pageContext.request.contextPath}/resources/js/orderSuccess.js" defer></script>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-container">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/home">
                    <i class="fas fa-bolt logo-icon"></i>
                    <span>TechBazar</span>
                </a>
            </div>
            <nav class="nav-menu">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/home"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/cart"><i class="fas fa-shopping-cart"></i> Cart</a></li>
                    <li><a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <div class="main-container">
        <div class="success-container">
            <!-- Animation Container -->
            <div class="animation-container">
                <div class="city-background">
                    <div class="buildings">
                        <div class="building building-1"></div>
                        <div class="building building-2"></div>
                        <div class="building building-3"></div>
                        <div class="building building-4"></div>
                        <div class="building building-5"></div>
                    </div>
                    <div class="road">
                        <div class="road-line"></div>
                    </div>
                    <div class="destination">
                        <div class="house">
                            <div class="house-body"></div>
                            <div class="house-roof"></div>
                            <div class="house-door"></div>
                            <div class="house-window"></div>
                        </div>
                        <div class="mailbox">
                            <div class="mailbox-post"></div>
                            <div class="mailbox-box"></div>
                        </div>
                    </div>
                </div>
                
                <div class="delivery-guy">
                    <div class="scooter">
                        <div class="scooter-body"></div>
                        <div class="scooter-seat"></div>
                        <div class="scooter-front"></div>
                        <div class="driver">
                            <div class="driver-head"></div>
                            <div class="driver-body"></div>
                            <div class="driver-arm"></div>
                        </div>
                        <div class="wheel wheel-front">
                            <div class="wheel-inner"></div>
                            <div class="wheel-spoke"></div>
                            <div class="wheel-spoke spoke-2"></div>
                            <div class="wheel-spoke spoke-3"></div>
                        </div>
                        <div class="wheel wheel-back">
                            <div class="wheel-inner"></div>
                            <div class="wheel-spoke"></div>
                            <div class="wheel-spoke spoke-2"></div>
                            <div class="wheel-spoke spoke-3"></div>
                        </div>
                        <div class="package-container">
                            <div class="package">
                                <div class="package-label"></div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="delivery-complete">
                    <div class="package-delivered"></div>
                    <div class="checkmark">
                        <svg class="checkmark-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52">
                            <circle class="checkmark-circle" cx="26" cy="26" r="25" fill="none"/>
                            <path class="checkmark-check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8"/>
                        </svg>
                    </div>
                </div>
                
                <div id="confetti-container"></div>
            </div>
            
            <!-- Order Success Message -->
            <div class="success-message">
                <h1><i class="fas fa-check-circle"></i> Order Placed Successfully!</h1>
                <p class="success-subtitle">Thank you for shopping with TechBazar</p>
                
                <div class="order-details">
                    <div class="order-number">
                        <span>Order #</span>
                        <strong>TB<%= System.currentTimeMillis() % 100000 %></strong>
                    </div>
                    <div class="order-date">
                        <span>Date</span>
                        <strong><%= new java.text.SimpleDateFormat("dd MMM yyyy").format(new java.util.Date()) %></strong>
                    </div>
                    <div class="order-payment">
                        <span>Payment</span>
                        <strong><%= request.getParameter("paymentMethod") != null ? request.getParameter("paymentMethod") : "Cash on Delivery" %></strong>
                    </div>
                </div>
                
                <div class="delivery-info">
                    <div class="info-icon">
                        <i class="fas fa-truck"></i>
                    </div>
                    <div class="info-text">
                        <h3>Delivery Information</h3>
                        <p>Your order will be delivered within 3-5 business days. You will receive an email with tracking information once your order ships.</p>
                    </div>
                </div>
                
                <div class="next-steps">
                    <h3>What's Next?</h3>
                    <div class="steps-container">
                        <div class="step">
                            <div class="step-icon">
                                <i class="fas fa-box"></i>
                            </div>
                            <div class="step-text">
                                <h4>Order Processing</h4>
                                <p>We're preparing your order for shipment</p>
                            </div>
                        </div>
                        <div class="step-connector"></div>
                        <div class="step">
                            <div class="step-icon">
                                <i class="fas fa-shipping-fast"></i>
                            </div>
                            <div class="step-text">
                                <h4>Shipping</h4>
                                <p>Your order will be on its way to you</p>
                            </div>
                        </div>
                        <div class="step-connector"></div>
                        <div class="step">
                            <div class="step-icon">
                                <i class="fas fa-home"></i>
                            </div>
                            <div class="step-text">
                                <h4>Delivery</h4>
                                <p>Your package will arrive at your doorstep</p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="action-buttons">
                    <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">
                        <i class="fas fa-home"></i> Continue Shopping
                    </a>
                    <a href="#" class="btn btn-secondary">
                        <i class="fas fa-box"></i> Track Order
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
                    <i class="fas fa-bolt logo-icon"></i>
                    <span>TechBazar</span>
                </div>
                <p>Your one-stop destination for all electronics needs. Quality products, competitive prices, and exceptional service.</p>
            </div>
            <div class="footer-column">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/cart">Cart</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h3>Customer Service</h3>
                <ul>
                    <li><a href="#">Shipping Policy</a></li>
                    <li><a href="#">Returns & Refunds</a></li>
                    <li><a href="#">FAQ</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2024 TechBazar. All Rights Reserved.</p>
        </div>
    </footer>
</body>
</html>