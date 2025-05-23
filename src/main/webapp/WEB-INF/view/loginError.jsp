<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Error - TechBazar</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loginError.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <div class="error-card">
            <div class="logo">
                <h1>Tech<span>Bazar</span></h1>
            </div>
            
            <div class="error-icon">
                <i class="fas fa-exclamation-circle"></i>
            </div>
            
            <h2>Login Failed</h2>
            
            <p class="error-message">
                The password you entered is incorrect or this user doesn't exist.
            </p>
            
            <div class="action-buttons">
                <a href="login" class="btn primary-btn">Try Again</a>
                <a href="register" class="btn secondary-btn">Register</a>
            </div>
            
            <a href="${pageContext.request.contextPath}/" class="home-link">
                <i class="fas fa-home"></i> Return to Homepage
            </a>
        </div>
    </div>
    
    <script src="${pageContext.request.contextPath}/resources/js/loginError.js"></script>
</body>
</html>