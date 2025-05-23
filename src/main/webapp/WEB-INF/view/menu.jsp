<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.electronics.model.Products" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TechBazar - <%= request.getAttribute("categoryName") %></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="${pageContext.request.contextPath}/resources/js/menu.js" defer></script>
</head>
<body>
    <%
    String categoryId = request.getParameter("categoryId");
    String categoryName = (String) request.getAttribute("categoryName");

    if (categoryId != null && categoryName != null) {
        session.setAttribute("categoryId", categoryId);
        session.setAttribute("categoryName", categoryName);
    }
    %>

    <!-- Header -->
    <header class="header">
        <div class="header-container">
            <div class="logo">
                <a href="<%=request.getContextPath()%>/home">
                    <i class="fas fa-bolt logo-icon"></i>
                    <span>TechBazar</span>
                </a>
            </div>
            <div class="search-bar">
                <input type="text" id="searchInput" placeholder="Search in <%= request.getAttribute("categoryName") %>...">
                <button type="submit"><i class="fas fa-search"></i></button>
            </div>
            <nav class="nav-menu">
                <ul>
                    <li><a href="<%=request.getContextPath()%>/home"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="<%=request.getContextPath()%>/cart"><i class="fas fa-shopping-cart"></i> My Cart</a></li>
                    <li><a href="<%=request.getContextPath()%>/logout"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Category Banner -->
    <div class="category-banner">
        <div class="banner-content">
            <h1><%= request.getAttribute("categoryName") %></h1>
            <p>Explore our range of high-quality <%= request.getAttribute("categoryName").toString().toLowerCase() %> at the best prices</p>
        </div>
    </div>

    <!-- Filter and Sort Section -->
    <div class="filter-container">
        <div class="filter-wrapper">
            <div class="filter-group">
                <label for="sortSelect">Sort By:</label>
                <select id="sortSelect" class="filter-select">
                    <option value="featured">Featured</option>
                    <option value="price-low">Price: Low to High</option>
                    <option value="price-high">Price: High to Low</option>
                    <option value="rating">Highest Rated</option>
                </select>
            </div>
            <div class="filter-group">
                <label for="filterSelect">Filter:</label>
                <select id="filterSelect" class="filter-select">
                    <option value="all">All Products</option>
                    <option value="in-stock">In Stock</option>
                    <option value="on-sale">On Sale</option>
                </select>
            </div>
            <div class="view-toggle">
                <button id="gridView" class="view-button active"><i class="fas fa-th"></i></button>
                <button id="listView" class="view-button"><i class="fas fa-list"></i></button>
            </div>
        </div>
        <div class="results-count">
            <% 
            List<Products> products = (List<Products>) request.getAttribute("products");
            int productCount = (products != null) ? products.size() : 0;
            %>
            <p>Showing <%= productCount %> products</p>
        </div>
    </div>

    <!-- Product List -->
    <div class="product-container">
        <div id="productList" class="product-list grid-view">
            <% 
            if (products != null && !products.isEmpty()) { 
                for (Products product : products) { 
                    double rating = product.getRatings();
            %>
            <div class="product-card" data-price="<%= product.getPrice() %>" data-rating="<%= rating %>">
                <div class="product-image-container">
                    <img src="<%= request.getContextPath() + "/resources/" + product.getImgUrl() %>" alt="<%= product.getName() %>" class="product-image">
                    <div class="product-overlay">
                        <div class="overlay-buttons">
                            <button class="quick-view-btn" data-product-id="<%= product.getProductId() %>">
                                <i class="fas fa-eye"></i> Quick View
                            </button>
                        </div>
                    </div>
                </div>
                <div class="product-info">
                    <h3 class="product-name"><%= product.getName() %></h3>
                    <div class="product-rating">
                        <%
                        // Display full stars
                        for (int i = 1; i <= Math.floor(rating); i++) {
                        %>
                            <i class="fas fa-star"></i>
                        <%
                        }
                        // Display half star if needed
                        if (rating % 1 >= 0.5) {
                        %>
                            <i class="fas fa-star-half-alt"></i>
                        <%
                        }
                        // Display empty stars
                        for (int i = 1; i <= 5 - Math.ceil(rating); i++) {
                        %>
                            <i class="far fa-star"></i>
                        <%
                        }
                        %>
                        <span class="rating-text">(<%= rating %>)</span>
                    </div>
                    <div class="product-price">
                        <span class="current-price">₹<%= product.getPrice() %></span>
                        <% if (Math.random() > 0.7) { // Just for demo, showing some products with discounts %>
                            <span class="original-price">₹<%= String.format("%.2f", product.getPrice() * 1.2) %></span>
                            <span class="discount-badge">-20%</span>
                        <% } %>
                    </div>
                    <div class="product-description">
                        <p><%= product.getDescription() %></p>
                    </div>
                    <form action="<%= request.getContextPath() %>/cart/add" method="post" class="add-to-cart-form">
                        <input type="hidden" name="itemId" value="<%= product.getProductId() %>">
                        <input type="hidden" name="typeId" value="<%= product.getCategory().getId() %>">
                        <input type="hidden" name="productName" value="<%= product.getName() %>">
                        <input type="hidden" name="price" value="<%= product.getPrice() %>">
                        <input type="hidden" name="quantity" value="1">
                        <input type="hidden" name="imageUrl" value="<%= product.getImgUrl() %>">
                        <div class="product-actions">
                            <div class="quantity-selector">
                                <button type="button" class="quantity-btn minus-btn"><i class="fas fa-minus"></i></button>
                                <input type="number" name="quantity" value="1" min="1" max="10" class="quantity-input">
                                <button type="button" class="quantity-btn plus-btn"><i class="fas fa-plus"></i></button>
                            </div>
                            <button type="submit" class="add-to-cart-button">
                                <i class="fas fa-shopping-cart"></i> Add to Cart
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <% 
                }
            } 
            else { 
            %>
            <div class="no-products">
                <i class="fas fa-box-open"></i>
                <h3>No Products Found</h3>
                <p>We couldn't find any products in this category.</p>
                <a href="<%=request.getContextPath()%>/home" class="back-button">Back to Categories</a>
            </div>
            <% 
            } 
            %>
        </div>
    </div>

    <!-- Quick View Modal -->
    <div id="quickViewModal" class="modal">
        <div class="modal-content">
            <span class="close-modal">&times;</span>
            <div class="modal-body">
                <div class="modal-product-image">
                    <img id="modalProductImage" src="/placeholder.svg" alt="Product Image">
                </div>
                <div class="modal-product-details">
                    <h2 id="modalProductName"></h2>
                    <div id="modalProductRating" class="product-rating"></div>
                    <div class="modal-product-price">
                        <span id="modalProductPrice" class="current-price"></span>
                    </div>
                    <div class="modal-product-description">
                        <p id="modalProductDescription"></p>
                    </div>
                    <div class="product-specs">
                        <h4>Key Features</h4>
                        <ul id="modalProductFeatures">
                            <!-- Features will be added dynamically -->
                        </ul>
                    </div>
                    <form id="modalAddToCartForm" action="" method="post" class="modal-cart-form">
                        <input type="hidden" name="itemId" id="modalItemId" value="">
                        <input type="hidden" name="typeId" id="modalTypeId" value="">
                        <input type="hidden" name="productName" id="modalInputName" value="">
                        <input type="hidden" name="price" id="modalInputPrice" value="">
                        <input type="hidden" name="imageUrl" id="modalInputImage" value="">
                        <div class="modal-product-actions">
                            <div class="quantity-selector">
                                <button type="button" class="quantity-btn minus-btn"><i class="fas fa-minus"></i></button>
                                <input type="number" name="quantity" value="1" min="1" max="10" class="quantity-input">
                                <button type="button" class="quantity-btn plus-btn"><i class="fas fa-plus"></i></button>
                            </div>
                            <button type="submit" class="add-to-cart-button">
                                <i class="fas fa-shopping-cart"></i> Add to Cart
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Back to Top Button -->
    <button id="backToTop" class="back-to-top">
        <i class="fas fa-arrow-up"></i>
    </button>

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
            <p>&copy; 2025 TechBazar. All Rights Reserved.</p>
        </div>
    </footer>
</body>
</html>
