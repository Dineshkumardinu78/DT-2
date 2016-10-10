<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
<title>Login</title>
<style>
body{
padding:30px;
}
</style>
</head>
<body>
	<form:form action="LoginUser">
	<center>
		<div class="input-group margin-bottom-20">
			<span class="input-group-addon"><i class="glyphicon glyphicon-user mycolor"></i></span>
			<form:input path='mail' id="mail" class="form-control" placeholder="Enter Mail id" required="true"/>
		</div>
		<br/>
		<div class="input-group margin-bottom-20">
			<span class="input-group-addon"><i class="glyphicon glyphicon-user mycolor"></i></span>
			<form:input path='pwd' id="pwd" class="form-control" type="password" placeholder="Enter your password" required="true" />
		</div>
		<br/>
		<div style="margin-top: 5px" class="form-group">
			<div class="col-sm-12 controls">
				<form:button>submit</form:button>
			</div>
		</div>
		<br> <br>
		<center>
			<p class="message">
				Not Registered? <a href="register" class="">Register here</a>
			</p>
		</center>
		</div>
		</div>
	</center>
	</form:form>
</body>
</html>