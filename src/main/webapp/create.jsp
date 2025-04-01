<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
</head>
<body>
    <h2>Register</h2>
    
   

    <form action="create" method="post">
        <label for="name">Full Name:</label>
        <input type="text" name="name" required><br>

        <label for="username">Username:</label>
        <input type="text" name="username" required><br>

        <label for="password">Password:</label>
        <input type="password" name="password" required><br>

        <label for="role">Role:</label>
        <select name="role">
           <option value="EMPLOYEE">------Select------</option>
           <option value="EMPLOYEE">EMPLOYEE</option>
           <option value="ADMIN">ADMIN</option>
        </select><br>

        <button type="submit">Register</button>
    </form>
</body>
</html>
