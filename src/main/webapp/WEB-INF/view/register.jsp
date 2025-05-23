<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TechBazar - Create Account</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/register.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
    <script src="${pageContext.request.contextPath}/resources/js/register.js" defer></script>
</head>           
<body>
    <div class="container">
        <div class="register-card">
            <div class="brand">
                <div class="logo">
                    <span class="logo-icon">⚡</span>
                    <span class="logo-text">TechBazar</span>
                </div>
                <h1>Create Your Account</h1>
                <p>Join TechBazar and discover the latest in tech</p>
            </div>
            
            <form id="registerForm" action="${pageContext.request.contextPath}/register" method="post">
                <div class="form-row">
                    <div class="form-group">
                        <label for="firstName">First Name</label>
                        <div class="input-container">
                            <input type="text" id="firstName" name="firstName" placeholder="John" required />
                            <span class="input-icon">👤</span>
                        </div>
                        <span class="error-message" id="firstNameError"></span>
                    </div>
                    
                    <div class="form-group">
                        <label for="lastName">Last Name</label>
                        <div class="input-container">
                            <input type="text" id="lastName" name="lastName" placeholder="Doe" required />
                            <span class="input-icon">👤</span>
                        </div>
                        <span class="error-message" id="lastNameError"></span>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="mobile">Mobile Number</label>
                    <div class="input-container">
                        <input type="tel" id="mobile" name="mobile" placeholder="(123) 456-7890" required />
                        <span class="input-icon">📱</span>
                    </div>
                    <span class="error-message" id="mobileError"></span>
                </div>
                
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <div class="input-container">
                        <input type="email" id="email" name="email" placeholder="john.doe@example.com" required />
                        <span class="input-icon">✉️</span>
                    </div>
                    <span class="error-message" id="emailError"></span>
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="input-container">
                        <input type="password" id="password" name="password" placeholder="Create a strong password" required />
                        <span class="input-icon toggle-password">👁️</span>
                    </div>
                    <span class="error-message" id="passwordError"></span>
                    <div class="password-strength">
                        <div class="strength-meter">
                            <div class="strength-segment" id="segment1"></div>
                            <div class="strength-segment" id="segment2"></div>
                            <div class="strength-segment" id="segment3"></div>
                            <div class="strength-segment" id="segment4"></div>
                        </div>
                        <span class="strength-text" id="strengthText">Password strength</span>
                    </div>
                </div>
                
                <div class="form-group terms">
                    <label class="checkbox-container">
                        <input type="checkbox" id="terms" name="terms" required />
                        <span class="checkmark"></span>
                        <span class="terms-text">I agree to TechBazar's <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a></span>
                    </label>
                    <span class="error-message" id="termsError"></span>
                </div>
                
                <button type="submit" class="register-button">
                    <span class="button-text">Create Account</span>
                </button>
            </form>
            
            <div class="login-link">
                <p>Already have an account?</p>
                <a href="login" class="login-button">Sign In</a>
            </div>
        </div>
        
        <div class="tech-decoration">
            <div class="circuit-line line1"></div>
            <div class="circuit-line line2"></div>
            <div class="circuit-line line3"></div>
            <div class="circuit-dot dot1"></div>
            <div class="circuit-dot dot2"></div>
            <div class="circuit-dot dot3"></div>
        </div>
    </div>
</body>
</html>
