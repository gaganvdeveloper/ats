<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee DashBoard</title>
<style>
    /* Body styling */
    body {
        font-family: Arial, sans-serif;
        background-color: #f7f9fc;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        flex-direction: column;
    }

    /* Heading styling */
    h1 {
        color: #333;
        font-size: 36px;
        margin-bottom: 20px;
    }

    h2 {
        color: #007BFF;
        font-size: 24px;
        margin-bottom: 10px;
    }

    h4 {
        color: #555;
        font-size: 18px;
        margin-bottom: 30px;
    }

    /* Message (msg) styling */
    #msg {
        background-color: #28a745; /* Green background */
        color: white; /* White text */
        padding: 10px 20px;
        border-radius: 5px;
        font-size: 18px;
        margin-bottom: 20px;
        display: inline-block;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        text-align: center;
        opacity: 1;
        transition: opacity 1s ease-out; /* Fade out transition */
    }

    /* Button container styling */
    a {
        text-decoration: none; /* Remove underline */
        margin: 10px;
    }

    /* Button styling */
    button {
        background-color: #007BFF;
        color: white;
        border: none;
        padding: 12px 30px;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    button:hover {
        background-color: #0056b3;
    }

    button:focus {
        outline: none;
    }

    /* Spacing between buttons */
    br {
        line-height: 20px;
    }

</style>
</head>
<body>
    <h1>Employee DashBoard</h1>
    <h2>${u.getName() }</h2>
    <!-- Message with green background -->
    <h4 id="msg">${msg }</h4>
    
    <a href="checkin?id=${u.getId() }"> <button>CheckIn</button> </a>
    <br>
    <br>
    <a href="checkout?id=${u.getId() }"> <button>CheckOut</button> </a>
    <br>
    <br>
    <a href="index.jsp"> <button>Logout</button> </a>

    <script>
        // Fade the message away after 2 seconds
        window.onload = function() {
            var msgElement = document.getElementById('msg');
            if (msgElement.innerText.trim() !== "") {
                // Wait for 2 seconds, then start fading the message
                setTimeout(function() {
                    msgElement.style.opacity = 0;  // Fade out the message
                }, 1000); // 2 seconds
            }
        };
    </script>
</body>
</html>
