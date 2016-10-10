<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>xbox</title>
<style>

.carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 100%;
      margin: auto;
  }
  .container-fluid{
  }
  </style>

</head>
<body>
	<%@include file="header.jsp"%>
	<div>
		<c:if test="${not empty Welcome}">
			Welcome ${Welcome.firstname} ${Welcome.lastname}!!
		</c:if>
		<c:if test="${userRole=='isAdmin'}">
			<%@include file="adminpg.jsp"%>
		</c:if>
		<c:if test="${userRole=='isSupplier'}">
			<%@include file="confirm.jsp"%>
		</c:if>
		<c:if test="${login==true}">
			<%@include file="login.jsp"%>
		</c:if>
		<c:if test="${register==true}">
			<%@include file="register.jsp"%>
		</c:if>
	</div>
	<div class="container-fluid" >
	<div class="row">
			<div class="col-md-4">
				<div class="list-group">
				<c:forEach var="c" items="${Categorys}">
					<a href="products?c=${c.cid}" class="list-group-item"> ${c.cname}</a> 
				</c:forEach>
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
        <img src="D:\workspace\cart\src\main\webapp\resources\images\mortal kombat.jpg" alt="Fighting" width="660" height="345">
      </div>

      <div class="item">
        <img src="D:\workspace\cart\src\main\webapp\resources\images\ashes cricket 2009.jpg" alt="Cricket" width="660" height="345">
      </div>
    
      <div class="item">
        <img src="D:\workspace\cart\src\main\webapp\resources\images\2013_batman_arkham_origins.jpg" alt="Shooting" width="660" height="345">
      </div>

      <div class="item">
        <img src="<c:url value="D:\workspace\cart\src\main\webapp\resources\images\Asphalt7heat.jpg"/>" alt="Action" width="660" height="345">
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
</html>