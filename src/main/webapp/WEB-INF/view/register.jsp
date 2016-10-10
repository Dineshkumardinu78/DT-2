<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Register</title>
<style type="text/css">

body{
padding:30px;
}

.mycolor {
	color: #72c02c;
}

.myborder {
	padding: 20px;;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: 0px 0px 3px 0px #72c02c;
	-moz-box-shadow: 0px 0px 3px 0px #72c02c;
	box-shadow: 0px 0px 3px 0px #72c02c;
}

.mybutton {
	position: relative;
	left: 50%;
	top: 193px;
}

.margin-bottom-20 {
	margin-bottom: 20px;
}

.btn-u:hover {
	background: #5fb611;
}

.btn-u:hover, .btn-u:focus, .btn-u:active, .btn-u.active, .open .dropdown-toggle.btn-u
	{
	background: #5fb611;
}

.btn-u:hover {
	color: #fff;
	text-decoration: none;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}

.btn-u {
	background: #72c02c;
}

.btn-u {
	white-space: nowrap;
	border: 0;
	color: #fff;
	font-size: 14px;
	cursor: pointer;
	font-weight: 400;
	padding: 6px 13px;
	position: relative;
	background: #72c02c;
	display: inline-block;
	text-decoration: none;
}

.input-group-addon {
	border-right: 0;
	/*color: #b3b3b3;*/
	font-size: 14px;
	background: #fff;
	padding: 6px 12px;
	font-size: 14px;
	font-weight: 400;
	line-height: 1;
	color: #555;
	text-align: center;
	background-color: #eee;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.input-group .form-control {
	float: left;
	width: 100%;
	margin-bottom: 0;
}

.form-control {
	box-shadow: none;
}

.form-control {
	display: block;
	width: 100%;
	height: 34px !important;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.428571429;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #72c02c !important;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, box-shadow
		ease-in-out .15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}
</style>
</head>
<body>
	
	<form:form action="store" method="post">
	 <c:forEach var="e" items="${errors}">
		<li>${e.getDefaultMessage()}" </li>
	</c:forEach>
		<label for="firstName" class="sr-only">Your Name</label>
		<div class="input-group margin-bottom-20">
			<span class="input-group-addon"><i
				class="glyphicon glyphicon-user mycolor"></i></span>
			<form:input path='firstname' id="Firstname" class="form-control" placeholder="Firstname" required="true"/>
			    </div>
				<br>
	<div class="input-group margin-bottom-20">
			<span class="input-group-addon"><i	class="glyphicon glyphicon-lock mycolor"></i></span>
			<form:input path='lastname' id="Lastname" class="form-control"	placeholder="lastname" required="true"/>
		</div>
		<br>
		<div class="input-group margin-bottom-20">
			<span class="input-group-addon"><i
				class="glyphicon glyphicon-user mycolor"></i></span>
			<form:input path='mail' id="Mail" class="form-control"	placeholder="Enter mail id" required="true" title="valid mail is required"/>
			</div>
		<br>
		<div class="input-group margin-bottom-20">
			<span class="input-group-addon"><i
				class="glyphicon glyphicon-user mycolor"></i></span>
			<form:input path='pwd' id="pwd" class="form-control" type="password" placeholder="Enter your password" required="true"/>
		</div>
		<br>
		<div class="input-group margin-bottom-20">
			<span class="input-group-addon"><i
				class="glyphicon glyphicon-envelope mycolor"></i></span>
			<form:input path='address' id="address" class="form-control" placeholder="address" required="true" />
		</div>
		<br>
		<div class="input-group margin-bottom-20">
			<span class="input-group-addon"><i
				class="glyphicon glyphicon-phone mycolor"></i></span>
			<form:input path='ph' id="contact" class="form-control"	placeholder="contact" required="true"/>
			
		</div>
		<br>

		<div style="margin-top: 10px" class="form-group">
		<center>
			<div class="col-sm-12 controls">
				<input type="submit" value="Register"/>
			</div>
			</center>
		</div>
	</form:form>
</body>
</html>