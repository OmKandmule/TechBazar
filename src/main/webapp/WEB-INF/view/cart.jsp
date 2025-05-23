<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.electronics.daoimpl.Cart" %>
<%@ page import="com.electronics.model.CartItem" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TechBazar - Your Shopping Cart</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cart.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="${pageContext.request.contextPath}/resources/js/cart.js" defer></script>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-container">
            <div class="logo">
                <a href="<%=request.getContextPath()%>/home">
                    <i class="fas fa-bolt logo-icon"></i>
                    <span>TechBazar</span>
                </a>
            </div>
            <nav class="nav-menu">
                <ul>
                    <li><a href="<%=request.getContextPath()%>/home"><i class="fas fa-home"></i> Home</a></li>
                    <li class="active"><a href="<%=request.getContextPath()%>/cart"><i class="fas fa-shopping-cart"></i> My Cart</a></li>
                    <li><a href="<%=request.getContextPath()%>/logout"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Main Content -->
    <div class="main-container">
        <div class="page-title">
            <h1>Your Shopping Cart</h1>
            <p>Review your items and proceed to checkout</p>
        </div>

        <% 
            Cart cart = (Cart) session.getAttribute("cart");
            Map<Integer, CartItem> items = (cart != null) ? cart.getItems() : new HashMap<>();
            double totalAmount = 0;
            int itemCount = 0;
            
            for (CartItem item : items.values()) {
                totalAmount += item.getPrice() * item.getQuantity();
                itemCount += item.getQuantity();
            }
        %>

        <div class="cart-container">
            <% if (items.isEmpty()) { %>
                <div class="empty-cart">
                    <div class="empty-cart-icon">
                        <i class="fas fa-shopping-cart"></i>
                    </div>
                    <h2>Your cart is empty</h2>
                    <p>Looks like you haven't added any products to your cart yet.</p>
                    <a href="<%=request.getContextPath()%>/home" class="continue-shopping-btn">
                        <i class="fas fa-arrow-left"></i> Continue Shopping
                    </a>
                </div>
            <% } else { %>
                <div class="cart-content">
                    <div class="cart-items">
                        <div class="cart-header">
                            <div class="header-product">Product</div>
                            <div class="header-price">Price</div>
                            <div class="header-quantity">Quantity</div>
                            <div class="header-total">Total</div>
                            <div class="header-action"></div>
                        </div>

                        <% for (CartItem item : items.values()) { %>
                            <div class="cart-item" data-item-id="<%= item.getItemId() %>">
                                <div class="item-product">
                                    <!-- Fixed image path to use resources instead of images -->
                                    <img src="<%= request.getContextPath() + "/resources/" + item.getImageUrl() %>" 
                                         alt="<%= item.getProductName() %>" 
                                         onerror="this.src='<%=request.getContextPath()%>/resources/placeholder.jpg'">
                                    <div class="item-details">
                                        <h3><%= item.getProductName() %></h3>
                                        <p class="item-id">Item ID: <%= item.getItemId() %></p>
                                    </div>
                                </div>
                                <div class="item-price">
                                    <span class="price-value">₹<%= String.format("%.2f", item.getPrice()) %></span>
                                </div>
                                <div class="item-quantity">
                                    <div class="quantity-control">
                                        <form action="<%= request.getContextPath() %>/cart/decrease" method="post" class="quantity-form decrease-form">
                                            <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                                            <button type="submit" class="quantity-btn decrease-btn" <%= item.getQuantity() <= 1 ? "disabled" : "" %>>
                                                <i class="fas fa-minus"></i>
                                            </button>
                                        </form>
                                        <span class="quantity-value"><%= item.getQuantity() %></span>
                                        <form action="<%= request.getContextPath() %>/cart/increase" method="post" class="quantity-form increase-form">
                                            <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                                            <button type="submit" class="quantity-btn increase-btn">
                                                <i class="fas fa-plus"></i>
                                            </button>
                                        </form>
                                    </div>
                                </div>
                                <div class="item-total">
                                    <span class="total-value">₹<%= String.format("%.2f", item.getPrice() * item.getQuantity()) %></span>
                                </div>
                                <div class="item-action">
                                    <form action="<%= request.getContextPath() %>/cart/remove" method="post" class="remove-form">
                                        <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                                        <button type="submit" class="remove-btn" title="Remove item">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </form>
                                </div>
                            </div>
                        <% } %>
                    </div>

                    <div class="cart-summary">
                        <h2>Order Summary</h2>
                        <div class="summary-row">
                            <span>Items (<%= itemCount %>):</span>
                            <span>₹<%= String.format("%.2f", totalAmount) %></span>
                        </div>
                        <div class="summary-row">
                            <span>Shipping:</span>
                            <span>₹<%= String.format("%.2f", totalAmount > 1000 ? 0.00 : 99.00) %></span>
                        </div>
                        <% if (totalAmount > 1000) { %>
                            <div class="summary-row discount">
                                <span>Free Shipping:</span>
                                <span>-₹99.00</span>
                            </div>
                        <% } %>
                        <div class="summary-row tax">
                            <span>Estimated Tax:</span>
                            <span>₹<%= String.format("%.2f", totalAmount * 0.18) %></span>
                        </div>
                        <div class="summary-divider"></div>
                        <div class="summary-row total">
                            <span>Order Total:</span>
                            <span>₹<%= String.format("%.2f", totalAmount + (totalAmount > 1000 ? 0 : 99.00) + (totalAmount * 0.18)) %></span>
                        </div>
                        <a href="<%= request.getContextPath() %>/checkout" class="checkout-btn">
                            Proceed to Checkout <i class="fas fa-arrow-right"></i>
                        </a>
                        <div class="payment-methods">
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

                <div class="cart-actions">
                    <%
                        String catId = (String) session.getAttribute("categoryId");
                        String catName = (String) session.getAttribute("categoryName");
                    %>
                    <a href="<%= request.getContextPath() %>/menu?categoryId=<%= catId %>&categoryName=<%= catName %>" class="action-btn continue-btn">
                        <i class="fas fa-arrow-left"></i> Continue Shopping
                    </a>
                    <a href="<%=request.getContextPath()%>/home" class="action-btn browse-btn">
                        <i class="fas fa-th"></i> Browse Categories
                    </a>
                </div>
            <% } %>
        </div>

        <!-- Recently Viewed Section (Optional) -->
        <div class="recently-viewed">
            <h2>Recently Viewed</h2>
            <div class="product-slider">
                <!-- This would be populated with actual recently viewed products -->
                <div class="product-card">
                    <img src="<%=request.getContextPath()%>/resources/placeholder.jpg" alt="Product">
                    <h3>Smartphone Pro</h3>
                    <div class="product-price">₹24,999.00</div>
                    <button class="add-to-cart-mini">Add to Cart</button>
                </div>
                <div class="product-card">
                    <img src="<%=request.getContextPath()%>/resources/placeholder.jpg" alt="Product">
                    <h3>Wireless Earbuds</h3>
                    <div class="product-price">₹3,999.00</div>
                    <button class="add-to-cart-mini">Add to Cart</button>
                </div>
                <div class="product-card">
                    <img src="<%=request.getContextPath()%>/resources/placeholder.jpg" alt="Product">
                    <h3>Smart Watch</h3>
                    <div class="product-price">₹8,499.00</div>
                    <button class="add-to-cart-mini">Add to Cart</button>
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
                    <li><a href="<%=request.getContextPath()%>/home">Home</a></li>
                    <li><a href="<%=request.getContextPath()%>/cart">My Cart</a></li>
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
