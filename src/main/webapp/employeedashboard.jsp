<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee DashBoard</title>
</head>
<body>
	<h1>Employee DashBoard</h1>
	<h2>${u }</h2>
	
	<a href="checkin?id=${u.getId() }"> <button>CheckIn</button> </a>
	<br>
	<br>
	<a href="checkout?id=${u.getId() }"> <button>CheckOut</button> </a>
	<br>
	<br>
	<a href="index.jsp"> <button>Logout</button> </a>
		
</body>
</html>