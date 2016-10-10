<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<title>Shopping</title>
<style>

.carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 100%;
      margin: auto;
  }
  .container-fluid{
  }
</style>
<body>
	<div class="header">
		<%@include file="header.jsp"%>
	</div>
	<hr color="blue"></hr>
	<c:if test="${not empty Welcome}">
		Welcome ${Welcome.firstname} ${Welcome.lastname}!!
	</c:if>
	${userRole}
		<c:if test="${userRole=='isAdmin'}">
			<%@include file="adminpg.jsp" %>
		</c:if>
		<c:if test="${userRole=='isSupplier'}">
			<%@include file="confirm.jsp" %>
		</c:if>
	<c:if test="${login==true}">
		<%@include file="login.jsp" %>
	</c:if>
	<c:if test="${register==true}">
		<%@include file="register.jsp" %>
	</c:if>
	<div class="container-fluid" >
	<div class="row">
			<div class="col-md-4">
				<div class="list-group">
					<a href="products?c=101" class="list-group-item"> Actiongames</a> 
					<a href="products?c=102" class="list-group-item">Racinggames</a>
					<a href="products?c=103" class="list-group-item">Shootinggames </a> 
					<a href="products?c=104" class="list-group-item">Fightinggames </a>
					<a href="products?c=105" class="list-group-item">Cricketgames </a>
				</div>
			</div>
			<div class="col-md-8">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="D:\workspace\cart\src\main\webapp\resources\images\ashes cricket 2009.jpg" alt="Cricket" width="260" height="345">
      </div>

      <div class="item">
        <img src='<c:url value="D:\workspace\cart\src\main\webapp\resources\images\2013_batman_arkham_origins.jpg"/>' alt="Action" width="260" height="345">
      </div>
    
      <div class="item">
        <img src="<c:url value="D:\workspace\cart\src\main\webapp\resources\images\Asphalt7heat.jpg"/>" alt="Shooting" width="460" height="345">
      </div>

      <div class="item">
        <img src="<c:url value="D:\workspace\cart\src\main\webapp\resources\images\mortal kombat.jpg"/>" alt="Fighting" width="260" height="345">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
			</div>
	</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</head>
</html>