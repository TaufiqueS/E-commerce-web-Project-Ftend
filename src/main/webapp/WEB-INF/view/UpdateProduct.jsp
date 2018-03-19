<%@include file="/WEB-INF/view/Header.jsp"  %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="container">
<h3 align="center">Update Products</h3>
<div class="table-responsive-sm">
<form:form method="post" action="UpdateProduct" modelAttribute="product" enctype="multipart/form-data" >
<table class="table table-hover" align="center">
	
	<tr align="center" bgcolor="orange"><td>Product Id</td>
	<td><form:input path="productId" readonly="true"/></td>
	</tr>
	<tr align="center" bgcolor="orange">
		<td>Product Name</td>
		<td><form:input path="productName"/></td>
	</tr>
	
	<tr align="center" bgcolor="orange">
		<td>Category</td>
		<td>
		<form:select path="categoryId">
		<form:option value="0" label="----select----"/>
		<form:options items="${catlist}"/>
		</form:select>
		</td>
	</tr>
	
	<tr align="center" bgcolor="orange">
		<td>Supplier ID</td>
		<td><form:input path="supplierId"/></td>
	</tr>
	
	
	<tr align="center" bgcolor="orange">
		<td>Price</td>
		<td><form:input path="price"/></td>
	</tr>
	
	<tr align="center" bgcolor="orange">
		<td>Stock</td>
		<td><form:input path="stock"/></td>
	</tr>
	
	<tr align="center" bgcolor="orange">
		<td>Product Desc</td>
		<td><form:input path="prodDesc"/></td>
	</tr>

<tr align="center" bgcolor="orange">
		<td>Product Image</td>
		<td><form:input type="file" path="pimage" class="btn btn-primary" />&nbsp;<button type="submit" class="btn btn-primary" >SUBMIT</button></td>
	</tr>
</table>
</form:form>
</div>
</div>
<br>
<br>
<br>
<br>
<br>

