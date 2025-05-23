<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.electronics.daoimpl.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.electronics.model.CartItem" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout - TechBazar</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/checkout.css">
    <script src="${pageContext.request.contextPath}/resources/js/checkout.js" defer></script>
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
        <%
            // Retrieve the cart object from the session
            Cart cart = (Cart) session.getAttribute("cart"); 

            // Convert HashMap values to List
            List<CartItem> items = new ArrayList<>();
            if (cart != null && cart.getItems() != null) {
                items.addAll(cart.getItems().values()); // Convert HashMap values to List
            }

            if (!items.isEmpty()) {
                double grandTotal = 0;
                int itemCount = 0;
                
                for (CartItem item : items) {
                    grandTotal += item.getPrice() * item.getQuantity();
                    itemCount += item.getQuantity();
                }
        %>
        
        <div class="page-title">
            <h1>Checkout</h1>
            <p>Complete your purchase securely</p>
        </div>

        <div class="checkout-container">
            <div class="checkout-form-container">
                <div class="order-review">
                    <div class="section-header">
                        <h2>Order Summary</h2>
                        <span class="item-count"><%= itemCount %> items</span>
                    </div>
                    
                    <div class="cart-items">
                        <% for (CartItem item : items) { 
                            double totalPrice = item.getPrice() * item.getQuantity();
                        %>
                        <div class="cart-item">
                            <div class="item-image">
                                <!-- Fixed image path to use resources instead of images -->
                                <img src="${pageContext.request.contextPath}/resources/<%= item.getImageUrl() %>" 
                                     alt="<%= item.getProductName() %>" 
                                     onerror="this.src='${pageContext.request.contextPath}/resources/placeholder.jpg'">
                            </div>
                            <div class="item-details">
                                <h3><%= item.getProductName() %></h3>
                                <div class="item-meta">
                                    <span>Qty: <%= item.getQuantity() %></span>
                                    <span>₹<%= String.format("%.2f", item.getPrice()) %></span>
                                </div>
                                <div class="item-total">₹<%= String.format("%.2f", totalPrice) %></div>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>

                <!-- This is the original form with all fields preserved -->
                <form action="${pageContext.request.contextPath}/placeOrder" method="post" id="checkoutForm">
                    <div class="shipping-info">
                        <div class="section-header">
                            <h2>Shipping Information</h2>
                        </div>
                        
                        <div class="form-grid">
                            <div class="form-group">
                                <label for="name">Full Name:</label>
                                <input type="text" id="name" name="name" required>
                            </div>

                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" id="email" name="email" required>
                            </div>

                            <div class="form-group">
                                <label for="phone">Phone Number:</label>
                                <input type="tel" id="phone" name="phone" required>
                            </div>

                            <div class="form-group full-width">
                                <label for="address">Address:</label>
                                <textarea id="address" name="address" required></textarea>
                            </div>

                            <div class="form-group">
                                <label for="city">City:</label>
                                <input type="text" id="city" name="city" required>
                            </div>

                            <div class="form-group">
                                <label for="state">State:</label>
                                <input type="text" id="state" name="state" required>
                            </div>

                            <div class="form-group">
                                <label for="zipcode">Zip Code:</label>
                                <input type="text" id="zipcode" name="zipcode" required>
                            </div>
                        </div>
                    </div>

                    <div class="payment-info">
                        <div class="section-header">
                            <h2>Payment Method</h2>
                        </div>
                        
                        <div class="payment-options">
                            <div class="payment-option">
                                <input type="radio" id="cod" name="paymentMethod" value="Cash on Delivery" checked>
                                <label for="cod">
                                    <div class="payment-icon"><i class="fas fa-money-bill-wave"></i></div>
                                    <div class="payment-details">
                                        <h3>Cash on Delivery</h3>
                                        <p>Pay when you receive your order</p>
                                    </div>
                                </label>
                            </div>
                            
                            <div class="payment-option">
                                <input type="radio" id="credit" name="paymentMethod" value="Credit Card">
                                <label for="credit">
                                    <div class="payment-icon"><i class="fas fa-credit-card"></i></div>
                                    <div class="payment-details">
                                        <h3>Credit Card</h3>
                                        <p>Secure payment with credit card</p>
                                    </div>
                                </label>
                            </div>
                            
                            <div class="payment-option">
                                <input type="radio" id="debit" name="paymentMethod" value="Debit Card">
                                <label for="debit">
                                    <div class="payment-icon"><i class="fas fa-credit-card"></i></div>
                                    <div class="payment-details">
                                        <h3>Debit Card</h3>
                                        <p>Secure payment with debit card</p>
                                    </div>
                                </label>
                            </div>
                            
                            <div class="payment-option">
                                <input type="radio" id="upi" name="paymentMethod" value="UPI Payment">
                                <label for="upi">
                                    <div class="payment-icon"><i class="fas fa-mobile-alt"></i></div>
                                    <div class="payment-details">
                                        <h3>UPI Payment</h3>
                                        <p>Pay using UPI apps like Google Pay, PhonePe</p>
                                    </div>
                                </label>
                            </div>
                        </div>
                        
                        <div class="place-order">
                            <button type="submit" class="place-order-btn">
                                Place Order <i class="fas fa-arrow-right"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            
            <div class="order-summary">
                <div class="summary-header">
                    <h2>Order Total</h2>
                    <span class="item-count"><%= itemCount %> items</span>
                </div>
                
                <div class="summary-details">
                    <div class="summary-row">
                        <span>Subtotal:</span>
                        <span>₹<%= String.format("%.2f", grandTotal) %></span>
                    </div>
                    
                    <div class="summary-row">
                        <span>Shipping:</span>
                        <% if (grandTotal > 1000) { %>
                            <span class="free-shipping">Free</span>
                        <% } else { %>
                            <span>₹99.00</span>
                        <% } %>
                    </div>
                    
                    <div class="summary-row">
                        <span>Tax (18%):</span>
                        <span>₹<%= String.format("%.2f", grandTotal * 0.18) %></span>
                    </div>
                    
                    <div class="summary-divider"></div>
                    
                    <div class="summary-row total">
                        <span>Total:</span>
                        <span>₹<%= String.format("%.2f", grandTotal + (grandTotal > 1000 ? 0 : 99.00) + (grandTotal * 0.18)) %></span>
                    </div>
                </div>
                
                <div class="summary-footer">
                    <div class="secure-checkout">
                        <i class="fas fa-lock"></i> Secure Checkout
                    </div>
                    
                    <div class="accepted-payments">
                        <p>We Accept:</p>
                        <div class="payment-icons">
                            <i class="fab fa-cc-visa"></i>
                            <i class="fab fa-cc-mastercard"></i>
                            <i class="fab fa-cc-amex"></i>
                            <i class="fab fa-cc-paypal"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <% } else { %>
            <div class="empty-cart-message">
                <div class="empty-cart-icon">
                    <i class="fas fa-shopping-cart"></i>
                </div>
                <h2>Your cart is empty</h2>
                <p>You need to add items to your cart before checking out.</p>
                <a href="${pageContext.request.contextPath}/home" class="action-btn">
                    <i class="fas fa-arrow-left"></i> Continue Shopping
                </a>
            </div>
        <% } %>
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
            <p>&copy; 2025 TechBazar. All Rights Reserved.</p>
        </div>
    </footer>
</body>
</html>