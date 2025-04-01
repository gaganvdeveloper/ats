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
    
    .profile{
    	float: right;
    }
</style>
</head>
<body>
    <%-- <h3 class="profile">${u.getName() } </h3> --%>
    <!-- <br> -->
	<a class="profile" href="index.jsp"> <h4>Logout</h4>  </a>
	 <a href="create.jsp">Create Account</a>
    <h1>Administrator DashBoard</h1>
    
    <h2>Attendance Details of  ${al.getFirst().getDate() }</h2>
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
