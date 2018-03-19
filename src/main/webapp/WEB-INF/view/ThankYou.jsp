<%@include file="Header.jsp"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<h3>	Thank You Shopping </h3>

<c:forEach items="${orderList}" var="order" >
<div> 
<h4> Dear ${order.username}, your order on ${order.orderDate} with ID ${order.orderId} has been shipped to the following address,  ${order.shippingAddr}.Your payment mode is ${order.tranType} for the amount  ${order.totalAmount}
</h4>
</div>
</c:forEach>

<p> YourOrder has bean Confirmed </p>
<a href="<c:url value="/Home"/>" class="btn-btn-info">Continue Shopping</a>
<%@include file="Fotter.jsp"  %>