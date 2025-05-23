<%@ page import="java.util.*, com.electronics.model.Order, com.electronics.model.OrderItem,
com.electronics.model.Products" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Orders - TechBazar</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myOrders.css">
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-container">
            <div class="logo">
                <i class="fas fa-microchip logo-icon"></i>
                TechBazar
            </div>
            <nav class="nav-menu">
                <ul>
                    <li><a href="home"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="cart"><i class="fas fa-shopping-cart"></i> Cart</a></li>
                    <li><a href="myOrders" class="active"><i class="fas fa-box"></i> My Orders</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Main Content -->
    <div class="main-container">
        <div class="page-header">
            <h1><i class="fas fa-box-open"></i> My Orders</h1>
            <p>Track and manage your order history</p>
        </div>

        <div class="orders-container">
            <%
                List<Order> orders = (List<Order>) request.getAttribute("orders");

                if (orders != null && !orders.isEmpty()) {
                    for (Order order : orders) {
                        String statusClass = "";
                        String statusIcon = "";
                        
                        // Set status class and icon based on order status
                        if (order.getStatus().equalsIgnoreCase("delivered")) {
                            statusClass = "status-delivered";
                            statusIcon = "fa-check-circle";
                        } else if (order.getStatus().equalsIgnoreCase("processing")) {
                            statusClass = "status-processing";
                            statusIcon = "fa-clock";
                        } else if (order.getStatus().equalsIgnoreCase("shipped")) {
                            statusClass = "status-shipped";
                            statusIcon = "fa-shipping-fast";
                        } else if (order.getStatus().equalsIgnoreCase("cancelled")) {
                            statusClass = "status-cancelled";
                            statusIcon = "fa-times-circle";
                        } else {
                            statusClass = "status-pending";
                            statusIcon = "fa-hourglass-half";
                        }
            %>
                <div class="order-card">
                    <div class="order-header">
                        <div class="order-info">
                            <h2>Order #<%= order.getId() %></h2>
                            <span class="order-date"><i class="far fa-calendar-alt"></i> <%= order.getOrderDate() %></span>
                        </div>
                        <div class="order-status <%= statusClass %>">
                            <i class="fas <%= statusIcon %>"></i> <%= order.getStatus() %>
                        </div>
                    </div>
                    
                    <div class="order-items">
                        <% for (OrderItem item : order.getOrderItems()) { %>
                            <div class="order-item">
                                <div class="item-image">
                                    <img src="<%= request.getContextPath() %>/resources/<%= item.getProduct().getImgUrl()%>" alt="<%= item.getProduct().getName() %>">
                                </div>
                                <div class="item-details">
                                    <h3><%= item.getProduct().getName() %></h3>
                                    <div class="item-meta">
                                        <span class="item-quantity">Qty: <%= item.getQuantity() %></span>
                                        <span class="item-price">$<%= item.getPrice() %></span>
                                    </div>
                                </div>
                            </div>
                        <% } %>
                    </div>
                    
                    <div class="order-footer">
                        <button class="btn-track" data-order-id="<%= order.getId() %>">
                            <i class="fas fa-map-marker-alt"></i> Track Order
                        </button>
                        <button class="btn-details" data-order-id="<%= order.getId() %>">
                            <i class="fas fa-info-circle"></i> View Details
                        </button>
                    </div>
                </div>
            <%
                    }
                } else {
            %>
                <div class="empty-orders">
                    <div class="empty-icon">
                        <i class="fas fa-shopping-bag"></i>
                    </div>
                    <h2>No Orders Found</h2>
                    <p>You haven't placed any orders yet. Start shopping to see your orders here!</p>
                    <a href="menu.jsp" class="btn-shop">
                        <i class="fas fa-shopping-cart"></i> Start Shopping
                    </a>
                </div>
            <% } %>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-column">
                <div class="footer-logo">
                    <i class="fas fa-microchip"></i> TechBazar
                </div>
                <p>Your one-stop shop for all electronics and tech gadgets. Quality products at competitive prices.</p>
            </div>
            <div class="footer-column">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="menu.jsp">Products</a></li>
                    <li><a href="cart.jsp">Cart</a></li>
                    <li><a href="myorders.jsp">My Orders</a></li>
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
            <p>&copy; 2023 TechBazar. All Rights Reserved.</p>
        </div>
    </footer>

    <!-- Order Tracking Modal -->
    <div id="trackingModal" class="modal">
        <div class="modal-content">
            <span class="close-modal">&times;</span>
            <div class="tracking-header">
                <h2>Order Tracking</h2>
                <p>Order #<span id="trackingOrderId"></span></p>
            </div>
            <div class="tracking-timeline">
                <div class="timeline-item active">
                    <div class="timeline-icon">
                        <i class="fas fa-check"></i>
                    </div>
                    <div class="timeline-content">
                        <h3>Order Placed</h3>
                        <p>Your order has been received</p>
                        <span class="timeline-date">May 20, 2023</span>
                    </div>
                </div>
                <div class="timeline-item active">
                    <div class="timeline-icon">
                        <i class="fas fa-check"></i>
                    </div>
                    <div class="timeline-content">
                        <h3>Processing</h3>
                        <p>Your order is being processed</p>
                        <span class="timeline-date">May 21, 2023</span>
                    </div>
                </div>
                <div class="timeline-item">
                    <div class="timeline-icon">
                        <i class="fas fa-box"></i>
                    </div>
                    <div class="timeline-content">
                        <h3>Shipped</h3>
                        <p>Your order has been shipped</p>
                        <span class="timeline-date">Pending</span>
                    </div>
                </div>
                <div class="timeline-item">
                    <div class="timeline-icon">
                        <i class="fas fa-truck"></i>
                    </div>
                    <div class="timeline-content">
                        <h3>Out for Delivery</h3>
                        <p>Your order is out for delivery</p>
                        <span class="timeline-date">Pending</span>
                    </div>
                </div>
                <div class="timeline-item">
                    <div class="timeline-icon">
                        <i class="fas fa-home"></i>
                    </div>
                    <div class="timeline-content">
                        <h3>Delivered</h3>
                        <p>Your order has been delivered</p>
                        <span class="timeline-date">Pending</span>
                    </div>
                </div>
            </div>
            <div class="tracking-footer">
                <p>Estimated delivery: May 25, 2023</p>
                <button class="btn-contact">
                    <i class="fas fa-headset"></i> Contact Support
                </button>
            </div>
        </div>
    </div>

    <!-- Order Details Modal -->
    <div id="detailsModal" class="modal">
        <div class="modal-content">
            <span class="close-modal">&times;</span>
            <div class="details-header">
                <h2>Order Details</h2>
                <p>Order #<span id="detailsOrderId"></span></p>
            </div>
            <div class="details-content">
                <div class="details-section">
                    <h3>Shipping Information</h3>
                    <div class="details-info">
                        <p><strong>Name:</strong> John Doe</p>
                        <p><strong>Address:</strong> 123 Tech Street, Silicon Valley, CA 94043</p>
                        <p><strong>Phone:</strong> (123) 456-7890</p>
                        <p><strong>Email:</strong> john.doe@example.com</p>
                    </div>
                </div>
                <div class="details-section">
                    <h3>Payment Information</h3>
                    <div class="details-info">
                        <p><strong>Payment Method:</strong> Credit Card</p>
                        <p><strong>Card:</strong> **** **** **** 1234</p>
                        <p><strong>Billing Address:</strong> Same as shipping</p>
                    </div>
                </div>
                <div class="details-section">
                    <h3>Order Summary</h3>
                    <div class="summary-table">
                        <div class="summary-row">
                            <span>Subtotal:</span>
                            <span>$599.98</span>
                        </div>
                        <div class="summary-row">
                            <span>Shipping:</span>
                            <span>$9.99</span>
                        </div>
                        <div class="summary-row">
                            <span>Tax:</span>
                            <span>$36.00</span>
                        </div>
                        <div class="summary-divider"></div>
                        <div class="summary-row total">
                            <span>Total:</span>
                            <span>$645.97</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="details-footer">
                <button class="btn-download">
                    <i class="fas fa-file-pdf"></i> Download Invoice
                </button>
                <button class="btn-reorder">
                    <i class="fas fa-redo"></i> Reorder
                </button>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/resources/js/myOrders.js"></script>
</body>
</html>
