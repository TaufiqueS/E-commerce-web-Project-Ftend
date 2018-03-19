
<%@include file="/WEB-INF/view/Header.jsp" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<h3 align="center">Product Page</h3>
<div class="container">
<div class="table-responsive">
<table class="table table-striped" align="center">
	<tr bgcolor="pink">
		<td colspan="3">Product Detail </td>	
	</tr>
	<div class="container">
	<table class="table table-bordered">
	
	<c:forEach items="${listProducts}" var="product">
	<tr>
	<td>${product.productId}</td>
	<td>${product.productName }</td>
	
		<td>
			<img src="<c:url value="resources/ProductImage/${product.productId}.jpg"/>" width="350" height="200"/>
		<br>
		<br>
			<a href="<c:url value="/ProductDesc${product.productId}"/>">${product.productName}</a>
			<br>INR. ${product.price} /-
		</td>
		
	

	</tr>
	</c:forEach>
	</table>
</table>
</div>
</div>

<jsp:include page="Fotter.jsp"></jsp:include>