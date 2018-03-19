<%@include file="Header.jsp"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<table class="table table-dark table-striped-xl">
	<tr >
		<td colspan="4"><h3>Your Cart</h3></td>
	</tr>
	<tr>
	<td>Product ID</td>
	<td>Quantity</td>
	<td>SubTotal</td>																													
	<td>Operation</td>
	</tr>

<c:forEach items="${cartList}" var="cartItem">
	<form action="<c:url value="/updateCartItem${cartItem.cartItemId}"/>">
	<tr class="info">
		<td>${cartItem.productId}</td>
		
		<td><input type="text" name="quantity" value="${cartItem.quantity}"/></td>
		<td>${cartItem.subTotal}</td>
		<td>
<!-- 			<input type="submit" value="Update" class="btn-success"/> -->
			
			<a href="<c:url value="/deleteCartItem${cartItem.cartItemId}"/>" class="btn-btn-danger btn-block">Delete</a>
		</td>
	</tr>
	</form>
</c:forEach>
	<tr>
	
		<td colspan="2">Grand Total</td>
		<td colspan="2">Rs.${grandTotal}/-</td>
	</tr>


	<tr>
		<td colspan="2"><a href="<c:url value="/Home"/>" class="btn-btn-info">Continue Shopping</a></td>
		<td colspan="2"><a href="<c:url value="/ConfirmOrder"/>" class=btn-btn-success>Check Out</a></td>
	</tr>
</table>
<%@include file="Fotter.jsp" %>