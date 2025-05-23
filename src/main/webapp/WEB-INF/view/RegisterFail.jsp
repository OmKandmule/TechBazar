<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Failed</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        .container {
            max-width: 600px;
            margin: 100px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .error-message {
            text-align: center;
            margin-bottom: 20px;
        }
        .error-message h2 {
            color: #f44336;
        }
        .button-container {
            text-align: center;
        }
        .try-again-button {
            background-color: #f44336;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
        }
        .try-again-button:hover {
            background-color: #e53935;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="error-message">
            <h2>Registration Failed!</h2>
            <p>Something went wrong while processing your registration. Please try again.</p>
        </div>
        
        <div class="button-container">
            <a href="${pageContext.request.contextPath}/register" class="try-again-button">Try Again</a>
        </div>
    </div>

</body>
</html>
    