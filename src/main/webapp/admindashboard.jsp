<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administrator DashBoard</title>
<style type="text/css">
    /* General styling */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 20px;
    }

    h1 {
        color: #333;
        text-align: center;
    }

    h2 {
        color: #555;
        text-align: center;
        margin-bottom: 20px;
    }

    /* Table styling */
    table {
        width: 80%;
        margin: 0 auto;
        border-collapse: collapse;
        background-color: #fff;
    }

    th, td {
        padding: 10px 20px;
        text-align: center;
        border: 1px solid #ddd;
    }

    th {
        background-color: #4CAF50;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #ddd;
    }

    /* Cell styling */
    td {
        font-size: 14px;
    }

    /* Style for the table caption */
    table caption {
        font-size: 1.5em;
        font-weight: bold;
        margin-bottom: 15px;
    }

    /* Responsive design */
    @media (max-width: 768px) {
        table {
            width: 100%;
        }
    }
    
    /* Profile logout styling */
    .profile {
        float: right;
        font-size: 18px;
        color: #333;
        text-decoration: none;
        margin-right: 20px;
    }
    
    /* Additional link styling */
    .profile h4 {
        margin: 0;
        font-size: 20px;
        color: #007BFF;
        cursor: pointer;
    }
    
    .profile:hover h4 {
        text-decoration: underline;
    }

    /* Search form styling */
    form {
        text-align: center;
        margin-top: 20px;
    }

    label {
        font-size: 16px;
        margin-right: 10px;
    }

    input[type="text"] {
        padding: 5px;
        font-size: 14px;
        width: 150px;
    }

    button {
        padding: 5px 10px;
        font-size: 14px;
        cursor: pointer;
        background-color: #4CAF50;
        color: white;
        border: none;
        margin-left: 10px;
    }

    button:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
    <%-- <h3 class="profile">${u.getName() } </h3> --%>
    <!-- <br> -->
    <a class="profile" href="index.jsp"> <h4>Logout</h4>  </a>
    
    
    <h1>Administrator DashBoard</h1>
    
    <h2>Attendance Details of  ${al.getFirst().getDate() }</h2>
    <form action="search?id=${u.getId() }" method="post">
        <label>View Attendance By Date : </label> 
        <input type="text" name="date" placeholder="YYYY-MM-DD"> 
        <button>Search</button>
    </form>
    <br>
    <table border="1" cellpadding="10" cellspacing="10">
        <tr>
            <th>Name</th>
            <th>Check-In Time</th>
            <th>Check-Out Time</th>
            <th>Total Working Hours</th>
        </tr>
        <c:forEach var="a" items="${al }">
            <tr>
                <td>${a.getUser().getName() }</td>
                <td>${a.getCheckIn() }</td>
                <td>${a.getCheckOut() }</td>
                <td>${a.getTotalWorkHours() }</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
