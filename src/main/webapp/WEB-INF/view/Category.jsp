<%@include file="Header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<h3 align="center">Category Page</h3>

<form:form action="InsertCategory" method="post">
	<table align="center">
		<tr>
			<td>Category Name</td>
			<td><input type="text" id="catname" name="catname" /></td>
		</tr>

		<tr>
			<td>Category Desc</td>
			<td><input type="text" id="catdesc" name="catdesc" /></td>
		</tr>

		<tr>
			<td colspan="2"><input type="submit" class="btn btn-success"
				value="SUBMIT" /> <input type="reset" value="RESET" /></td>
		</tr>
	</table>
</form:form>

<div class="container">
	<div class="jumbotron">
		<table align="center">
			<tr>
				<td>Category Id</td>
				<td>Category Name</td>
				<td>Category Desc</td>
				<td>Operation</td>
			</tr>

			<c:forEach items="${listCategories}" var="category">
				<tr>
					<td>${category.categoryId}</td>
					<td>${category.categoryName}</td>
					<td>${category.categoryDesc}</td>
					<td><a
						href="<c:url value="/updateCategory${category.categoryId}"/>">Update</a>/
						<a href="<c:url value="/deleteCategory/${category.categoryId}"/>">Delete</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
