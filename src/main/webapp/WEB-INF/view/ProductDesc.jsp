
<%@include file="/WEB-INF/view/Header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<h3 align="center">Product DESC</h3>
<div class="container">
<div class="table-responsive">
<table>
	<tr bgcolor="pink">
		<td rowspan="6">
		<img src="<c:url value="resources/ProductImage/${ProductInfo.productId}.jpg"/>" width="200" height="200"/>
		</td>
		<td>Product ID</td>
		<td>${ProductInfo.productId}</td>
	</tr>
	<tr bgcolor="grey">
		<td>Price</td>
		<td>${ProductInfo.price}</td>
	</tr>
	<tr bgcolor="grey">
		<td>Product Name</td>
		<td>${ProductInfo.productName}</td>
	</tr>
	<tr bgcolor="grey">
		<td>Category ID</td>
		<td>${categoryName}</td>
	</tr>
	<tr bgcolor="grey">
		<td>Supplier ID</td>
		<td>${ProductInfo.supplierId}</td>
	</tr>
	<tr bgcolor="grey">
		<td>Product Description</td>
		<td>${ProductInfo.prodDesc}</td>
	</tr>
	<tr>
	
	<form action="<c:url value="/addToCart${ProductInfo.productId}"/>" method="get">
	<table>
		<td>Quantity</td>
		<td>
		<select name="quantity">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
		</select>
		</td>
	</tr>
	<c:if test="${sessionScope.role=='ROLE_USER' }">
	<tr>
	<td>
	<input type="submit" value="AddtoCart">
	</td>
	</tr>
	</c:if>
<c:if test="${sessionScope.role=='ROLE_ADMIN' }">	
	<tr>
	<td><a href="<c:url value="/updateProduct${ProductInfo.productId}"/>">Update</a></td>
	</tr>
	<tr>
	<td><a href="<c:url value="/deleteProduct${ProductInfo.productId}"/>">Delete</a></td>
	</tr>
	</c:if>
</table>
</form>
</table>
</div>
</div>