<%@include file="/WEB-INF/view/Header.jsp"  %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="container">
<h3 align="center">Add Products</h3>
<div class="table-responsive-sm">
<form:form method="post" action="InsertProduct" modelAttribute="product" enctype="multipart/form-data" >
<table class="table table-hover" align="center">
	<tr align="center" class="table-success">
		<td colspan="2">Product Details</td>
	</tr>
	
	<tr align="center" class="table-light">
		<td>Product Name</td>
		<td><form:input path="productName"/></td>
	</tr>
	
	<tr align="center" class="table-light">
		<td>Category</td>
		<td>
		<form:select path="categoryId">
		<form:option value="0" label="----select----"/>
		<form:options items="${catlist}"/>
		</form:select>
		</td>
	</tr>
	
	<tr align="center" class="table-light">
		<td>Supplier ID</td>
		<td>
		<form:select path="supplierId">
		<form:option value="0" label="----select-----"/>
		<form:options items="${suplist}"/>
		</form:select>
		</td>
	</tr>
	
	
	<tr align="center" class="table-light">
		<td>Price</td>
		<td><form:input path="price"/></td>
	</tr>
	
	<tr align="center" class="table-light">
		<td>Stock</td>
		<td><form:input path="stock"/></td>
	</tr>
	
	<tr align="center" class="table-light">
		<td>Product Desc</td>
		<td><form:input path="prodDesc"/></td>
	</tr>

	<tr align="center" class="table-light">
		<td>Product Image</td>
		<td><form:input type="file" path="pimage"/>
	</tr>
	
	<tr>
	<td colspan="2">
	<center><input type="submit" value="Submit"/></center>
	</td>
	</tr>
	 
</table>
</form:form>
</div>
</div>
<br>
<br>
<br>
<br>

<%@include file="Fotter.jsp" %>
