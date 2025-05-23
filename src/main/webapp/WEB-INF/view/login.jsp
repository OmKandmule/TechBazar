<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap">
<script src="${pageContext.request.contextPath}/resources/js/login.js" defer></script>
</head>
<body>                                      
    <div class="container">
        <div class="login-card">
            <div class="login-header">
                <h2>Welcome Back</h2>
                <p>Please enter your details to sign in</p>
            </div>
            <form id="loginForm" action="${pageContext.request.contextPath}/login" method="post">
                <div class="form-group">
                    <label for="email">Email</label>
                    <div class="input-container">
                        <input type="email" id="email" name="email" placeholder="Enter your email" required>
                        <span class="input-icon">✉️</span>
                    </div>
                    <span class="error-message" id="emailError"></span>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="input-container">
                        <input type="password" id="password" name="password" placeholder="Enter your password" required>
                        <span class="input-icon toggle-password">👁️</span>
                    </div>
                    <span class="error-message" id="passwordError"></span>
                </div>
                <button type="submit" class="login-button">
                    <span class="button-text">Sign In</span>
                    <span class="button-loader"></span>
                </button>
            </form>
            <div class="register-container">
                <p>Don't have an account?</p>
                <a href="register" class="register-button">Create Account</a>
            </div>
        </div>
    </div>
</body>
</html>
