<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        /* Body styling */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f3f4f6;
            font-family: Arial, sans-serif;
            margin: 0;
        }

        /* Login container */
        .login-container {
            width: 100%;
            max-width: 400px;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        /* Heading style */
        .login-container h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 24px;
            color: #333;
        }

        /* Form group styling */
        .form-group {
            margin-bottom: 20px;
        }

        /* Label styling */
        label {
            font-size: 14px;
            font-weight: bold;
            color: #555;
            margin-bottom: 8px;
        }

        /* Input field styling */
        input {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f9f9f9;
            color: #333;
            box-sizing: border-box;
        }

        input:focus {
            outline: none;
            border-color: #007BFF;
            background-color: #eaf4ff;
        }

        /* Button styling */
        button {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 10px;
        }

        button:hover {
            background-color: #0056b3;
        }

        /* Message styling (Popup) */
        #msg {
            position: fixed;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            background-color: rgba(255, 0, 0, 0.8);
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            font-size: 16px;
            display: none; /* Initially hidden */
            opacity: 1;
            z-index: 1000;
            transition: opacity 1s ease-out;
        }

        /* Link styling */
        a {
            color: #007BFF;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Footer link styling */
        .create-account {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }

        /* Responsive styling */
        @media (max-width: 768px) {
            .login-container {
                width: 90%;
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div id="msg">${msg }</div>
    <div class="login-container">
        <h2>Login</h2>
        <form action="login" method="POST">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">Login</button>
        </form>
        <span class="create-account">Don't Have an Account? <a href="create.jsp">Create Account</a></span>
    </div>

    <script>
        // Check if there is a message to display
        window.onload = function() {
            var msgElement = document.getElementById('msg');
            if (msgElement.innerText.trim() !== "") {
                msgElement.style.display = 'block'; // Show the message
                setTimeout(function() {
                    msgElement.style.opacity = 0; // Fade the message out
                }, 2000); // Wait 2 seconds before fading out

                // Hide the message completely after fade
                setTimeout(function() {
                    msgElement.style.display = 'none';
                    msgElement.style.opacity = 1; // Reset opacity for next use
                }, 3000); // After 3 seconds (1 second fade + 2 seconds visible)
            }
        };
    </script>
</body>
</html>
