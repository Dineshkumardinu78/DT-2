<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<title>Shopping</title>
</head>
<body>
	<div id="header">
		<h2 style="text-align: center;">
			xbox stores
		</h2>
		
	</div>
	<div style="float: right; position: fixed; top: 0px; right: 90px;">
	<c:if test="${not empty Welcome}">
		Welcome ${Welcome.firstname} ${Welcome.lastname}!!
	</c:if>
	</div>
	<div style="float: right; position: fixed; top: 0px; right: 20px;">
		<a href="logout"><span class="glyphicon glyphicon-user"></span>logout</a>
	</div>
	<div id="menu"  style="text-align: center;">
		<a href="home" class="btn btn-info btn-sm">Home</a>
		<a href="about" class="btn btn-info btn-sm">About Us</a>
		<a href="deals" class="btn btn-info btn-sm">Today's Deals</a>
		<a href="contact" class="btn btn-info btn-sm">Contact Us</a>
	</div>
</body>
</html>