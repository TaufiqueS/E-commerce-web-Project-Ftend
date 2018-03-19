<%@include file="/WEB-INF/view/Header.jsp"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<table class="table table-dark table-striped-xl">
	<tr >
		<td colspan="3"><h3>Your Cart</h3></td>
	</tr>
	<tr>
	<td>Product ID</td>
	<td>Quantity</td>
	<td>SubTotal</td>
	</tr>

<c:forEach items="${cartList}" var="cartItem">
	
	<tr class="info">
	
		<td>${cartItem.productId}</td>
		
		<td>${cartItem.quantity}</td>
		<td>${cartItem.subTotal}</td>
		
		
	</tr>
	
</c:forEach>
	<tr>
	
		<td colspan="2">Grand Total</td>
		<td colspan="2">Rs.${grandTotal}/-</td>
	</tr>
</table>

<form action="<c:url value="/PaymentConfirm"/>" method="post">
<table class="table table-dark table-striped-xl">
<tr>
<td colspan="2"><h3>Payment Method</h3></td>
</tr>
<tr>
<td>Payment Mode</td>
<td colspan="2">
<input type="radio" name="pmode" value="Credit Card"/>Credit Card
<input type="radio" name="pmode" value="Net Banking"/>Net Banking
<input type="radio" name="pmode" value="Cash On Delivery"/>Cash On Delivery
</td>

<tr>
<td>Shipment Address</td>
<td><textarea name="shippingAddr"></textarea></td>
</tr>
<tr>
<td colspan="2"><input type="submit" value="Pay"/></td>
</tr>
</table>
</form>
<%@include file="Fotter.jsp"  %>