<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
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

<title>Cart Page</title>
<style type="text/css">
/* .tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #fff;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #f0f0f0;
}

.tg .tg-4eph {
	background-color: #f9f9f9
}
 */
 
img {
    display: block;
    max-width: 50px;
    height: auto;
    margin-left: auto;
    margin-right: auto;
}
table tr td{
    border:1px solid #FFFFFF;    
}

table tr th {
    background:#eee;    
}

.panel-shadow {
    box-shadow: rgba(0, 0, 0, 0.3) 3px 3px 3px;
}	
</style>
</head>
<body>
	<h1>Add to cart</h1>
	<form:form action="cart" method="post">
	<br>
	<h3>Cart List</h3>
	   <div class="panel-body"> 
          <div class="table-responsive">
             <table class="table" border='1'>
                <thead>
                  <tr>
                      <th>Product</th>
                      <th>Description</th>
                      <th>Qty</th>
                       <th>Price</th>
                       <th>Delete</a></th>
                      <th>SubTotal</th>
                   </tr>
                </thead>
                <tbody>
	                	<c:forEach var="c" items="${cart}">
                    <tr>
                      <td><img src= "<c:url value="/resources/images/${c.product.pname}.jpg"/>" style="width:190px;height:130px;"/></td>
                      <td><strong>Product 1</strong></td>
                      <td>
                        <form class="form-inline">
                        <input class="form-control" type="text" value="1">0
                        <button rel="tooltip" class="btn btn-default"><i class="fa fa-pencil"></i></button>
                        <a href="#" class="btn btn-primary"><i class="fa fa-trash-o"></i></a>
                        </form>
                         </td>
                                    <td></td>
                                    <td><a href="<c:url value='cart/delete?p=${c.cartid}'/>">Delete</a></td>
                                    <td></td>
                     </tr>
                                   </c:forEach>    
                                                                <tr>
                                    <td colspan="6">&nbsp;</td>
                                </tr>

                                <tr>
                                    <td colspan="4" class="text-right"><strong>Totalprice</strong></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                </div>
                <a href="/cart" class="btn btn-success"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;Continue Shopping</a>
                <a href="buy?p=1" class="btn btn-primary pull-right">Next<span class="glyphicon glyphicon-chevron-right"></span></a>

</form:form>
 </body>
</html>
	
	
	
<%-- 	<c:if test="${not empty cart}">
		<table class="tg">
			<tr>
				<tr>
							<th style="width:120">Product</th>
							<th style="width:120">Price</th>
							<th style="width:80">Quantity</th>
							<th style="width:80" class="text-center">Subtotal</th>
							<th style="width:60"></th>
						</tr>
					
				<tr>
					<c:forEach var="p" items="${products}">
						<div class="col-md-2 column productbox">
							<img src="<c:url value="/resources/images/${p.pname}.jpg"/>" style="width:200px;height:200px;"/>
						<div class="producttitle">${p.pname}</div>
						<div class="productprice">
							<div class="pricetext">${p.price}</div>
						</div>
						<div class="quantity">${p.quantity}			
							<input type="number" class="form-control text-center" value="1">
						</div>
						</div>
					</c:forEach>
				
					 <td data-th="Product">
  								<div class="row">
 									<div class="col-sm-2 hidden-xs">	
 											<img src="<c:url value="/resources/images/${p.pname}.jpg"/>" style="width:200px;height:30px;"/>
									</div>
										<h4>Product 1</h4>
										<p>xbox</p>
								</div>
					</td>
					<td data-th="Price">$1.99</td>
					<td data-th="Quantity">
						<input type="number" class="form-control text-center" value="1">
						<button class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></button>
							<button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>								
						
						<td class="actions" data-th="">
							</td>	
					</td>
					<td data-th="Subtotal" class="text-center">1.99</td>
			</tr>
	<tfoot>
						<tr class="visible-xs">
							<td class="text-center"><strong>Total 1.99</strong></td>
						</tr>
						<tr>
							<td><a href="#" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center"><strong>Total $1.99</strong></td>
							<td><a href="#" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></a></td>
						</tr>
					</tfoot>
					</table>
					</c:if>
				
	
 --%>
 	
	 <%--  <c:forEach items="${cart}" var="product">
    Name: ${product.name}, 
    Price: <fmt:formatNumber value="${product.price}" maxFractionDigits="2" />
    <br />
  </c:forEach>
 --%>	
			
			<%-- <c:forEach items="${cart}" var="Cart">
			
						<option value="${Cart.pid}">${Cart.pname}</option>
					</c:forEach>
				
				<tr>
					
			 --%>	<%-- 	<td>${cart.product.pname}</td>
					<td>${cart.product.price}</td>
					<td>${cart.quantity}</td>
					<td>${cart.totalPrice}</td>
					<td><a href="<c:url value='Cart/delete?p=${cart.product.pid}'/>">Delete</a></td>
				</tr>
				<tr>
                        <th></th>
                        <th></th>
                        <th>Grand Total</th>
                        <th>{{calGrandTotal()}}</th>
                        <th></th>
                </tr>
				 --%>
<%-- 			</c:forEach>
 --%>		</table>
		<%-- <div>
		      <a href="<spring:url value="/cart" />" class="btn btn-default">Continue Shopping</a>
		</div>
 --%>	