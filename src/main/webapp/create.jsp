<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create A New Account - ATS Application</title>
    <style>
        /* General Body Styling */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        /* Centered container for form */
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Form styling */
        .form-container {
            background: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }

        /* Heading styling */
        .form-container h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
            font-size: 28px;
        }

        /* Form group styling */
        .form-group {
            margin-bottom: 20px;
            display: flex;
            flex-direction: column;
        }

        label {
            font-size: 16px;
            margin-bottom: 8px;
            color: #555;
        }

        input[type="text"], input[type="password"], select {
            padding: 12px;
            font-size: 16px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-bottom: 15px;
            background-color: #f9f9f9;
        }

        input[type="text"]:focus, input[type="password"]:focus, select:focus {
            outline: none;
            border-color: #007BFF;
            background-color: #eaf4ff;
        }

        /* Button styling */
        button {
            width: 100%;
            padding: 12px;
            font-size: 18px;
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

        /* Link styling */
        .login-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }

        .login-link a {
            color: #007BFF;
            text-decoration: none;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .form-container {
                padding: 20px;
            }
        }

    </style>
</head>
<body>

    <div class="container">
        <div class="form-container">
            <h2>Enter Details to Register</h2>
            <form action="create" method="post">
                <div class="form-group">
                    <label for="name">Full Name:</label>
                    <input type="text" name="name" required>
                </div>

                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" name="username" required>
                </div>

                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" name="password" required>
                </div>

                <div class="form-group">
                    <label for="role">Role:</label>
                    <select name="role">
                        <option value="EMPLOYEE">-----select-----</option>
                        <option value="ADMIN">ADMIN</option>
                        <option value="EMPLOYEE">EMPLOYEE</option>
                    </select>
                </div>

                <button type="submit">Register</button>
            </form>

            <div class="login-link">
                <span>Already have an account? <a href="index.jsp">Login Here</a></span>
            </div>
        </div>
    </div>

</body>
</html>
